/* Mark Grace Card Tracker — offline shell.
   Card data is always fetched fresh; the shell and images are cached so the
   app opens instantly and survives a dead connection at a card show. */
const VERSION = 'mg-v13';
const SHELL = [
  './',
  './assets/app.css?v=17',
  './assets/app.js?v=17',
  './icons/icon-192.png'
];

self.addEventListener('install', e => {
  e.waitUntil(
    caches.open(VERSION)
      .then(c => c.addAll(SHELL))
      .then(() => self.skipWaiting())
      .catch(() => self.skipWaiting())   // never block install on one bad asset
  );
});

self.addEventListener('activate', e => {
  e.waitUntil(
    caches.keys()
      .then(keys => Promise.all(keys.filter(k => k !== VERSION).map(k => caches.delete(k))))
      .then(() => self.clients.claim())
  );
});

self.addEventListener('fetch', e => {
  const req = e.request;
  if (req.method !== 'GET') return;                 // never cache toggles
  const url = new URL(req.url);
  if (url.origin !== location.origin) return;

  // Passkey ceremonies and the session probe must never be served from cache.
  // A challenge is single-use and expires server-side, so a cached one is
  // guaranteed to fail; a cached session would misreport whether writes are
  // unlocked. Let these go straight to the network.
  if (url.pathname.includes('/api/') && /action=(passkey|session)/.test(url.search)) {
    return;
  }

  // Card data: always try the network, fall back to the last good copy.
  if (url.pathname.includes('/api/')) {
    e.respondWith(
      fetch(req)
        .then(res => {
          const copy = res.clone();
          caches.open(VERSION).then(c => c.put(req, copy));
          return res;
        })
        .catch(() => caches.match(req))
    );
    return;
  }

  // Card images never change once published — serve from cache when we have them.
  if (url.pathname.includes('/img/') || url.pathname.includes('/icons/')) {
    e.respondWith(
      caches.match(req).then(hit => hit || fetch(req).then(res => {
        const copy = res.clone();
        caches.open(VERSION).then(c => c.put(req, copy));
        return res;
      }))
    );
    return;
  }

  // Shell: network first so a deploy lands immediately, cache as backup.
  e.respondWith(
    fetch(req)
      .then(res => {
        const copy = res.clone();
        caches.open(VERSION).then(c => c.put(req, copy));
        return res;
      })
      .catch(() => caches.match(req).then(hit => hit || caches.match('./')))
  );
});
