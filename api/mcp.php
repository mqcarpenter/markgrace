<?php
declare(strict_types=1);
/**
 * MCP server (Streamable HTTP, JSON responses) for agents such as Tasks in
 * Gemini. Read-only: three tools, none of which write.
 *
 *   https://yourhost/markgrace/api/mcp.php?key=<mcp_key>
 *
 * The key lives in config.php as 'mcp_key'. It travels in the URL because
 * the clients this is for take a bare link, so it will appear in the
 * host's access logs; it only ever unlocks reading the checklist.
 */
require __DIR__ . '/../db.php';
require __DIR__ . '/agent.php';

header('Content-Type: application/json; charset=utf-8');
header('Cache-Control: no-store');

const MCP_VERSIONS = ['2025-11-25', '2025-06-18', '2025-03-26', '2024-11-05'];

function mcp_send(int $code, ?array $body = null): void {
    http_response_code($code);
    if ($body !== null) echo json_encode($body, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);
    exit;
}
function mcp_error($id, int $code, string $msg): array {
    return ['jsonrpc' => '2.0', 'id' => $id, 'error' => ['code' => $code, 'message' => $msg]];
}

set_exception_handler(function (Throwable $e) {
    error_log('markgrace mcp: ' . $e->getMessage());
    mcp_send(500, mcp_error(null, -32603, 'Server error.'));
});

// ---- auth -----------------------------------------------------------
$want = (string)(config()['mcp_key'] ?? '');
if (strlen($want) < 32) {
    mcp_send(403, mcp_error(null, -32001, 'MCP access is off. Set a 32+ character mcp_key in config.php.'));
}
if (!hash_equals($want, (string)($_GET['key'] ?? ''))) {
    usleep(400000); // slow down guessing
    mcp_send(401, mcp_error(null, -32001, 'Bad or missing key.'));
}

// No server-to-client stream: POST is the whole protocol here.
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Allow: POST');
    mcp_send(405);
}

// ---- tools ----------------------------------------------------------
function mcp_tools(): array {
    $cardNote = 'Each card has year, set, variant, card_number, brand, type '
        . '(base/insert/parallel/relic/autograph), serial_numbered_to (25 = stamped xx/25), '
        . 'print_run, rookie, owned, note, image_front/image_back, tcdb_url, and an ebay object: '
        . 'ebay.query (player + set + variant + number + /serial), ebay.exclude (words this card '
        . 'is NOT, e.g. auto/jersey/refractor on a base card, so it is not priced off a different card), '
        . 'ebay.sold_url (sold + completed listings) and ebay.active_url. '
        . 'Match listings on set, variant, card number AND serial numbering; a parallel or '
        . 'serial-numbered version of the same card is a different card with a different price.';

    return [
        [
            'name'        => 'search_cards',
            'title'       => 'Search Mark Grace cards',
            'description' => 'Search the Mark Grace card checklist (base cards, inserts, parallels, '
                . 'minor league and oddball issues, 1982 onward). Filters combine. Use owned=false '
                . 'for cards still needed. Results are paged: pass the returned "next" as offset '
                . 'to continue. ' . $cardNote,
            'inputSchema' => [
                'type'       => 'object',
                'properties' => [
                    'owned'  => ['type' => 'boolean', 'description' => 'true = only owned, false = only still needed. Omit for both.'],
                    'year'   => ['type' => 'integer', 'description' => 'Exact year, e.g. 1988.'],
                    'from'   => ['type' => 'integer', 'description' => 'Earliest year, inclusive.'],
                    'to'     => ['type' => 'integer', 'description' => 'Latest year, inclusive.'],
                    'brand'  => ['type' => 'string',  'description' => 'Brand, e.g. "Fleer", "Topps", "Upper Deck".'],
                    'base'   => ['type' => 'boolean', 'description' => 'true = base cards only (no inserts, parallels, relics or autographs).'],
                    'q'      => ['type' => 'string',  'description' => 'Text matched against set name, variant and card number, e.g. "Refractor" or "1989 Donruss".'],
                    'limit'  => ['type' => 'integer', 'description' => 'Cards per page, 1-100. Default 25.'],
                    'offset' => ['type' => 'integer', 'description' => 'Start position, from the previous page\'s "next".'],
                ],
                'additionalProperties' => false,
            ],
            'annotations' => ['readOnlyHint' => true, 'openWorldHint' => false],
        ],
        [
            'name'        => 'get_card',
            'title'       => 'Get one card',
            'description' => 'Full details for one card by its id (from search_cards). ' . $cardNote,
            'inputSchema' => [
                'type'       => 'object',
                'properties' => ['id' => ['type' => 'string', 'description' => 'Card id from search_cards.']],
                'required'   => ['id'],
                'additionalProperties' => false,
            ],
            'annotations' => ['readOnlyHint' => true, 'openWorldHint' => false],
        ],
        [
            'name'        => 'collection_summary',
            'title'       => 'Collection progress',
            'description' => 'How many cards are tracked, owned and still needed, overall and by type.',
            'inputSchema' => ['type' => 'object', 'properties' => new stdClass(), 'additionalProperties' => false],
            'annotations' => ['readOnlyHint' => true, 'openWorldHint' => false],
        ],
    ];
}

