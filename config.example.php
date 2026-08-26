<?php
// Copy to config.php and fill in. config.php is gitignored — never commit credentials.
return [
    'db' => [
        'host'   => 'localhost',
        'name'   => 'markgrace',
        'user'   => 'CHANGE_ME',
        'pass'   => 'CHANGE_ME',
        'charset'=> 'utf8mb4',
    ],
    // Anyone with the URL can edit unless you set a passphrase here.
    // Leave null for an open page; set a string to require sign-in.
    'passphrase' => null,
];
