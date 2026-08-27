<?php
// Copy to config.php and fill in. config.php is gitignored — never commit credentials.
return [
    // The WEB APP account. Create it with grants.sql: it holds only
    // SELECT + UPDATE on the cards table, so a bug or a leaked config
    // cannot drop data or reach another database. Do not put root here.
    'db' => [
        'host'    => 'localhost',
        'name'    => 'markgrace',
        'user'    => 'markgrace_app',
        'pass'    => 'CHANGE_ME_APP',
        'charset' => 'utf8mb4',
    ],

    // The IMPORTER account, used only by `php seed.php` on the command line.
    // It additionally holds INSERT. Web requests never use it.
    // Delete this block and seed.php falls back to the 'db' account above
    // — which then can't insert new cards.
    'db_admin' => [
        'host'    => 'localhost',
        'name'    => 'markgrace',
        'user'    => 'markgrace_seed',
        'pass'    => 'CHANGE_ME_SEED',
        'charset' => 'utf8mb4',
    ],

    // Set true to return the real error text from api/ instead of a bare
    // "Server error." Useful while installing; turn it off afterwards.
    'debug' => false,

    // Anyone with the URL can VIEW the page unless you set a passphrase.
    // Leave null for an open page; set a string to require sign-in to read.
    // This is separate from the passkey below, which governs writing.
    'passphrase' => null,

    // ---- Passkeys: who may CHANGE a card ----------------------------
    //
    // Viewing stays open. Marking a card owned requires a signature from a
    // registered device — on an iPhone, a Face ID prompt. Until you register
    // the first device the page behaves exactly as before, so nothing breaks
    // on upgrade; the moment you register one, everything else is read-only.
    //
    // Register from the iPhone itself: open the page and tap "Unprotected".

    // A one-time key for enrolling ADDITIONAL devices later, or for
    // re-enrolling after you erase the phone. The first device needs no key.
    // Generate one with:  php -r 'echo bin2hex(random_bytes(16)), "\n";'
    // Leave null and no further device can ever enrol over the web — the
    // safest setting, since recovery is then a DELETE in phpMyAdmin.
    'enroll_key' => null,

    // How long one Face ID prompt keeps writes unlocked, in seconds.
    // Marking a stack of cards shouldn't prompt every single time.
    'passkey_ttl' => 900,

    // Normally detected from the request. Set these only if the app is
    // reached at more than one hostname, or sits behind a proxy that
    // rewrites Host — a passkey is bound to exactly one domain.
    // 'rp_id'   => 'example.com',
    // 'origins' => ['https://example.com', 'https://www.example.com'],
];
