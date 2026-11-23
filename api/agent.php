<?php
declare(strict_types=1);

/**
 * Read-only access for a price-checking agent.
 *
 * The agent proves itself with 'agent_token' from config.php, sent as
 *   Authorization: Bearer <token>     or     X-Agent-Token: <token>
 * Never in the query string — URLs end up in access logs.
 *
 * The token unlocks reading only. It does not satisfy the passphrase for
 * the page, and no agent route writes, so a leaked token exposes the
 * checklist and nothing else.
 */

function agent_token_given(): string {
    foreach (['HTTP_AUTHORIZATION', 'REDIRECT_HTTP_AUTHORIZATION'] as $k) {
        $h = (string)($_SERVER[$k] ?? '');
        if (stripos($h, 'Bearer ') === 0) return trim(substr($h, 7));
    }
    if (function_exists('getallheaders')) {
        foreach (getallheaders() as $name => $value) {
            if (strcasecmp($name, 'Authorization') === 0 && stripos($value, 'Bearer ') === 0) {
                return trim(substr($value, 7));
            }
        }
    }
    return trim((string)($_SERVER['HTTP_X_AGENT_TOKEN'] ?? ''));
}

function require_agent_token(): void {
    $want = (string)(config()['agent_token'] ?? '');
    if (strlen($want) < 32) {
        out(['error' => 'Agent access is off. Set a 32+ character agent_token in config.php.'], 403);
    }
    if (!hash_equals($want, agent_token_given())) {
        usleep(400000); // slow down guessing
        out(['error' => 'Bad or missing agent token.'], 401);
    }
}

/** Where the site lives, for absolute image URLs. */
function agent_base_url(): string {
    $cfg = (string)(config()['public_url'] ?? '');
    if ($cfg !== '') return rtrim($cfg, '/');
    $scheme = !empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' ? 'https' : 'http';
    $host   = (string)($_SERVER['HTTP_HOST'] ?? 'localhost');
    $dir    = rtrim(str_replace('\\', '/', dirname(dirname((string)($_SERVER['SCRIPT_NAME'] ?? '/api/index.php')))), '/');
    return "$scheme://$host$dir";
}

/** TCDB tags → plain facts. Unknown tags are still passed through raw. */
function agent_tag_facts(array $tags): array {
    $f = [
        'serial_numbered_to' => null,  // SN25  → stamped "xx/25"
        'print_run'          => null,  // PR500 → stated run, not stamped
        'rookie'             => false, // RC
        'exchange'           => false, // EXCH  → redemption card
    ];
    foreach ($tags as $t) {
        if (preg_match('/^SN(\d+)$/', $t, $m)) $f['serial_numbered_to'] = (int)$m[1];
        elseif (preg_match('/^PR(\d+)$/', $t, $m)) $f['print_run'] = (int)$m[1];
        elseif ($t === 'RC')   $f['rookie'] = true;
        elseif ($t === 'EXCH') $f['exchange'] = true;
    }
    return $f;
}

/** One DB row → everything an agent needs to find this exact card on eBay. */
function agent_card(array $r): array {
    $tags  = array_values(array_filter(array_map('trim', explode(',', (string)$r['tags']))));
    $facts = agent_tag_facts($tags);
    $num   = (string)$r['card_num'];
    $hasNum = $num !== '' && strcasecmp($num, 'NNO') !== 0;

    $auto   = (bool)(int)$r['is_auto'];
    $relic  = (bool)(int)$r['is_relic'];
    $par    = (bool)(int)$r['is_parallel'];
    $ins    = (bool)(int)$r['is_insert'];

    $title = trim($r['set_name'] . ($r['variant'] ? ' ' . $r['variant'] : '') . ($hasNum ? " #$num" : ''));

    // eBay search: player + set + variant + number + serial. Listing titles
    // rarely carry the '#', so the number goes in bare.
    $terms = ['Mark Grace', $r['set_name']];
    if ($r['variant']) $terms[] = $r['variant'];
    // A 5+ digit all-numeric "number" is a TCDB id standing in for a
    // checklist number (oddball/poster issues), and would sink the search.
    if ($hasNum && !preg_match('/^\d{5,}$/', $num)) $terms[] = $num;
    if ($facts['serial_numbered_to']) $terms[] = '/' . $facts['serial_numbered_to'];
    $query = preg_replace('/\s+/', ' ', implode(' ', $terms));

    // Things this card is NOT, so a base card isn't priced off an autograph.
    $exclude = ['lot', 'reprint'];
    if (!$auto)  array_push($exclude, 'auto', 'autograph', 'signed');
    if (!$relic) array_push($exclude, 'jersey', 'relic', 'patch', 'bat');
    if (!$par && !$facts['serial_numbered_to']) array_push($exclude, 'refractor', 'parallel');
    $excludeStr = implode(' ', array_map(static fn($w) => "-$w", $exclude));

    $base = agent_base_url();
    $img  = static fn($f) => $f ? "$base/img/" . rawurlencode((string)$f) : null;

    // Scans fetched from TCDB keep TCDB's ids in the filename: <sid>-<cid>Fr.jpg.
    $tcdb = null;
    if ($r['image'] && preg_match('/^(\d+)-(\d+)(Fr|Bk)\./', (string)$r['image'], $m)) {
        $tcdb = "https://www.tcdb.com/ViewCard.cfm/sid/{$m[1]}/cid/{$m[2]}";
    }

    $ebayUrl = static fn(string $q, bool $sold) => 'https://www.ebay.com/sch/i.html?' . http_build_query(
        $sold ? ['_nkw' => $q, 'LH_Sold' => 1, 'LH_Complete' => 1] : ['_nkw' => $q]
    );
    $full = "$query $excludeStr";

    return [
        'id'          => $r['id'],
        'player'      => 'Mark Grace',
        'title'       => $title,
        'year'        => (int)$r['year'],
        'set'         => $r['set_name'],
        'variant'     => $r['variant'],
        'card_number' => $hasNum ? $num : null,
        'brand'       => $r['brand'],
        'type'        => $auto ? 'autograph' : ($relic ? 'relic' : ($par ? 'parallel' : ($ins ? 'insert' : 'base'))),
        'is_autograph' => $auto,
        'is_relic'     => $relic,
        'is_parallel'  => $par,
        'is_insert'    => $ins,
        'serial_numbered_to' => $facts['serial_numbered_to'],
        'print_run'   => $facts['print_run'],
        'rookie'      => $facts['rookie'],
        'exchange'    => $facts['exchange'],
        'tcdb_tags'   => $tags,
        'owned'       => (bool)(int)$r['owned'],
        'acquired_at' => $r['acquired_at'],
        'note'        => $r['note'],
        'image_front' => $img($r['image']),
        'image_back'  => $img($r['image_back'] ?? null),
        'tcdb_url'    => $tcdb,
        'ebay' => [
            'query'        => $query,
            'exclude'      => $exclude,
            'query_full'   => $full,
            'sold_url'     => $ebayUrl($full, true),
            'active_url'   => $ebayUrl($full, false),
        ],
        'updated_at'  => $r['updated_at'],
    ];
}
