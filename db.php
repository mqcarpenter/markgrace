<?php
declare(strict_types=1);

require_once __DIR__ . '/webauthn.php';

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

// ---- passkeys -------------------------------------------------------

function session_boot(): void {
    if (session_status() !== PHP_SESSION_NONE) return;
    // The session cookie is only ever read back by this site, and only over
    // the same scheme it was set on.
    session_set_cookie_params([
        'httponly' => true,
        'samesite' => 'Lax',
        'secure'   => !empty($_SERVER['HTTPS']),
    ]);
    session_start();
}

/**
 * The relying party ID — the domain the passkey is bound to. A passkey
 * registered for one host will not sign for another, which is the property
 * doing the actual work here. Defaults to the request host, which is right
 * for a single-domain install.
 */
function rp_id(): string {
    $cfg = config();
    if (!empty($cfg['rp_id'])) return (string)$cfg['rp_id'];
    $host = (string)($_SERVER['HTTP_HOST'] ?? 'localhost');
    return preg_replace('/:\d+$/', '', $host);   // strip any port
}

/** Origins a ceremony may come from. */
function allowed_origins(): array {
    $cfg = config();
    if (!empty($cfg['origins'])) return (array)$cfg['origins'];
    $scheme = !empty($_SERVER['HTTPS']) ? 'https' : 'http';
    return [$scheme . '://' . ($_SERVER['HTTP_HOST'] ?? 'localhost')];
}

/** Issues a one-shot challenge and remembers it for the next request. */
function new_challenge(string $ceremony): string {
    session_boot();
    $c = b64url_encode(random_bytes(32));
    $_SESSION['mg_chal'] = ['v' => $c, 'for' => $ceremony, 'at' => time()];
    return $c;
}

/**
 * Returns the outstanding challenge and clears it, so a captured challenge
 * can never be replayed. Challenges expire after two minutes.
 */
function take_challenge(string $ceremony): string {
    session_boot();
    $c = $_SESSION['mg_chal'] ?? null;
    unset($_SESSION['mg_chal']);
    if (!is_array($c) || ($c['for'] ?? '') !== $ceremony) {
        throw new RuntimeException('No challenge outstanding — start again.');
    }
    if (time() - (int)($c['at'] ?? 0) > 120) {
        throw new RuntimeException('Challenge expired — try again.');
    }
    return (string)$c['v'];
}

/** How long one Face ID prompt keeps writes unlocked. */
function write_ttl(): int {
    return (int)(config()['passkey_ttl'] ?? 900);
}

function devices_registered(): int {
    try {
        return (int)db()->query('SELECT COUNT(*) FROM devices')->fetchColumn();
    } catch (PDOException $e) {
        // The table is missing until migration 005 runs. Report zero rather
        // than 500 so the page still loads read-only.
        error_log('markgrace: devices table unavailable — ' . $e->getMessage());
        return 0;
    }
}

/** Seconds of write access left, or 0 when locked. */
function write_window(): int {
    session_boot();
    $until = (int)($_SESSION['mg_write_until'] ?? 0);
    return $until > time() ? $until - time() : 0;
}

function open_write_window(): void {
    session_boot();
    $_SESSION['mg_write_until'] = time() + write_ttl();
}

/**
 * Gate for anything that changes a card. Reading is deliberately never gated
 * by this — the page is meant to be shareable.
 */
function require_write_access(): void {
    if (devices_registered() === 0) return;   // not yet locked down
    if (write_window() > 0) return;
    http_response_code(403);
    header('Content-Type: application/json');
    exit(json_encode(['error' => 'passkey_required']));
}

/** True when the page is locked and the visitor has not signed in. */
function locked(): bool {
    $pass = config()['passphrase'] ?? null;
    if ($pass === null || $pass === '') return false;
    session_boot();
    return empty($_SESSION['mg_ok']);
}

function require_unlocked(): void {
    if (locked()) {
        http_response_code(401);
        header('Content-Type: application/json');
        exit(json_encode(['error' => 'locked']));
    }
}
