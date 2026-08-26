<?php
declare(strict_types=1);

function config(): array {
    static $cfg = null;
    if ($cfg === null) {
        $path = __DIR__ . '/config.php';
        if (!is_file($path)) {
            http_response_code(500);
            exit('Missing config.php — copy config.example.php to config.php and fill it in.');
        }
        $cfg = require $path;
    }
    return $cfg;
}

function connect(array $d): PDO {
    $dsn = "mysql:host={$d['host']};dbname={$d['name']};charset={$d['charset']}";
    try {
        return new PDO($dsn, $d['user'], $d['pass'], [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES   => false,
        ]);
    } catch (PDOException $e) {
        error_log('DB connect failed: ' . $e->getMessage());
        // On the command line the detail is safe and saves a lot of guessing.
        // Over the web it stays generic so we don't leak host or user names.
        if (PHP_SAPI === 'cli') {
            fwrite(STDERR,
                "Database connection failed.\n" .
                "  user:  {$d['user']}\n" .
                "  host:  {$d['host']}\n" .
                "  db:    {$d['name']}\n" .
                "  mysql: {$e->getMessage()}\n");
            exit(1);
        }
        http_response_code(500);
        exit('Database connection failed. Check config.php.');
    }
}

/**
 * The web app's connection. This account holds SELECT + UPDATE only,
 * so a request can flip an `owned` flag but cannot insert, delete,
 * or reach the schema. Every web request uses this.
 */
function db(): PDO {
    static $pdo = null;
    if ($pdo === null) $pdo = connect(config()['db']);
    return $pdo;
}

/**
 * The importer's connection — additionally holds INSERT. CLI only:
 * calling this from a web request is a bug, so it refuses to run there.
 * Falls back to the app account when no 'db_admin' block is configured.
 */
function db_admin(): PDO {
    if (PHP_SAPI !== 'cli') {
        http_response_code(500);
        exit('db_admin() is command-line only.');
    }
    static $pdo = null;
    if ($pdo === null) {
        $cfg = config();
        $pdo = connect($cfg['db_admin'] ?? $cfg['db']);
    }
    return $pdo;
}

/** True when the page is locked and the visitor has not signed in. */
function locked(): bool {
    $pass = config()['passphrase'] ?? null;
    if ($pass === null || $pass === '') return false;
    if (session_status() === PHP_SESSION_NONE) session_start();
    return empty($_SESSION['mg_ok']);
}

function require_unlocked(): void {
    if (locked()) {
        http_response_code(401);
        header('Content-Type: application/json');
        exit(json_encode(['error' => 'locked']));
    }
}
