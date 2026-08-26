/* Mark Grace Card Tracker — talks to api/ , state lives in MySQL. */
(function () {
  'use strict';

  var API = 'api/';
  var DATA = [];                       // sections from the server
  var fStatus = 'all', fYear = 'all', fQ = '', fType = 'all';
  // The list is ~2,500 cards. Rebuilding every row on each keystroke or chip
  // tap locks the main thread for seconds on a phone, so render a window of
  // them and let the user ask for the rest.
  var PAGE = 300, showAll = false;
  var list  = document.getElementById('list');
  var toast = document.getElementById('toast');
  var CHECK = '<svg viewBox="0 0 16 16" fill="none" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M2.5 8.5l3.5 3.5 7.5-7.5"/></svg>';
  var tid;

  // Relics, autos and parallels stay in the list — they're just labelled.
  // Brand mark. If you drop a real logo at img/brands/<slug>.png it is used
  // automatically; otherwise the brand shows as a coloured wordmark chip.
  var BRAND_LOGOS = window.MG_BRAND_LOGOS || {};
  function brandMark(c) {
    if (!c.brand) return '';
    var slug = c.brandSlug || '';
    if (BRAND_LOGOS[slug]) {
      return '<img class="brandlogo" src="img/brands/' + esc(slug) + '.png" alt="' +
             esc(c.brand) + '" loading="lazy">';
    }
    return '<span class="brand b-' + esc(slug) + '">' + esc(c.brand) + '</span>';
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
    if (!r.ok) throw new Error((d && d.error) || ('HTTP ' + r.status));
    return d;
  }

  /* ---------- rendering ---------- */
  function render() {
    var q = fQ.trim().toLowerCase(), shown = 0, matched = 0, out = [];
    var budget = showAll ? Infinity : PAGE;
    DATA.forEach(function (sec) {
      if (fYear !== 'all' && sec.year !== fYear) return;
      var rows = sec.cards.filter(function (c) {
        if (fStatus === 'owned'  && !c.owned) return false;
        if (fStatus === 'needed' &&  c.owned) return false;
        if (!typeOk(c)) return false;
        if (q && (sec.year + ' ' + c.num + ' ' + c.set).toLowerCase().indexOf(q) < 0) return false;
        return true;
      });
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
          '<div class="meta"><div class="set">' + esc(c.set) + '</div>' +
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
  async function toggle(li) {
    var id = li.dataset.id, card = find(id);
    if (!card || li.classList.contains('saving')) return;
    var next = !card.owned;

    // optimistic paint, then confirm against the server
    card.owned = next;
    li.classList.toggle('owned', next);
    li.setAttribute('aria-pressed', next ? 'true' : 'false');
    li.classList.add('saving');
    stats();

    try {
      await api('?action=toggle', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id: id, owned: next })
      });
      li.classList.remove('saving');
      if (fStatus !== 'all') render(); else refreshYearCount(id);
    } catch (e) {
      card.owned = !next;                       // roll back — the DB never took it
      li.classList.remove('saving');
      render();
      if (e.message !== 'locked') say('Not saved: ' + e.message, true);
    }
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
    var li = e.target.closest('li[data-id]'); if (li) toggle(li);
  });
  list.addEventListener('keydown', function (e) {
    if (e.key !== 'Enter' && e.key !== ' ') return;
    var li = e.target.closest('li[data-id]');
    if (li) { e.preventDefault(); toggle(li); }
  });
  document.getElementById('q').addEventListener('input', function (e) {
    showAll = false; fQ = e.target.value; render();
  });
  document.getElementById('statusChips').addEventListener('click', function (e) {
    var b = e.target.closest('.chip'); if (!b) return;
    showAll = false; fStatus = b.dataset.f;
    [].forEach.call(this.querySelectorAll('.chip'), function (c) {
      c.setAttribute('aria-pressed', c === b ? 'true' : 'false');
    });
    render();
  });
  document.getElementById('typeChips').addEventListener('click', function (e) {
    var b = e.target.closest('.chip'); if (!b) return;
    showAll = false; fType = b.dataset.t;
    [].forEach.call(this.querySelectorAll('.chip'), function (c) {
      c.setAttribute('aria-pressed', c === b ? 'true' : 'false');
    });
    render();
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
      showAll = false; fYear = b.dataset.y;
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

  /* ---------- boot ---------- */
  async function boot() {
    try {
      var d = await api('?action=cards');
      DATA = d.sections || [];
      yearChips();
      render();
    } catch (e) {
      if (e.message !== 'locked') {
        list.innerHTML = '<div class="empty">Could not load cards: ' + esc(e.message) + '</div>';
      }
    }
  }

  (async function () {
    try {
      var s = await api('?action=session');
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
