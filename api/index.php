<?php
declare(strict_types=1);
require __DIR__ . '/../db.php';

header('Content-Type: application/json; charset=utf-8');
header('Cache-Control: no-store');

/**
 * Without this, any uncaught PDO error dies as a blank 500 with no body,
 * which tells the browser (and you) nothing. Always answer with JSON.
 * Set 'debug' => true in config.php to include the real message.
 */
function fail(string $msg, ?Throwable $e = null): void {
    if ($e) error_log('markgrace: ' . $e->getMessage());
    http_response_code(500);
    $out = ['error' => $msg];
    if ($e && !empty(config()['debug'])) {
        $out['detail'] = $e->getMessage();
        $out['where']  = basename($e->getFile()) . ':' . $e->getLine();
    }
    echo json_encode($out);
    exit;
}
set_exception_handler(function (Throwable $e) { fail('Server error.', $e); });
register_shutdown_function(function () {
    $e = error_get_last();
    if ($e && in_array($e['type'], [E_ERROR, E_PARSE, E_COMPILE_ERROR], true)) {
        if (!headers_sent()) http_response_code(500);
        error_log('markgrace fatal: ' . $e['message']);
        $out = ['error' => 'Server error.'];
        // Surface the real fatal when debugging; otherwise stay quiet.
        $dbg = false;
        try { $dbg = !empty(config()['debug']); } catch (Throwable $ignored) {}
        if ($dbg) {
            $out['detail']  = $e['message'];
            $out['where']   = $e['file'] . ':' . $e['line'];
            $out['php']     = PHP_VERSION;
            $out['drivers'] = class_exists('PDO') ? PDO::getAvailableDrivers() : ['PDO missing'];
        } else {
            $out['detail'] = 'See server error log.';
        }
        echo json_encode($out);
    }
});

$method = $_SERVER['REQUEST_METHOD'];
$action = $_GET['action'] ?? '';

/** Parsed request body. Memoised — several handlers read it more than once. */
function body(): array {
    static $parsed = null;
    if ($parsed !== null) return $parsed;
    $raw = file_get_contents('php://input');
    if ($raw === '' || $raw === false) return $parsed = [];
    $d = json_decode($raw, true);
    return $parsed = (is_array($d) ? $d : []);
}
function out(array $d, int $code = 200): void {
    http_response_code($code);
    echo json_encode($d, JSON_UNESCAPED_SLASHES);
    exit;
}

// ---- auth ----------------------------------------------------------
if ($action === 'login') {
    $pass = config()['passphrase'] ?? null;
    if ($pass === null || $pass === '') out(['ok' => true, 'locked' => false]);
    $given = (string)(body()['passphrase'] ?? '');
    if (hash_equals((string)$pass, $given)) {
        if (session_status() === PHP_SESSION_NONE) session_start();
        session_regenerate_id(true);
        $_SESSION['mg_ok'] = true;
        out(['ok' => true]);
    }
    usleep(400000); // slow down guessing
    out(['ok' => false, 'error' => 'Wrong passphrase.'], 401);
}

if ($action === 'session') {
    $pass = config()['passphrase'] ?? null;
    out([
        'protected'   => !($pass === null || $pass === ''),
        'locked'      => locked(),
        'devices'     => devices_registered(),
        'writeWindow' => write_window(),
    ]);
}

// ---- passkeys ------------------------------------------------------
//
// Reading the collection never needs a passkey. Changing a card does, as
// soon as at least one device is registered.

/**
 * Registration is the one moment the door is open, so it is gated three ways:
 * the very first device may enrol freely (nothing to protect yet); after that
 * a caller must either already hold write access on this device, or present
 * the enrolment key from config.php.
 */
function may_register(): bool {
    if (devices_registered() === 0) return true;
    if (write_window() > 0) return true;
    $key = config()['enroll_key'] ?? null;
    if ($key === null || $key === '') return false;
    // Body only — a key in the query string would end up in the access log.
    $given = (string)(body()['enroll_key'] ?? '');
    return $given !== '' && hash_equals((string)$key, $given);
}

