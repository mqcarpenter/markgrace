<?php
/**
 * One-time import of data/cards.json into MySQL.
 *   php seed.php
 * Safe to re-run: it inserts new cards and refreshes set/image/section text,
 * but never clobbers an `owned` flag you've already set in the database.
 */
declare(strict_types=1);
require __DIR__ . '/db.php';

if (PHP_SAPI !== 'cli') { http_response_code(403); exit("CLI only.\n"); }

$json = json_decode(file_get_contents(__DIR__ . '/data/cards.json'), true);
if (!is_array($json)) exit("Could not read data/cards.json\n");

$pdo = db();
$pdo->beginTransaction();

$ins = $pdo->prepare(
    'INSERT INTO cards (id, year, section, card_num, set_name, image, owned, sort_order)
     VALUES (:id, :y, :sec, :num, :set, :img, :owned, :ord)
     ON DUPLICATE KEY UPDATE
        year=VALUES(year), section=VALUES(section), card_num=VALUES(card_num),
        set_name=VALUES(set_name), image=VALUES(image), sort_order=VALUES(sort_order)'
);

$order = 0; $n = 0;
foreach ($json as $sec) {
    foreach ($sec['cards'] as $c) {
        $ins->execute([
            ':id'    => $c['id'],
            ':y'     => (int)$sec['year'],
            ':sec'   => $sec['title'],
            ':num'   => $c['num'],
            ':set'   => $c['set'],
            ':img'   => $c['img'] ?: null,
            ':owned' => !empty($c['seed']) ? 1 : 0,
            ':ord'   => $order++,
        ]);
        $n++;
    }
}
$pdo->commit();

$owned = $pdo->query('SELECT COUNT(*) FROM cards WHERE owned = 1')->fetchColumn();
$total = $pdo->query('SELECT COUNT(*) FROM cards')->fetchColumn();
echo "Imported/updated {$n} cards. Database now holds {$total} cards, {$owned} marked owned.\n";
