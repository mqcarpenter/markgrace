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

    // Anyone with the URL can view and edit unless you set a passphrase.
    // Leave null for an open page; set a string to require sign-in.
    'passphrase' => null,
];
