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

function db(): PDO {
    static $pdo = null;
    if ($pdo === null) {
        $d = config()['db'];
        $dsn = "mysql:host={$d['host']};dbname={$d['name']};charset={$d['charset']}";
        try {
            $pdo = new PDO($dsn, $d['user'], $d['pass'], [
                PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                PDO::ATTR_EMULATE_PREPARES   => false,
            ]);
        } catch (PDOException $e) {
            http_response_code(500);
            error_log('DB connect failed: ' . $e->getMessage());
            exit('Database connection failed. Check config.php.');
        }
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