if ($action === 'passkey-register-options') {
    require_unlocked();
    if (!may_register()) {
        usleep(400000);
        out(['error' => 'Registration is closed. Use the enrolment key from config.php.'], 403);
    }
    $existing = db()->query('SELECT credential_id FROM devices')->fetchAll();
    out([
        'challenge' => new_challenge('register'),
        'rp'        => ['id' => rp_id(), 'name' => 'Mark Grace Card Tracker'],
        'user'      => [
            // Opaque and constant: one collection, one notional user. The
            // handle is never shown and carries nothing personal.
            'id'          => b64url_encode('markgrace'),
            'name'        => 'collection',
            'displayName' => 'Mark Grace Collection',
        ],
        'pubKeyCredParams' => [
            ['type' => 'public-key', 'alg' => -7],     // ES256 — Apple, Android
            ['type' => 'public-key', 'alg' => -257],   // RS256 — Windows Hello
        ],
        // Exclude what is already registered so the same phone cannot enrol
        // twice and quietly orphan its first credential.
        'excludeCredentials' => array_map(static function (array $r): array {
            return ['type' => 'public-key', 'id' => b64url_encode($r['credential_id'])];
        }, $existing),
        'authenticatorSelection' => [
            // platform: the key must live in this device's Secure Enclave, not
            // on a roaming USB key. That is what ties writes to the phone.
            'authenticatorAttachment' => 'platform',
            'residentKey'             => 'preferred',
            'userVerification'        => 'required',
        ],
        'timeout'     => 60000,
        'attestation' => 'none',
    ]);
}

if ($method === 'POST' && $action === 'passkey-register') {
    require_unlocked();
    if (!may_register()) {
        usleep(400000);
        out(['error' => 'Registration is closed.'], 403);
    }
    $d = body();
    try {
        $reg = webauthn_verify_registration(
            b64url_decode((string)($d['clientDataJSON'] ?? '')),
            b64url_decode((string)($d['attestationObject'] ?? '')),
            take_challenge('register'),
            rp_id(),
            allowed_origins()
        );
    } catch (Throwable $e) {
        error_log('markgrace passkey register: ' . $e->getMessage());
        out(['error' => $e->getMessage()], 400);
    }

    $label = trim((string)($d['label'] ?? ''));
    if ($label === '') $label = 'iPhone';

    $st = db()->prepare(
        'INSERT INTO devices (credential_id, public_key, sign_count, label, created_at)
         VALUES (:c, :p, :s, :l, NOW())'
    );
    try {
        $st->execute([
            ':c' => $reg['credential_id'],
            ':p' => $reg['public_key'],
            ':s' => $reg['sign_count'],
            ':l' => mb_substr($label, 0, 64),
        ]);
    } catch (PDOException $e) {
        // 23000 is the unique-key violation: this credential is already here.
        if ($e->getCode() === '23000') out(['error' => 'That device is already registered.'], 409);
        throw $e;
    }

    // Registering proves possession, so the device gets its write window now
    // rather than being asked for Face ID a second time.
    open_write_window();
    out(['ok' => true, 'label' => $label, 'writeWindow' => write_window()]);
}

if ($action === 'passkey-auth-options') {
    require_unlocked();
    if (devices_registered() === 0) out(['error' => 'No device registered yet.'], 409);
    $rows = db()->query('SELECT credential_id FROM devices')->fetchAll();
    out([
        'challenge' => new_challenge('auth'),
        'rpId'      => rp_id(),
        'allowCredentials' => array_map(static function (array $r): array {
            return ['type' => 'public-key', 'id' => b64url_encode($r['credential_id'])];
        }, $rows),
        'userVerification' => 'required',
        'timeout'          => 60000,
    ]);
}

