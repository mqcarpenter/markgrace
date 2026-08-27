-- Migration 006 — minor league / college cards confirmed missing 2026-08-26.
--   mysql -u ADMIN -p DBNAME < migrate-006-minor-league.sql
-- Safe to re-run: ON DUPLICATE KEY UPDATE refreshes detail, never `owned`.

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags,
                   owned, sort_order)
VALUES ('1988-4-1988-san-diego-state-university-50th-anniversary', 1988, '1988', '4', '1988 San Diego State University 50th Anniversary', NULL,
        NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order), 0) + 1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags,
                   owned, sort_order)
VALUES ('1988-30-1988-procards-iowa-cubs', 1988, '1988', '30', '1988 ProCards Iowa Cubs', NULL,
        'ProCards', 'procards', NULL, NULL, 0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order), 0) + 1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags,
                   owned, sort_order)
VALUES ('1988-3-1988-gray-star-wrigley-field-series-2-unlicensed', 1988, '1988', '3', '1988 Gray Star Wrigley Field Series 2 (unlicensed)', NULL,
        'Star', 'star', NULL, NULL, 0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order), 0) + 1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug);