function mcp_tool_result(array $data, bool $isError = false): array {
    $r = [
        'content' => [['type' => 'text', 'text' => json_encode($data, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE)]],
        'structuredContent' => $data,
    ];
    if ($isError) $r['isError'] = true;
    return $r;
}

function mcp_call(string $name, array $args): array {
    switch ($name) {
        case 'search_cards':
            try {
                return mcp_tool_result(agent_find($args, 25, 100));
            } catch (InvalidArgumentException $e) {
                return mcp_tool_result(['error' => $e->getMessage()], true);
            }
        case 'get_card':
            $id = trim((string)($args['id'] ?? ''));
            if ($id === '') return mcp_tool_result(['error' => 'Missing id.'], true);
            $card = agent_get($id);
            return $card
                ? mcp_tool_result(['card' => $card])
                : mcp_tool_result(['error' => "No card with id \"$id\". Use search_cards to find ids."], true);
        case 'collection_summary':
            return mcp_tool_result(agent_summary());
    }
    throw new DomainException("Unknown tool: $name");
}

// ---- JSON-RPC ---------------------------------------------------------
/** Handle one message. Returns the response, or null for a notification. */
function mcp_handle($msg): ?array {
    if (!is_array($msg) || ($msg['jsonrpc'] ?? '') !== '2.0' || !isset($msg['method'])) {
        return mcp_error($msg['id'] ?? null, -32600, 'Invalid request.');
    }
    $isNotification = !array_key_exists('id', $msg);
    $id     = $msg['id'] ?? null;
    $params = is_array($msg['params'] ?? null) ? $msg['params'] : [];

    if ($isNotification) return null; // initialized, cancelled, ... — nothing to do

    switch ($msg['method']) {
        case 'initialize':
            $asked = (string)($params['protocolVersion'] ?? '');
            return ['jsonrpc' => '2.0', 'id' => $id, 'result' => [
                'protocolVersion' => in_array($asked, MCP_VERSIONS, true) ? $asked : MCP_VERSIONS[0],
                'capabilities'    => ['tools' => ['listChanged' => false]],
                'serverInfo'      => ['name' => 'mark-grace-tracker', 'title' => 'Mark Grace Card Tracker', 'version' => '1.0.0'],
                'instructions'    => 'Read-only access to a Mark Grace baseball card checklist, for looking cards up '
                    . 'on eBay. Use search_cards (owned=false for cards still needed), then each card\'s ebay fields. '
                    . 'Nothing here can change the collection.',
            ]];
        case 'ping':
            return ['jsonrpc' => '2.0', 'id' => $id, 'result' => new stdClass()];
        case 'tools/list':
            return ['jsonrpc' => '2.0', 'id' => $id, 'result' => ['tools' => mcp_tools()]];
        case 'tools/call':
            $name = (string)($params['name'] ?? '');
            $args = is_array($params['arguments'] ?? null) ? $params['arguments'] : [];
            try {
                return ['jsonrpc' => '2.0', 'id' => $id, 'result' => mcp_call($name, $args)];
            } catch (DomainException $e) {
                return mcp_error($id, -32602, $e->getMessage());
            }
    }
    return mcp_error($id, -32601, 'Method not found: ' . $msg['method']);
}

$raw = file_get_contents('php://input');
$msg = json_decode($raw === false ? '' : $raw, true);
if ($msg === null) mcp_send(400, mcp_error(null, -32700, 'Parse error.'));

// A batch (allowed before 2025-06-18) gets an array back.
if (is_array($msg) && array_is_list_compat($msg) && $msg !== []) {
    $out = array_values(array_filter(array_map('mcp_handle', $msg)));
    $out ? mcp_send(200, $out) : mcp_send(202);
}
$res = mcp_handle($msg);
$res === null ? mcp_send(202) : mcp_send(200, $res);

/** array_is_list() is PHP 8.1+; this has to run on 7.4. */
function array_is_list_compat(array $a): bool {
    $i = 0;
    foreach ($a as $k => $_) { if ($k !== $i++) return false; }
    return true;
}