if ($method === 'POST' && $action === 'passkey-auth') {
    require_unlocked();
    $d     = body();
    $rawId = b64url_decode((string)($d['id'] ?? ''));
    if ($rawId === '') out(['error' => 'Missing credential id.'], 400);

    $st = db()->prepare('SELECT id, public_key, sign_count FROM devices WHERE credential_id = ?');
    $st->execute([$rawId]);
    $dev = $st->fetch();
    if (!$dev) {
        usleep(400000);
        out(['error' => 'That device is not registered.'], 403);
    }

    try {
        $count = webauthn_verify_assertion(
            b64url_decode((string)($d['clientDataJSON'] ?? '')),
            b64url_decode((string)($d['authenticatorData'] ?? '')),
            b64url_decode((string)($d['signature'] ?? '')),
            take_challenge('auth'),
            (string)$dev['public_key'],
            (int)$dev['sign_count'],
            rp_id(),
            allowed_origins()
        );
    } catch (Throwable $e) {
        error_log('markgrace passkey auth: ' . $e->getMessage());
        usleep(400000);
        out(['error' => $e->getMessage()], 403);
    }

    $up = db()->prepare('UPDATE devices SET sign_count = :s, last_used_at = NOW() WHERE id = :id');
    $up->execute([':s' => $count, ':id' => $dev['id']]);

    open_write_window();
    out(['ok' => true, 'writeWindow' => write_window()]);
}

if ($method === 'POST' && $action === 'passkey-lock') {
    session_boot();
    unset($_SESSION['mg_write_until']);
    out(['ok' => true, 'writeWindow' => 0]);
}

if ($action === 'logout') {
    if (session_status() === PHP_SESSION_NONE) session_start();
    $_SESSION = [];
    session_destroy();
    out(['ok' => true]);
}

// ---- data ----------------------------------------------------------
if ($method === 'GET' && ($action === '' || $action === 'cards')) {
    require_unlocked();
    $rows = db()->query(
        'SELECT id, year, section, card_num, set_name, variant, brand, brand_slug,
                image, image_back,
                is_auto, is_relic, is_parallel, is_insert, tags,
                owned, acquired_at, note
           FROM cards ORDER BY sort_order ASC'
    )->fetchAll();

    $sections = [];
    foreach ($rows as $r) {
        $key = $r['section'];
        if (!isset($sections[$key])) {
            $sections[$key] = ['year' => (string)$r['year'], 'title' => $key, 'cards' => []];
        }
        $sections[$key]['cards'][] = [
            'id'    => $r['id'],
            'num'   => $r['card_num'],
            'set'   => $r['set_name'],
            'variant'   => $r['variant'],
            'img'     => $r['image'],
            'imgBack' => $r['image_back'],
            'brand'     => $r['brand'],
            'brandSlug' => $r['brand_slug'],
            'auto'     => (bool)(int)$r['is_auto'],
            'relic'    => (bool)(int)$r['is_relic'],
            'parallel' => (bool)(int)$r['is_parallel'],
            'insert'   => (bool)(int)$r['is_insert'],
            'tags'     => $r['tags'],
            'owned' => (bool)(int)$r['owned'],
            'acquired_at' => $r['acquired_at'],
            'note'  => $r['note'],
        ];
    }
    out(['sections' => array_values($sections)]);
}

if ($method === 'POST' && $action === 'toggle') {
    require_unlocked();
    require_write_access();
    $d     = body();
    $id    = (string)($d['id'] ?? '');
    $owned = !empty($d['owned']);
    if ($id === '') out(['error' => 'Missing id.'], 400);

    $st = db()->prepare(
        'UPDATE cards SET owned = :o, acquired_at = :a WHERE id = :id'
    );
    $st->execute([
        ':o'  => $owned ? 1 : 0,
        ':a'  => $owned ? date('Y-m-d H:i:s') : null,
        ':id' => $id,
    ]);
    if ($st->rowCount() === 0) {
        $exists = db()->prepare('SELECT 1 FROM cards WHERE id = ?');
        $exists->execute([$id]);
        if (!$exists->fetchColumn()) out(['error' => 'Unknown card.'], 404);
    }
    out(['ok' => true, 'id' => $id, 'owned' => $owned]);
}

out(['error' => 'Unknown endpoint.'], 404);
