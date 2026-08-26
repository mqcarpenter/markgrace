<?php
declare(strict_types=1);
require __DIR__ . '/../db.php';

header('Content-Type: application/json; charset=utf-8');
header('Cache-Control: no-store');

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
        'SELECT id, year, section, card_num, set_name, image, owned, acquired_at, note
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
            'img'   => $r['image'],
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
