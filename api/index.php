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

function body(): array {
    $raw = file_get_contents('php://input');
    if ($raw === '' || $raw === false) return [];
    $d = json_decode($raw, true);
    return is_array($d) ? $d : [];
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
    out(['protected' => !($pass === null || $pass === ''), 'locked' => locked()]);
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
        'SELECT id, year, section, card_num, set_name, variant, brand, brand_slug, image,
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
            'img'   => $r['image'],
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
