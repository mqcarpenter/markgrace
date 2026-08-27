/* Mark Grace Card Tracker — talks to api/ , state lives in MySQL. */
(function () {
  'use strict';

  var API = 'api/';
  var DATA = [];                       // sections from the server
  var fStatus = 'all', fYear = 'all', fQ = '', fType = 'all', fBrand = 'all';
  var view = 'list';                   // 'list' | 'binder'
  var binderPage = 0;                  // which nine-pocket page is showing
  var devices = 0, writeWindow = 0, windowTimer = null;
  // The list is ~2,500 cards. Rebuilding every row on each keystroke or chip
  // tap locks the main thread for seconds on a phone, so render a window of
  // them and let the user ask for the rest.
  var PAGE = 300, showAll = false;
  var list  = document.getElementById('list');
  var toast = document.getElementById('toast');
  var CHECK = '<svg viewBox="0 0 16 16" fill="none" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M2.5 8.5l3.5 3.5 7.5-7.5"/></svg>';
  var tid;

  // Relics, autos and parallels stay in the list — they're just labelled.
  /* Brand marks.
     Any file dropped at img/brands/<slug>.(png|svg|webp) is used automatically —
     no code change needed. We probe each slug once at boot and fall back to a
     coloured wordmark for brands with no logo file. */
  var LOGO = {}, LOGO_DARK = {};      // slug -> url, or false

  function findFile(base) {
    return new Promise(function (done) {
      var exts = ['png', 'svg', 'webp'], i = 0;
      (function next() {
        if (i >= exts.length) return done(false);
        var url = base + '.' + exts[i++];
        var im = new Image();
        im.onload  = function () { done(url); };
        im.onerror = next;
        im.src = url;
      })();
    });
  }

  function probeLogos(slugs) {
    return Promise.all(slugs.map(function (slug) {
      return Promise.all([
        findFile('img/brands/' + slug),
        findFile('img/brands/' + slug + '-dark')
      ]).then(function (r) { LOGO[slug] = r[0]; LOGO_DARK[slug] = r[1]; });
    }));
  }

  function brandMark(c) {
    if (!c.brand) return '';
    var slug = c.brandSlug || '';
    if (!LOGO[slug]) {
      return '<span class="brand b-' + esc(slug) + '">' + esc(c.brand) + '</span>';
    }
    var alt = esc(c.brand);
    // A dark-mode variant is optional. With one, the two swap by theme; with
    // none, the single logo is used in both.
    var cls = LOGO_DARK[slug] ? ' lm' : '';
    var out = '<img class="brandlogo' + cls + '" src="' + esc(LOGO[slug]) +
              '" alt="' + alt + '" title="' + alt + '" loading="lazy">';
    if (LOGO_DARK[slug]) {
      out += '<img class="brandlogo dm" src="' + esc(LOGO_DARK[slug]) +
             '" alt="' + alt + '" title="' + alt + '" loading="lazy">';
    }
    return out;
  }

  function badges(c) {
    var out = '';
    if (c.auto)     out += '<span class="tag t-auto">AUTO</span>';
    if (c.relic)    out += '<span class="tag t-relic">RELIC</span>';
    if (c.parallel) out += '<span class="tag t-par">PARALLEL</span>';
    if (c.insert)   out += '<span class="tag t-ins">INSERT</span>';
    var sn = (c.tags || '').split(',').filter(function (t) { return /^SN\d+$/.test(t); })[0];
    if (sn) out += '<span class="tag t-sn">/' + esc(sn.slice(2)) + '</span>';
    return out;
  }

  function esc(s) {
    return String(s == null ? '' : s).replace(/[&<>"]/g, function (c) {
      return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;' }[c];
    });
  }
  function say(msg, bad) {
    toast.textContent = msg;
    toast.classList.toggle('bad', !!bad);
    toast.classList.add('show');
    clearTimeout(tid);
    tid = setTimeout(function () { toast.classList.remove('show'); }, 2600);
  }
  async function api(path, opts) {
    var r = await fetch(API + path, Object.assign({ credentials: 'same-origin' }, opts || {}));
    var d = null;
    try { d = await r.json(); } catch (e) {}
    if (r.status === 401) { showGate(); throw new Error('locked'); }
    if (!r.ok) {
      var err = new Error((d && d.error) || ('HTTP ' + r.status));
      err.status = r.status;
      err.code = d && d.error;
      throw err;
    }
    return d;
  }

  /* ---------- passkey ----------
     Reading is always open. Writing needs a signature from a registered
     device, which on an iPhone means a Face ID prompt. One prompt opens a
     short window (default 15 min) so marking a stack of cards doesn't ask
     over and over. */

  var b64 = {
    // WebAuthn hands us ArrayBuffers and wants base64url strings back.
    enc: function (buf) {
      var b = '', a = new Uint8Array(buf);
      for (var i = 0; i < a.length; i++) b += String.fromCharCode(a[i]);
      return btoa(b).replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '');
    },
    dec: function (s) {
      s = String(s).replace(/-/g, '+').replace(/_/g, '/');
      while (s.length % 4) s += '=';
      var raw = atob(s), a = new Uint8Array(raw.length);
      for (var i = 0; i < raw.length; i++) a[i] = raw.charCodeAt(i);
      return a.buffer;
    }
  };

  function passkeySupported() {
    return !!(window.PublicKeyCredential && navigator.credentials &&
              navigator.credentials.create && window.isSecureContext);
  }

  function setWriteWindow(secs) {
    writeWindow = secs || 0;
    clearInterval(windowTimer);
    if (writeWindow > 0) {
      windowTimer = setInterval(function () {
        writeWindow -= 1;
        if (writeWindow <= 0) { clearInterval(windowTimer); writeWindow = 0; }
        paintLock();
      }, 1000);
    }
    paintLock();
  }

  function paintLock() {
    var el = document.getElementById('lockBtn');
    if (!el) return;
    if (!devices) {
      el.className = 'lock open';
      el.textContent = 'Unprotected';
      el.title = 'Anyone can edit. Register this iPhone to lock writing to it.';
      return;
    }
    if (writeWindow > 0) {
      var m = Math.floor(writeWindow / 60), s = writeWindow % 60;
      el.className = 'lock unlocked';
      el.textContent = 'Unlocked ' + m + ':' + (s < 10 ? '0' : '') + s;
      el.title = 'Tap to lock again now.';
    } else {
      el.className = 'lock locked';
      el.textContent = 'Locked';
      el.title = 'Tap to unlock with Face ID.';
    }
  }

  /** Face ID prompt → a fresh write window. Returns true when it opened. */
  async function unlockWrites() {
    if (!passkeySupported()) {
      say('This browser cannot use passkeys.', true);
      return false;
    }
    try {
      var o = await api('?action=passkey-auth-options');
      var cred = await navigator.credentials.get({
        publicKey: {
          challenge: b64.dec(o.challenge),
          rpId: o.rpId,
          allowCredentials: (o.allowCredentials || []).map(function (c) {
            return { type: 'public-key', id: b64.dec(c.id) };
          }),
          userVerification: o.userVerification,
          timeout: o.timeout
        }
      });
      if (!cred) return false;
      var d = await api('?action=passkey-auth', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          id: b64.enc(cred.rawId),
          clientDataJSON: b64.enc(cred.response.clientDataJSON),
          authenticatorData: b64.enc(cred.response.authenticatorData),
          signature: b64.enc(cred.response.signature)
        })
      });
      setWriteWindow(d.writeWindow);
      say('Unlocked.');
      return true;
    } catch (e) {
      // A cancelled Face ID prompt throws too; that isn't worth a red toast.
      if (e && (e.name === 'NotAllowedError' || e.name === 'AbortError')) return false;
      if (e.message !== 'locked') say('Could not unlock: ' + e.message, true);
      return false;
    }
  }

  /** One-time enrolment of this device. */
  async function registerDevice(enrollKey) {
    if (!passkeySupported()) {
      say('This browser cannot use passkeys.', true);
      return false;
    }
    try {
      // POSTed, not in the query string: a key in the URL would be written to
      // the server's access log and sit there in plain text.
      var o = await api('?action=passkey-register-options', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ enroll_key: enrollKey || '' })
      });
      var cred = await navigator.credentials.create({
        publicKey: {
          challenge: b64.dec(o.challenge),
          rp: o.rp,
          user: {
            id: b64.dec(o.user.id),
            name: o.user.name,
            displayName: o.user.displayName
          },
          pubKeyCredParams: o.pubKeyCredParams,
          excludeCredentials: (o.excludeCredentials || []).map(function (c) {
            return { type: 'public-key', id: b64.dec(c.id) };
          }),
          authenticatorSelection: o.authenticatorSelection,
          timeout: o.timeout,
          attestation: o.attestation
        }
      });
      if (!cred) return false;
      var d = await api('?action=passkey-register', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          enroll_key: enrollKey || '',
          label: /iPhone|iPad/.test(navigator.userAgent) ? 'iPhone' : 'This device',
          clientDataJSON: b64.enc(cred.response.clientDataJSON),
          attestationObject: b64.enc(cred.response.attestationObject)
        })
      });
      devices += 1;
      setWriteWindow(d.writeWindow);
      say('This device is registered. Only it can change cards now.');
      return true;
    } catch (e) {
      if (e && (e.name === 'NotAllowedError' || e.name === 'AbortError')) return false;
      if (e && e.name === 'InvalidStateError') {
        say('This device is already registered.', true);
        return false;
      }
      say('Could not register: ' + e.message, true);
      return false;
    }
  }

  /* ---------- filtering ---------- */
  function matches(sec, c, q) {
    if (fStatus === 'owned'  && !c.owned) return false;
    if (fStatus === 'needed' &&  c.owned) return false;
    if (!typeOk(c)) return false;
    if (fBrand !== 'all' && (c.brandSlug || '') !== fBrand) return false;
    if (q && (sec.year + ' ' + c.num + ' ' + c.set + ' ' + (c.variant || '') +
              ' ' + (c.brand || '')).toLowerCase().indexOf(q) < 0) return false;
    return true;
  }

  function filtered() {
    var q = fQ.trim().toLowerCase(), out = [];
    DATA.forEach(function (sec) {
      if (fYear !== 'all' && sec.year !== fYear) return;
      sec.cards.forEach(function (c) {
        if (matches(sec, c, q)) out.push({ sec: sec, card: c });
      });
    });
    return out;
  }

  /* ---------- rendering ---------- */
  function render() {
    document.body.classList.toggle('binderview', view === 'binder');
    if (view === 'binder') { renderBinder(); return; }
    renderList();
  }

  function renderList() {
    var q = fQ.trim().toLowerCase(), shown = 0, matched = 0, out = [];
    var budget = showAll ? Infinity : PAGE;
    DATA.forEach(function (sec) {
      if (fYear !== 'all' && sec.year !== fYear) return;
      var rows = sec.cards.filter(function (c) { return matches(sec, c, q); });
      if (!rows.length) return;
      matched += rows.length;
      if (shown >= budget) return;                    // counted, not drawn
      var slice = rows.slice(0, budget - shown);
      shown += slice.length;
      var oc = sec.cards.filter(function (c) { return c.owned; }).length;
      out.push('<h2 class="yr" data-sec="' + esc(sec.title) + '"><span>' + esc(sec.title) +
               '</span><em>' + oc + ' / ' + sec.cards.length + '</em></h2><ul>');
      slice.forEach(function (c) {
        out.push(
          '<li class="' + (c.owned ? 'owned' : '') + '" data-id="' + esc(c.id) +
            '" role="button" tabindex="0" aria-pressed="' + (c.owned ? 'true' : 'false') + '">' +
          (c.img ? '<img class="thumb" loading="lazy" alt="" src="img/' + esc(c.img) + '">'
                 : '<div class="noimg">no img</div>') +
          '<div class="meta"><div class="set">' + esc(c.set) +
            (c.variant ? '<span class="variant">' + esc(c.variant) + '</span>' : '') + '</div>' +
          '<div class="tagrow">' + brandMark(c) + '<span class="num">' + esc(c.num) + '</span>' + badges(c) + '</div></div>' +
          '<div class="box">' + CHECK + '</div></li>');
      });
      out.push('</ul>');
    });
    if (matched > shown) {
      out.push('<div class="more"><div>Showing ' + shown.toLocaleString() +
               ' of ' + matched.toLocaleString() + ' matching cards.</div>' +
               '<button type="button" id="showAll">Show all ' + matched.toLocaleString() + '</button>' +
               '<div class="hint">Searching or picking a year is faster than loading everything.</div></div>');
    }
    list.innerHTML = out.join('');
    var btn = document.getElementById('showAll');
    if (btn) btn.addEventListener('click', function () { showAll = true; render(); });
    document.getElementById('empty').classList.toggle('hide', shown > 0);
    stats();
  }

  /* ---------- binder ----------
     A nine-pocket page, the way the cards actually sit in the album: three
     across, three down, left-to-right. Tapping a card flips it; the pocket's
     corner button is what marks it owned, so a flip never changes state. */
  var POCKETS = 9;

  function pocket(entry, i) {
    var c = entry.card;
    var back = c.imgBack ? 'img/' + esc(c.imgBack) : '';
    var acquired = c.acquired_at ? String(c.acquired_at).slice(0, 10) : '';
    return '' +
      '<div class="pocket' + (c.owned ? ' filled' : '') + '" data-id="' + esc(c.id) + '"' +
        ' style="--i:' + i + '">' +
        '<div class="sleeve">' +
          '<div class="card3d">' +
            '<div class="face front">' +
              (c.img
                ? '<img loading="lazy" alt="' + esc(c.set) + ' #' + esc(c.num) + '" src="img/' + esc(c.img) + '">'
                : '<div class="blank"><span>' + esc(c.set) + '</span><b>#' + esc(c.num) + '</b></div>') +
              '<div class="gloss"></div>' +
            '</div>' +
            '<div class="face back">' +
              (back
                ? '<img loading="lazy" alt="Back of ' + esc(c.set) + '" src="' + back + '">'
                : '<div class="backfill">' +
                    '<div class="bset">' + esc(c.set) + '</div>' +
                    (c.variant ? '<div class="bvar">' + esc(c.variant) + '</div>' : '') +
                    '<div class="bnum">#' + esc(c.num) + '</div>' +
                    '<div class="bbadges">' + badges(c) + '</div>' +
                    '<div class="byear">' + esc(entry.sec.year) + '</div>' +
                    (acquired ? '<div class="bacq">Added ' + esc(acquired) + '</div>' : '') +
                  '</div>') +
              '<div class="gloss"></div>' +
            '</div>' +
          '</div>' +
        '</div>' +
        '<button class="pmark" type="button" data-mark="' + esc(c.id) + '"' +
          ' aria-pressed="' + (c.owned ? 'true' : 'false') + '"' +
          ' title="' + (c.owned ? 'Owned — tap to unmark' : 'Mark owned') + '">' + CHECK + '</button>' +
        '<div class="plabel"><span>' + esc(c.set) + '</span><b>#' + esc(c.num) + '</b></div>' +
      '</div>';
  }

  function renderBinder() {
    var all = filtered();
    var pages = Math.max(1, Math.ceil(all.length / POCKETS));
    if (binderPage >= pages) binderPage = pages - 1;
    if (binderPage < 0) binderPage = 0;

    var slice = all.slice(binderPage * POCKETS, binderPage * POCKETS + POCKETS);
    var out = ['<div class="binder"><div class="rings" aria-hidden="true">' +
               new Array(11).join('<i></i>') + '</div>' +
               '<div class="page" id="page">'];

    for (var i = 0; i < POCKETS; i++) {
      out.push(slice[i] ? pocket(slice[i], i)
                        : '<div class="pocket empty" style="--i:' + i + '"><div class="sleeve"></div></div>');
    }
    out.push('</div>');

    var owned = slice.filter(function (e) { return e.card.owned; }).length;
    var label = fYear !== 'all' ? fYear : 'All years';
    out.push('<div class="pagebar">' +
      '<button class="pnav" id="prevPage" type="button"' + (binderPage === 0 ? ' disabled' : '') + '>&lsaquo;</button>' +
      '<div class="pmeta"><b>' + esc(label) + '</b>' +
        '<span>Page ' + (binderPage + 1) + ' of ' + pages.toLocaleString() +
        ' &middot; ' + owned + ' of ' + slice.length + ' in this page</span></div>' +
      '<button class="pnav" id="nextPage" type="button"' + (binderPage >= pages - 1 ? ' disabled' : '') + '>&rsaquo;</button>' +
      '</div></div>');

    list.innerHTML = out.join('');
    document.getElementById('empty').classList.toggle('hide', all.length > 0);

    var prev = document.getElementById('prevPage'), next = document.getElementById('nextPage');
    if (prev) prev.addEventListener('click', function () { turnPage(-1); });
    if (next) next.addEventListener('click', function () { turnPage(1); });
    stats();
  }

  /** The page-turn: the leaf rotates away, we swap content, it rotates in.
      The lock is a timestamp, not a flag: a backgrounded tab has its timers
      throttled hard, and a plain boolean would stay stuck long after the
      animation should have ended, leaving the binder unnavigable. */
  var turning = 0;
  var TURN_MS = 620;
  function turnPage(dir) {
    if (turning && Date.now() - turning < TURN_MS * 2) return;
    var page = document.getElementById('page');
    var all = filtered();
    var pages = Math.max(1, Math.ceil(all.length / POCKETS));
    var target = binderPage + dir;
    if (target < 0 || target >= pages) return;

    if (!page || !supportsAnim()) { binderPage = target; renderBinder(); return; }
    turning = Date.now();
    page.classList.add(dir > 0 ? 'turn-out-left' : 'turn-out-right');
    setTimeout(function () {
      binderPage = target;
      renderBinder();
      var fresh = document.getElementById('page');
      if (fresh) fresh.classList.add(dir > 0 ? 'turn-in-right' : 'turn-in-left');
      setTimeout(function () {
        if (fresh) fresh.classList.remove('turn-in-right', 'turn-in-left');
        turning = 0;
      }, 320);
    }, 300);
  }

  function supportsAnim() {
    return !matchMedia('(prefers-reduced-motion: reduce)').matches;
  }

  // Relics, autos and parallels are never hidden by default — this only
  // narrows the view when the user picks a type chip.
  function typeOk(c) {
    switch (fType) {
      case 'cards':    return !c.auto && !c.relic;
      case 'auto':     return c.auto;
      case 'relic':    return c.relic;
      case 'parallel': return c.parallel;
      default:         return true;      // 'all'
    }
  }

  function stats() {
    var tot = 0, own = 0;
    DATA.forEach(function (s) {
      s.cards.forEach(function (c) { tot++; if (c.owned) own++; });
    });
    var p = tot ? Math.round(own / tot * 100) : 0;
    document.getElementById('pctNum').textContent = p + '%';
    document.getElementById('pctTxt').textContent = own + ' of ' + tot + ' owned';
    document.getElementById('fill').style.width = p + '%';
  }

  function find(id) {
    for (var i = 0; i < DATA.length; i++) {
      var cs = DATA[i].cards;
      for (var j = 0; j < cs.length; j++) if (cs[j].id === id) return cs[j];
    }
    return null;
  }

  /* ---------- toggling ---------- */
  async function toggle(el) {
    var id = el.dataset.id || el.dataset.mark, card = find(id);
    if (!card || el.classList.contains('saving')) return;
    var next = !card.owned;

    // optimistic paint, then confirm against the server
    card.owned = next;
    el.classList.toggle('owned', next);
    el.setAttribute('aria-pressed', next ? 'true' : 'false');
    var host = el.closest('.pocket');
    if (host) {
      host.classList.toggle('filled', next);
      var mark = host.querySelector('.pmark');
      if (mark) mark.setAttribute('aria-pressed', next ? 'true' : 'false');
    }
    el.classList.add('saving');
    stats();

    try {
      await save(id, next);
      el.classList.remove('saving');
      // Only repaint when the card no longer belongs where it is. A full
      // render in binder view would drop any card the user had flipped over.
      if (fStatus !== 'all') render();
      else if (view === 'binder') refreshPageMeta();
      else refreshYearCount(id);
    } catch (e) {
      card.owned = !next;                       // roll back — the DB never took it
      el.classList.remove('saving');
      render();
      if (e.message !== 'locked' && e.code !== 'passkey_required') {
        say('Not saved: ' + e.message, true);
      }
    }
  }

  /**
   * A write the server refuses for want of a passkey isn't a failure — it's a
   * prompt. Ask for Face ID once, then send the same write again.
   */
  async function save(id, owned) {
    var body = JSON.stringify({ id: id, owned: owned });
    var opts = { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: body };
    try {
      return await api('?action=toggle', opts);
    } catch (e) {
      if (e.code !== 'passkey_required') throw e;
      setWriteWindow(0);
      var ok = await unlockWrites();
      if (!ok) throw e;
      return await api('?action=toggle', opts);
    }
  }

  // keep the binder's "6 of 9 in this page" honest without a full repaint
  function refreshPageMeta() {
    var meta = document.querySelector('.pmeta span');
    if (!meta) return;
    var pockets = list.querySelectorAll('.pocket:not(.empty)');
    var owned = list.querySelectorAll('.pocket.filled').length;
    var pages = Math.max(1, Math.ceil(filtered().length / POCKETS));
    meta.textContent = 'Page ' + (binderPage + 1) + ' of ' + pages.toLocaleString() +
                       ' · ' + owned + ' of ' + pockets.length + ' in this page';
  }

  // keep the "3 / 18" header honest without a full repaint
  function refreshYearCount(id) {
    var sec = null;
    for (var i = 0; i < DATA.length; i++) {
      if (DATA[i].cards.some(function (c) { return c.id === id; })) { sec = DATA[i]; break; }
    }
    if (!sec) return;
    var h = list.querySelector('h2.yr[data-sec="' + (window.CSS && CSS.escape
              ? CSS.escape(sec.title) : sec.title.replace(/"/g, '\\"')) + '"] em');
    if (h) {
      var oc = sec.cards.filter(function (c) { return c.owned; }).length;
      h.textContent = oc + ' / ' + sec.cards.length;
    }
  }

  /* ---------- events ---------- */
  list.addEventListener('click', function (e) {
    // Binder: the corner button marks, the card itself flips.
    var mark = e.target.closest('.pmark');
    if (mark) { e.stopPropagation(); toggle(mark); return; }

    var pk = e.target.closest('.pocket:not(.empty)');
    if (pk) { pk.classList.toggle('flipped'); return; }

    var li = e.target.closest('li[data-id]'); if (li) toggle(li);
  });
  list.addEventListener('keydown', function (e) {
    if (e.key !== 'Enter' && e.key !== ' ') return;
    var li = e.target.closest('li[data-id]');
    if (li) { e.preventDefault(); toggle(li); }
  });
  document.getElementById('q').addEventListener('input', function (e) {
    showAll = false; binderPage = 0; fQ = e.target.value; render();
  });
  document.getElementById('statusChips').addEventListener('click', function (e) {
    var b = e.target.closest('.chip'); if (!b) return;
    showAll = false; binderPage = 0; fStatus = b.dataset.f;
    [].forEach.call(this.querySelectorAll('.chip'), function (c) {
      c.setAttribute('aria-pressed', c === b ? 'true' : 'false');
    });
    render();
  });
  document.getElementById('typeChips').addEventListener('click', function (e) {
    var b = e.target.closest('.chip'); if (!b) return;
    showAll = false; fType = b.dataset.t; binderPage = 0;
    [].forEach.call(this.querySelectorAll('.chip'), function (c) {
      c.setAttribute('aria-pressed', c === b ? 'true' : 'false');
    });
    render();
  });

  document.getElementById('brand').addEventListener('change', function (e) {
    showAll = false; binderPage = 0; fBrand = e.target.value;
    render();
  });

  document.getElementById('viewToggle').addEventListener('click', function (e) {
    var b = e.target.closest('.chip'); if (!b) return;
    view = b.dataset.v; binderPage = 0;
    [].forEach.call(this.querySelectorAll('.chip'), function (c) {
      c.setAttribute('aria-pressed', c === b ? 'true' : 'false');
    });
    try { localStorage.setItem('markgrace.view', view); } catch (ex) {}
    render();
    window.scrollTo({ top: 0, behavior: 'smooth' });
  });

  document.getElementById('lockBtn').addEventListener('click', async function () {
    if (!devices) {
      if (!passkeySupported()) {
        say('Passkeys need HTTPS and a modern browser.', true);
        return;
      }
      if (!confirm('Register this device?\n\nAfter this, only devices you register ' +
                   'can change which cards are owned. Anyone can still view the page.')) return;
      await registerDevice('');
      return;
    }
    if (writeWindow > 0) {
      try { await api('?action=passkey-lock', { method: 'POST' }); } catch (e) {}
      setWriteWindow(0);
      say('Locked.');
      return;
    }
    await unlockWrites();
  });

  // Swipe between binder pages.
  (function () {
    var x0 = null, y0 = null;
    list.addEventListener('touchstart', function (e) {
      if (view !== 'binder' || e.touches.length !== 1) return;
      x0 = e.touches[0].clientX; y0 = e.touches[0].clientY;
    }, { passive: true });
    list.addEventListener('touchend', function (e) {
      if (x0 === null) return;
      var t = e.changedTouches[0];
      var dx = t.clientX - x0, dy = t.clientY - y0;
      x0 = null;
      // Horizontal, decisive, and not really a scroll.
      if (Math.abs(dx) > 60 && Math.abs(dx) > Math.abs(dy) * 1.8) turnPage(dx < 0 ? 1 : -1);
    }, { passive: true });
  })();

  document.addEventListener('keydown', function (e) {
    if (view !== 'binder') return;
    if (e.target.matches('input, select, textarea')) return;
    if (e.key === 'ArrowLeft')  turnPage(-1);
    if (e.key === 'ArrowRight') turnPage(1);
  });

  document.getElementById('theme').addEventListener('click', function () {
    var cur = document.documentElement.getAttribute('data-theme');
    var dark = cur ? cur === 'dark' : matchMedia('(prefers-color-scheme:dark)').matches;
    document.documentElement.setAttribute('data-theme', dark ? 'light' : 'dark');
    try { localStorage.setItem('markgrace.theme', dark ? 'light' : 'dark'); } catch (e) {}
  });
  try {
    var t = localStorage.getItem('markgrace.theme');
    if (t) document.documentElement.setAttribute('data-theme', t);
  } catch (e) {}

  function yearChips() {
    var yc = document.getElementById('yearChips');
    var h = '<button class="chip year" data-y="all" aria-pressed="true">All yrs</button>';
    DATA.forEach(function (s) {
      h += '<button class="chip year" data-y="' + s.year + '" aria-pressed="false">' + s.year + '</button>';
    });
    yc.innerHTML = h;
    yc.onclick = function (e) {
      var b = e.target.closest('.chip'); if (!b) return;
      showAll = false; binderPage = 0; fYear = b.dataset.y;
      [].forEach.call(yc.querySelectorAll('.chip'), function (c) {
        c.setAttribute('aria-pressed', c === b ? 'true' : 'false');
      });
      render();
      window.scrollTo({ top: 0, behavior: 'smooth' });
    };
  }

  /* ---------- passphrase gate ---------- */
  function showGate() {
    document.getElementById('app').classList.add('hide');
    document.getElementById('gate').classList.remove('hide');
  }
  document.getElementById('gateForm').addEventListener('submit', async function (e) {
    e.preventDefault();
    var err = document.getElementById('gateErr');
    err.textContent = '';
    try {
      var d = await api('?action=login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ passphrase: document.getElementById('gatePass').value })
      });
      if (d && d.ok) {
        document.getElementById('gate').classList.add('hide');
        document.getElementById('app').classList.remove('hide');
        boot();
      }
    } catch (ex) {
      err.textContent = 'Wrong passphrase.';
    }
  });

  /** Brands, biggest first — there are ~90, so a select beats a chip row. */
  function brandOptions() {
    var count = {}, name = {};
    DATA.forEach(function (s) {
      s.cards.forEach(function (c) {
        var slug = c.brandSlug;
        if (!slug) return;
        count[slug] = (count[slug] || 0) + 1;
        name[slug] = c.brand || slug;
      });
    });
    var slugs = Object.keys(count).sort(function (a, b) {
      return count[b] - count[a] || name[a].localeCompare(name[b]);
    });
    var total = slugs.reduce(function (n, s) { return n + count[s]; }, 0);
    var h = '<option value="all">All brands (' + total.toLocaleString() + ')</option>';
    slugs.forEach(function (s) {
      h += '<option value="' + esc(s) + '">' + esc(name[s]) + ' (' + count[s] + ')</option>';
    });
    var sel = document.getElementById('brand');
    sel.innerHTML = h;
    sel.value = fBrand;
  }

  /* ---------- boot ---------- */
  async function boot() {
    try {
      var d = await api('?action=cards');
      DATA = d.sections || [];
      var slugs = {};
      DATA.forEach(function (s) {
        s.cards.forEach(function (c) { if (c.brandSlug) slugs[c.brandSlug] = 1; });
      });
      yearChips();
      brandOptions();
      render();                                   // paint immediately with wordmarks
      probeLogos(Object.keys(slugs)).then(function () {
        if (Object.keys(LOGO).some(function (k) { return LOGO[k] || LOGO_DARK[k]; })) render();
      });
    } catch (e) {
      if (e.message !== 'locked') {
        list.innerHTML = '<div class="empty">Could not load cards: ' + esc(e.message) + '</div>';
      }
    }
  }

  (async function () {
    try {
      var v = localStorage.getItem('markgrace.view');
      if (v === 'binder' || v === 'list') {
        view = v;
        [].forEach.call(document.querySelectorAll('#viewToggle .chip'), function (c) {
          c.setAttribute('aria-pressed', c.dataset.v === view ? 'true' : 'false');
        });
      }
    } catch (e) {}
    try {
      var s = await api('?action=session');
      devices = s.devices || 0;
      setWriteWindow(s.writeWindow || 0);
      if (s.locked) { showGate(); return; }
    } catch (e) {}
    document.getElementById('app').classList.remove('hide');
    boot();
  })();

  /* ---------- installed-app plumbing ---------- */
  if ('serviceWorker' in navigator) {
    window.addEventListener('load', function () {
      navigator.serviceWorker.register('sw.js').catch(function () { /* offline shell is optional */ });
    });
  }

  // In standalone mode an external link would otherwise punt the user into
  // Safari and lose the app frame. Keep same-origin navigation in-app.
  if (window.navigator.standalone) {
    document.addEventListener('click', function (e) {
      var a = e.target.closest('a[href]');
      if (!a) return;
      var url = new URL(a.href, location.href);
      if (url.origin === location.origin && a.target !== '_blank') {
        e.preventDefault();
        location.href = a.href;
      }
    });
  }
})();
