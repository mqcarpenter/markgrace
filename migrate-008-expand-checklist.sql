-- Migration 008 — checklist expansion from the card scans.
--
-- 438 cards that have a scan in thumbs-card but had no row in the
-- checklist. Years 2016-2026 were missing outright: the TCDB PDF in the
-- project folder is Part 1 only and stops mid-2004, so the scan filenames
-- are the best available source for those years.
--
-- Set names come from the filenames, which are untruncated. Type flags are
-- inferred from the set name (Signatures/Scripts -> auto, Relic/Patch ->
-- relic, Refractor/Gold -> parallel), so spot-check anything that looks
-- wrong in the app's type chips.
--
--   mysql -u ADMIN -p DBNAME < migrate-008-expand-checklist.sql
-- Safe to re-run: ON DUPLICATE KEY UPDATE never touches `owned`.

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1988-nno-1988-donruss-chicago-cubs-team-collection-panels', 1988, '1988', 'NNO', '1988 Donruss Chicago Cubs Team Collection Panels', NULL,
        'Donruss', 'donruss', '1988_Donruss-Chicago-Cubs-Team-Collection-Panels_NNO-Fr-v2.jpg', '1988_Donruss-Chicago-Cubs-Team-Collection-Panels_NNO-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-3-1989-o-pee-chee-stickers', 1989, '1989', '3', '1989 O Pee Chee Stickers', NULL,
        NULL, NULL, '1989_O-Pee-Chee-Stickers_3-Fr-v2.jpg', '1989_O-Pee-Chee-Stickers_3-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-50-1989-o-pee-chee-stickers', 1989, '1989', '50', '1989 O Pee Chee Stickers', NULL,
        NULL, NULL, '1989_O-Pee-Chee-Stickers_50-Fr-v2.jpg', '1989_O-Pee-Chee-Stickers_50-Bk-v2.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-8-1989-pacific-cards-comics-american-flag-series-ii-unlicensed', 1989, '1989', '8', '1989 Pacific Cards & Comics American Flag Series II (unlicensed)', NULL,
        'Pacific', 'pacific', '1989_Pacific-Cards-&-Comics-American-Flag-Series-II-(unlicensed)_8-Fr.jpg', '1989_Pacific-Cards-&-Comics-American-Flag-Series-II-(unlicensed)_8-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-8-1989-pacific-cards-comics-baseball-s-best-five-unlicensed', 1989, '1989', '8', '1989 Pacific Cards & Comics Baseball''s Best Five (unlicensed)', NULL,
        'Pacific', 'pacific', '1989_Pacific-Cards-&-Comics-Baseball''s-Best-Five-(unlicensed)_8-Fr.jpg', '1989_Pacific-Cards-&-Comics-Baseball''s-Best-Five-(unlicensed)_8-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-3-1989-pacific-cards-comics-big-league-all-stars-unlicensed', 1989, '1989', '3', '1989 Pacific Cards & Comics Big League All Stars (unlicensed)', NULL,
        'Pacific', 'pacific', '1989_Pacific-Cards-&-Comics-Big-League-All-Stars-(unlicensed)_3-Fr.jpg', '1989_Pacific-Cards-&-Comics-Big-League-All-Stars-(unlicensed)_3-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-1-1989-pacific-cards-comics-crossed-bats-unlicensed', 1989, '1989', '1', '1989 Pacific Cards & Comics Crossed Bats (unlicensed)', NULL,
        'Pacific', 'pacific', '1989_Pacific-Cards-&-Comics-Crossed-Bats-(unlicensed)_1-Fr.jpg', '1989_Pacific-Cards-&-Comics-Crossed-Bats-(unlicensed)_1-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-2-1989-pacific-cards-comics-crossed-bats-unlicensed', 1989, '1989', '2', '1989 Pacific Cards & Comics Crossed Bats (unlicensed)', NULL,
        'Pacific', 'pacific', '1989_Pacific-Cards-&-Comics-Crossed-Bats-(unlicensed)_2-Fr.jpg', '1989_Pacific-Cards-&-Comics-Crossed-Bats-(unlicensed)_2-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-9-1989-pacific-cards-comics-series-iii-unlicensed', 1989, '1989', '9', '1989 Pacific Cards & Comics Series III (unlicensed)', NULL,
        'Pacific', 'pacific', '1989_Pacific-Cards-&-Comics-Series-III-(unlicensed)_9-Fr.jpg', '1989_Pacific-Cards-&-Comics-Series-III-(unlicensed)_9-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-9-1989-pacific-cards-comics-signature-unlicensed', 1989, '1989', '9', '1989 Pacific Cards & Comics Signature (unlicensed)', NULL,
        'Pacific', 'pacific', '1989_Pacific-Cards-&-Comics-Signature-(unlicensed)_9-Fr.jpg', '1989_Pacific-Cards-&-Comics-Signature-(unlicensed)_9-Bk.jpg',
        1, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-12-1989-rainier-farms-super-stars-discs', 1989, '1989', '12', '1989 Rainier Farms Super Stars Discs', NULL,
        NULL, NULL, '1989_Rainier-Farms-Super-Stars-Discs_12-Fr.jpg', '1989_Rainier-Farms-Super-Stars-Discs_12-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-1-1989-star-mark-grace', 1989, '1989', '1', '1989 Star Mark Grace', NULL,
        'Star', 'star', '1989_Star-Mark-Grace_1-Fr.jpg', '1989_Star-Mark-Grace_1-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-10-1989-star-mark-grace', 1989, '1989', '10', '1989 Star Mark Grace', NULL,
        'Star', 'star', '1989_Star-Mark-Grace_10-Fr.jpg', '1989_Star-Mark-Grace_10-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-11-1989-star-mark-grace', 1989, '1989', '11', '1989 Star Mark Grace', NULL,
        'Star', 'star', '1989_Star-Mark-Grace_11-Fr.jpg', '1989_Star-Mark-Grace_11-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-2-1989-star-mark-grace', 1989, '1989', '2', '1989 Star Mark Grace', NULL,
        'Star', 'star', '1989_Star-Mark-Grace_2-Fr.jpg', '1989_Star-Mark-Grace_2-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-3-1989-star-mark-grace', 1989, '1989', '3', '1989 Star Mark Grace', NULL,
        'Star', 'star', '1989_Star-Mark-Grace_3-Fr.jpg', '1989_Star-Mark-Grace_3-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-4-1989-star-mark-grace', 1989, '1989', '4', '1989 Star Mark Grace', NULL,
        'Star', 'star', '1989_Star-Mark-Grace_4-Fr.jpg', '1989_Star-Mark-Grace_4-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-5-1989-star-mark-grace', 1989, '1989', '5', '1989 Star Mark Grace', NULL,
        'Star', 'star', '1989_Star-Mark-Grace_5-Fr.jpg', '1989_Star-Mark-Grace_5-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-6-1989-star-mark-grace', 1989, '1989', '6', '1989 Star Mark Grace', NULL,
        'Star', 'star', '1989_Star-Mark-Grace_6-Fr-v2.jpg', '1989_Star-Mark-Grace_6-Bk-v2.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-7-1989-star-mark-grace', 1989, '1989', '7', '1989 Star Mark Grace', NULL,
        'Star', 'star', '1989_Star-Mark-Grace_7-Fr.jpg', '1989_Star-Mark-Grace_7-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-8-1989-star-mark-grace', 1989, '1989', '8', '1989 Star Mark Grace', NULL,
        'Star', 'star', '1989_Star-Mark-Grace_8-Fr.jpg', '1989_Star-Mark-Grace_8-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-9-1989-star-mark-grace', 1989, '1989', '9', '1989 Star Mark Grace', NULL,
        'Star', 'star', '1989_Star-Mark-Grace_9-Fr.jpg', '1989_Star-Mark-Grace_9-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-nno-1989-star-mark-grace', 1989, '1989', 'NNO', '1989 Star Mark Grace', NULL,
        'Star', 'star', '1989_Star-Mark-Grace_NNO-Fr.jpg', '1989_Star-Mark-Grace_NNO-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-11-1989-topps-1988-rookies-commemorative-set-glossy-rookies', 1989, '1989', '11', '1989 Topps 1988 Rookies Commemorative Set (Glossy Rookies)', NULL,
        'Topps', 'topps', '1989_Topps-1988-Rookies-Commemorative-Set-(Glossy-Rookies)_11-Fr-v2.jpg', '1989_Topps-1988-Rookies-Commemorative-Set-(Glossy-Rookies)_11-Bk-v2.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-29-1989-topps-1989-all-star-set-collector-s-edition-glossy-send-ins', 1989, '1989', '29', '1989 Topps 1989 All Star Set Collector''s Edition (Glossy Send Ins)', NULL,
        'Topps', 'topps', '1989_Topps-1989-All-Star-Set-Collector''s-Edition-(Glossy-Send-Ins)_29-Fr.jpg', '1989_Topps-1989-All-Star-Set-Collector''s-Edition-(Glossy-Send-Ins)_29-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-465-1989-topps-collector-s-edition-tiffany', 1989, '1989', '465', '1989 Topps Collector''s Edition (Tiffany)', NULL,
        'Topps', 'topps', '1989_Topps-Collector''s-Edition-(Tiffany)_465-Fr-v2.jpg', '1989_Topps-Collector''s-Edition-(Tiffany)_465-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-3-1989-topps-stickers', 1989, '1989', '3', '1989 Topps Stickers', NULL,
        'Topps', 'topps', '1989_Topps-Stickers_3-Fr-v2.jpg', '1989_Topps-Stickers_3-Bk-v2.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-50-1989-topps-stickers', 1989, '1989', '50', '1989 Topps Stickers', NULL,
        'Topps', 'topps', '1989_Topps-Stickers_50-Fr-v2.jpg', '1989_Topps-Stickers_50-Bk-v2.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-nno-1989-upper-deck-national-sports-collectors-convention-commemorative-sheet', 1989, '1989', 'NNO', '1989 Upper Deck National Sports Collectors Convention Commemorative Sheet', NULL,
        'Upper Deck', 'upperdeck', '1989_Upper-Deck-National-Sports-Collectors-Convention-Commemorative-Sheet_NNO-Fr.jpg', '1989_Upper-Deck-National-Sports-Collectors-Convention-Commemorative-Sheet_NNO-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-10-1989-windy-city-superstars-1989-champs-unlicensed', 1989, '1989', '10', '1989 Windy City Superstars 1989 Champs (unlicensed)', NULL,
        NULL, NULL, '1989_Windy-City-Superstars-1989-Champs-(unlicensed)_10-Fr.jpg', '1989_Windy-City-Superstars-1989-Champs-(unlicensed)_10-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1989-3-1989-windy-city-superstars-1989-champs-unlicensed', 1989, '1989', '3', '1989 Windy City Superstars 1989 Champs (unlicensed)', NULL,
        NULL, NULL, '1989_Windy-City-Superstars-1989-Champs-(unlicensed)_3-Fr.jpg', '1989_Windy-City-Superstars-1989-Champs-(unlicensed)_3-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1990-28-30-1990-baseball-cards-magazine-repli-cards-panels', 1990, '1990', '28-30', '1990 Baseball Cards Magazine Repli Cards Panels', NULL,
        NULL, NULL, '1990_Baseball-Cards-Magazine-Repli-Cards-Panels_28-30-Fr-v2.jpg', '1990_Baseball-Cards-Magazine-Repli-Cards-Panels_28-30-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1990-31-35-1990-sports-collectors-digest-baseball-card-price-guide-monthly-panels', 1990, '1990', '31-35', '1990 Sports Collectors Digest Baseball Card Price Guide Monthly Panels', NULL,
        'SP', 'sp', '1990_Sports-Collectors-Digest-Baseball-Card-Price-Guide-Monthly-Panels_31-35-Fr-v2.jpg', '1990_Sports-Collectors-Digest-Baseball-Card-Price-Guide-Monthly-Panels_31-35-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1990-1-1990-star-will-clark-mark-grace', 1990, '1990', '1', '1990 Star Will Clark Mark Grace', NULL,
        'Star', 'star', '1990_Star-Will-Clark-Mark-Grace_1-Fr.jpg', '1990_Star-Will-Clark-Mark-Grace_1-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1990-11-1990-star-will-clark-mark-grace', 1990, '1990', '11', '1990 Star Will Clark Mark Grace', NULL,
        'Star', 'star', '1990_Star-Will-Clark-Mark-Grace_11-Fr.jpg', '1990_Star-Will-Clark-Mark-Grace_11-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1990-3-1990-star-will-clark-mark-grace', 1990, '1990', '3', '1990 Star Will Clark Mark Grace', NULL,
        'Star', 'star', '1990_Star-Will-Clark-Mark-Grace_3-Fr.jpg', '1990_Star-Will-Clark-Mark-Grace_3-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1990-5-1990-star-will-clark-mark-grace', 1990, '1990', '5', '1990 Star Will Clark Mark Grace', NULL,
        'Star', 'star', '1990_Star-Will-Clark-Mark-Grace_5-Fr.jpg', '1990_Star-Will-Clark-Mark-Grace_5-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1990-7-1990-star-will-clark-mark-grace', 1990, '1990', '7', '1990 Star Will Clark Mark Grace', NULL,
        'Star', 'star', '1990_Star-Will-Clark-Mark-Grace_7-Fr.jpg', '1990_Star-Will-Clark-Mark-Grace_7-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1990-9-1990-star-will-clark-mark-grace', 1990, '1990', '9', '1990 Star Will Clark Mark Grace', NULL,
        'Star', 'star', '1990_Star-Will-Clark-Mark-Grace_9-Fr.jpg', '1990_Star-Will-Clark-Mark-Grace_9-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1990-12-1990-topps-1990-all-star-set-collector-s-edition-glossy-send-ins', 1990, '1990', '12', '1990 Topps 1990 All Star Set Collector''s Edition (Glossy Send Ins)', NULL,
        'Topps', 'topps', '1990_Topps-1990-All-Star-Set-Collector''s-Edition-(Glossy-Send-Ins)_12-Fr.jpg', '1990_Topps-1990-All-Star-Set-Collector''s-Edition-(Glossy-Send-Ins)_12-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1990-19-1990-topps-big', 1990, '1990', '19', '1990 Topps Big', NULL,
        'Topps', 'topps', '1990_Topps-Big_19-Fr-v2.jpg', '1990_Topps-Big_19-Bk-v2.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1990-240-1990-topps-collector-s-edition-tiffany', 1990, '1990', '240', '1990 Topps Collector''s Edition (Tiffany)', NULL,
        'Topps', 'topps', '1990_Topps-Collector''s-Edition-(Tiffany)_240-Fr-v2.jpg', '1990_Topps-Collector''s-Edition-(Tiffany)_240-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1990-56-1990-topps-stickers', 1990, '1990', '56', '1990 Topps Stickers', NULL,
        'Topps', 'topps', '1990_Topps-Stickers_56-Fr-v2.jpg', '1990_Topps-Stickers_56-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1990-128-1990-upper-deck', 1990, '1990', '128', '1990 Upper Deck', NULL,
        'Upper Deck', 'upperdeck', '1990_Upper-Deck_128-Fr-v2.jpg', '1990_Upper-Deck_128-Bk-v2.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1991-64-1991-92-allan-kaye-s-sports-cards-news-magazine-standard-size-1992-panels', 1991, '1991', '64', '1991 92 Allan Kaye''s Sports Cards News Magazine Standard size 1992 Panels', NULL,
        NULL, NULL, '1991-92_Allan-Kaye''s-Sports-Cards-News-Magazine-Standard-size-1992-Panels_64-Fr-v2.jpg', '1991-92_Allan-Kaye''s-Sports-Cards-News-Magazine-Standard-size-1992-Panels_64-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1991-69-1991-92-allan-kaye-s-sports-cards-news-magazine-standard-size-1992', 1991, '1991', '69', '1991 92 Allan Kaye''s Sports Cards News Magazine Standard size 1992', NULL,
        NULL, NULL, '1991-92_Allan-Kaye''s-Sports-Cards-News-Magazine-Standard-size-1992_69-Fr-v2.jpg', '1991-92_Allan-Kaye''s-Sports-Cards-News-Magazine-Standard-size-1992_69-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1991-nno-1991-chicago-cubs-vine-line-panels', 1991, '1991', 'NNO', '1991 Chicago Cubs Vine Line Panels', NULL,
        NULL, NULL, '1991_Chicago-Cubs-Vine-Line-Panels_NNO-Fr-v2.jpg', NULL,
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1991-5376201010-1991-kenner-starting-lineup-cards', 1991, '1991', '5376201010', '1991 Kenner Starting Lineup Cards', NULL,
        NULL, NULL, '1991_Kenner-Starting-Lineup-Cards_5376201010-Fr.jpg', '1991_Kenner-Starting-Lineup-Cards_5376201010-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1991-5376201011-1991-kenner-starting-lineup-cards', 1991, '1991', '5376201011', '1991 Kenner Starting Lineup Cards', NULL,
        NULL, NULL, '1991_Kenner-Starting-Lineup-Cards_5376201011-Fr-v2.jpg', '1991_Kenner-Starting-Lineup-Cards_5376201011-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1991-6-1991-score-7-eleven-superstar-action-coins-midwest-region', 1991, '1991', '6', '1991 Score 7 Eleven Superstar Action Coins Midwest Region', NULL,
        'Score', 'score', '1991_Score-7-Eleven-Superstar-Action-Coins-Midwest-Region_6-Fr-v2.jpg', '1991_Score-7-Eleven-Superstar-Action-Coins-Midwest-Region_6-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1991-280-288-1991-sports-illustrated-for-kids-panels', 1991, '1991', '280-288', '1991 Sports Illustrated for Kids Panels', NULL,
        'SP', 'sp', '1991_Sports-Illustrated-for-Kids-Panels_280-288-Fr-v2.jpg', '1991_Sports-Illustrated-for-Kids-Panels_280-288-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1991-11-15-20-24-1991-topps-cracker-jack-series-one-4-in-1', 1991, '1991', '11-15-20-24', '1991 Topps Cracker Jack (Series One) 4 in 1', NULL,
        'Topps', 'topps', '1991_Topps-Cracker-Jack-(Series-One)-4-in-1_11-15-20-24-Fr-v2.jpg', '1991_Topps-Cracker-Jack-(Series-One)-4-in-1_11-15-20-24-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1991-16-1991-topps-superstar-stand-ups-clear', 1991, '1991', '16', '1991 Topps Superstar Stand Ups Clear', NULL,
        'Topps', 'topps', '1991_Topps-Superstar-Stand-Ups-Clear_16-Fr.jpg', '1991_Topps-Superstar-Stand-Ups-Clear_16-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1992-nno-1992-high-5-reusable-decals-decal-panels', 1992, '1992', 'NNO', '1992 High 5 Reusable Decals Decal Panels', NULL,
        NULL, NULL, '1992_High-5-Reusable-Decals-Decal-Panels_NNO-Fr-v2.jpg', '1992_High-5-Reusable-Decals-Decal-Panels_NNO-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1992-7-1992-jka-baseball-star-buttons', 1992, '1992', '7', '1992 JKA Baseball Star Buttons', NULL,
        NULL, NULL, '1992_JKA-Baseball-Star-Buttons_7-Fr-v2.jpg', '1992_JKA-Baseball-Star-Buttons_7-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1993-sc56-sc63-1993-baseball-cards-magazine-sports-card-magazine-repli-cards-panels', 1993, '1993', 'SC56-SC63', '1993 Baseball Cards Magazine Sports Card Magazine Repli Cards Panels', NULL,
        NULL, NULL, '1993_Baseball-Cards-Magazine-Sports-Card-Magazine-Repli-Cards-Panels_SC56-SC63-Fr-v2.jpg', '1993_Baseball-Cards-Magazine-Sports-Card-Magazine-Repli-Cards-Panels_SC56-SC63-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1993-sc56-1993-baseball-cards-magazine-sports-card-magazine-repli-cards', 1993, '1993', 'SC56', '1993 Baseball Cards Magazine Sports Card Magazine Repli Cards', NULL,
        NULL, NULL, '1993_Baseball-Cards-Magazine-Sports-Card-Magazine-Repli-Cards_SC56-Fr-v2.jpg', '1993_Baseball-Cards-Magazine-Sports-Card-Magazine-Repli-Cards_SC56-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1993-715-1993-donruss', 1993, '1993', '715', '1993 Donruss', NULL,
        'Donruss', 'donruss', '1993_Donruss_715-Fr.jpg', '1993_Donruss_715-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1993-83-1993-sp', 1993, '1993', '83', '1993 SP', NULL,
        'SP', 'sp', '1993_SP_83-Fr.jpg', '1993_SP_83-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1993-89-1993-sports-collectors-digest-sports-card-pocket-price-guide', 1993, '1993', '89', '1993 Sports Collectors Digest Sports Card Pocket Price Guide', NULL,
        'SP', 'sp', '1993_Sports-Collectors-Digest-Sports-Card-Pocket-Price-Guide_89-Fr.jpg', '1993_Sports-Collectors-Digest-Sports-Card-Pocket-Price-Guide_89-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1993-483-1993-upper-deck-gold-hologram', 1993, '1993', '483', '1993 Upper Deck Gold Hologram', NULL,
        'Upper Deck', 'upperdeck', '1993_Upper-Deck-Gold-Hologram_483-Fr-v2.jpg', '1993_Upper-Deck-Gold-Hologram_483-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1993-wi-1993-upper-deck-iooss-collection', 1993, '1993', 'WI', '1993 Upper Deck Iooss Collection', NULL,
        'Upper Deck', 'upperdeck', '1993_Upper-Deck-Iooss-Collection_WI-Fr.jpg', '1993_Upper-Deck-Iooss-Collection_WI-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1993-483-1993-upper-deck', 1993, '1993', '483', '1993 Upper Deck', NULL,
        'Upper Deck', 'upperdeck', '1993_Upper-Deck_483-Fr.jpg', '1993_Upper-Deck_483-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1994-715-1994-fleer', 1994, '1994', '715', '1994 Fleer', NULL,
        'Fleer', 'fleer', '1994_Fleer_715-Fr.jpg', '1994_Fleer_715-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1994-69-1994-sp', 1994, '1994', '69', '1994 SP', NULL,
        'SP', 'sp', '1994_SP_69-Fr.jpg', '1994_SP_69-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1994-abcd-1994-topps-black-gold-certified-winners-redeemed-exchange', 1994, '1994', 'ABCD', '1994 Topps Black Gold Certified Winners Redeemed Exchange', NULL,
        'Topps', 'topps', '1994_Topps-Black-Gold-Certified-Winners-Redeemed-Exchange_ABCD-Fr-v2.jpg', '1994_Topps-Black-Gold-Certified-Winners-Redeemed-Exchange_ABCD-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1994-c-1994-topps-black-gold-certified-winners-redeemed-exchange', 1994, '1994', 'C', '1994 Topps Black Gold Certified Winners Redeemed Exchange', NULL,
        'Topps', 'topps', '1994_Topps-Black-Gold-Certified-Winners-Redeemed-Exchange_C-Fr-v2.jpg', '1994_Topps-Black-Gold-Certified-Winners-Redeemed-Exchange_C-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1994-cd-1994-topps-black-gold-certified-winners-redeemed-exchange', 1994, '1994', 'CD', '1994 Topps Black Gold Certified Winners Redeemed Exchange', NULL,
        'Topps', 'topps', '1994_Topps-Black-Gold-Certified-Winners-Redeemed-Exchange_CD-Fr.jpg', '1994_Topps-Black-Gold-Certified-Winners-Redeemed-Exchange_CD-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1994-abcd-1994-topps-black-gold-winners-redemptions', 1994, '1994', 'ABCD', '1994 Topps Black Gold Winners Redemptions', NULL,
        'Topps', 'topps', '1994_Topps-Black-Gold-Winners-Redemptions_ABCD-Fr-v2.jpg', '1994_Topps-Black-Gold-Winners-Redemptions_ABCD-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1994-c-1994-topps-black-gold-winners-redemptions', 1994, '1994', 'C', '1994 Topps Black Gold Winners Redemptions', NULL,
        'Topps', 'topps', '1994_Topps-Black-Gold-Winners-Redemptions_C-Fr-v2.jpg', '1994_Topps-Black-Gold-Winners-Redemptions_C-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1994-cd-1994-topps-black-gold-winners-redemptions', 1994, '1994', 'CD', '1994 Topps Black Gold Winners Redemptions', NULL,
        'Topps', 'topps', '1994_Topps-Black-Gold-Winners-Redemptions_CD-Fr-v2.jpg', '1994_Topps-Black-Gold-Winners-Redemptions_CD-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1994-33-1994-topps-black-gold', 1994, '1994', '33', '1994 Topps Black Gold', NULL,
        'Topps', 'topps', '1994_Topps-Black-Gold_33-Fr-v2.jpg', '1994_Topps-Black-Gold_33-Bk-v2.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1994-410-1994-topps-superstar-samplers-bowman', 1994, '1994', '410', '1994 Topps Superstar Samplers Bowman', NULL,
        'Topps', 'topps', '1994_Topps-Superstar-Samplers-Bowman_410-Fr.jpg', '1994_Topps-Superstar-Samplers-Bowman_410-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1994-390-1994-topps-superstar-samplers-finest', 1994, '1994', '390', '1994 Topps Superstar Samplers Finest', NULL,
        'Topps', 'topps', '1994_Topps-Superstar-Samplers-Finest_390-Fr.jpg', '1994_Topps-Superstar-Samplers-Finest_390-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1994-403-1994-topps-superstar-samplers-stadium-club', 1994, '1994', '403', '1994 Topps Superstar Samplers Stadium Club', NULL,
        'Topps', 'topps', '1994_Topps-Superstar-Samplers-Stadium-Club_403-Fr.jpg', '1994_Topps-Superstar-Samplers-Stadium-Club_403-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1994-360-1994-topps', 1994, '1994', '360', '1994 Topps', NULL,
        'Topps', 'topps', '1994_Topps_360-Fr-v2.jpg', '1994_Topps_360-Bk-v2.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1995-28-1995-cardtoons', 1995, '1995', '28', '1995 Cardtoons', NULL,
        NULL, NULL, '1995_Cardtoons_28-Fr.jpg', '1995_Cardtoons_28-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1995-38-1995-sp', 1995, '1995', '38', '1995 SP', NULL,
        'SP', 'sp', '1995_SP_38-Fr.jpg', '1995_SP_38-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1995-424-432-1995-sports-illustrated-for-kids-panels', 1995, '1995', '424-432', '1995 Sports Illustrated for Kids Panels', NULL,
        'SP', 'sp', '1995_Sports-Illustrated-for-Kids-Panels_424-432-Fr.jpg', '1995_Sports-Illustrated-for-Kids-Panels_424-432-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1995-213-1995-stadium-club-super-team-exchange-1995-world-series', 1995, '1995', '213', '1995 Stadium Club Super Team Exchange 1995 World Series', NULL,
        'Stadium Club', 'stadiumclub', '1995_Stadium-Club-Super-Team-Exchange-1995-World-Series_213-Fr.jpg', '1995_Stadium-Club-Super-Team-Exchange-1995-World-Series_213-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1995-393-1995-stadium-club-super-team-exchange-1995-world-series', 1995, '1995', '393', '1995 Stadium Club Super Team Exchange 1995 World Series', NULL,
        'Stadium Club', 'stadiumclub', '1995_Stadium-Club-Super-Team-Exchange-1995-World-Series_393-Fr.jpg', '1995_Stadium-Club-Super-Team-Exchange-1995-World-Series_393-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1995-206-1995-stadium-club-virtual-reality-members-only', 1995, '1995', '206', '1995 Stadium Club Virtual Reality Members Only', NULL,
        'Stadium Club', 'stadiumclub', '1995_Stadium-Club-Virtual-Reality-Members-Only_206-Fr.jpg', '1995_Stadium-Club-Virtual-Reality-Members-Only_206-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1995-213-1995-topps-stadium-club-first-day-issue', 1995, '1995', '213', '1995 Topps Stadium Club First Day Issue', NULL,
        'Topps', 'topps', '1995_Topps-Stadium-Club-First-Day-Issue_213-Fr.jpg', '1995_Topps-Stadium-Club-First-Day-Issue_213-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1995-65-1995-upper-deck-electric-diamond-gold', 1995, '1995', '65', '1995 Upper Deck Electric Diamond Gold', NULL,
        'Upper Deck', 'upperdeck', '1995_Upper-Deck-Electric-Diamond-Gold_65-Fr.jpg', '1995_Upper-Deck-Electric-Diamond-Gold_65-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1995-257-1995-upper-deck-special-edition-gold', 1995, '1995', '257', '1995 Upper Deck Special Edition Gold', NULL,
        'Upper Deck', 'upperdeck', '1995_Upper-Deck-Special-Edition-Gold_257-Fr.jpg', '1995_Upper-Deck-Special-Edition-Gold_257-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1996-52-1996-pinnacle-aficionado-artist-s-proofs', 1996, '1996', '52', '1996 Pinnacle Aficionado Artist''s Proofs', NULL,
        'Pinnacle', 'pinnacle', '1996_Pinnacle-Aficionado-Artist''s-Proofs_52-Fr.jpg', '1996_Pinnacle-Aficionado-Artist''s-Proofs_52-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1996-52-1996-pinnacle-aficionado-first-pitch-preview', 1996, '1996', '52', '1996 Pinnacle Aficionado First Pitch Preview', NULL,
        'Pinnacle', 'pinnacle', '1996_Pinnacle-Aficionado-First-Pitch-Preview_52-Fr.jpg', '1996_Pinnacle-Aficionado-First-Pitch-Preview_52-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1996-143-1996-pinnacle-starburst-artist-s-proofs', 1996, '1996', '143', '1996 Pinnacle Starburst Artist''s Proofs', NULL,
        'Pinnacle', 'pinnacle', '1996_Pinnacle-Starburst-Artist''s-Proofs_143-Fr.jpg', '1996_Pinnacle-Starburst-Artist''s-Proofs_143-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1996-191-1996-pinnacle-starburst-artist-s-proofs', 1996, '1996', '191', '1996 Pinnacle Starburst Artist''s Proofs', NULL,
        'Pinnacle', 'pinnacle', '1996_Pinnacle-Starburst-Artist''s-Proofs_191-Fr.jpg', '1996_Pinnacle-Starburst-Artist''s-Proofs_191-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1996-145-1996-pinnacle-summit-above-and-beyond', 1996, '1996', '145', '1996 Pinnacle Summit Above and Beyond', NULL,
        'Pinnacle', 'pinnacle', '1996_Pinnacle-Summit-Above-and-Beyond_145-Fr.jpg', '1996_Pinnacle-Summit-Above-and-Beyond_145-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1996-145-1996-pinnacle-summit-artist-s-proofs', 1996, '1996', '145', '1996 Pinnacle Summit Artist''s Proofs', NULL,
        'Pinnacle', 'pinnacle', '1996_Pinnacle-Summit-Artist''s-Proofs_145-Fr.jpg', '1996_Pinnacle-Summit-Artist''s-Proofs_145-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1996-145-1996-pinnacle-summit-silver-foilboard', 1996, '1996', '145', '1996 Pinnacle Summit Silver Foilboard', NULL,
        'Pinnacle', 'pinnacle', '1996_Pinnacle-Summit-Silver-Foilboard_145-Fr.jpg', '1996_Pinnacle-Summit-Silver-Foilboard_145-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1996-15-1996-spx', 1996, '1996', '15', '1996 SPx', NULL,
        'SP', 'sp', '1996_SPx_15-Fr.jpg', '1996_SPx_15-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1996-55-1996-sp', 1996, '1996', '55', '1996 SP', NULL,
        'SP', 'sp', '1996_SP_55-Fr.jpg', '1996_SP_55-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1996-18-1996-score-dugout-collection-96-series-one', 1996, '1996', '18', '1996 Score Dugout Collection ''96 (Series One)', NULL,
        'Score', 'score', '1996_Score-Dugout-Collection-''96-(Series-One)_18-Fr.jpg', '1996_Score-Dugout-Collection-''96-(Series-One)_18-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1996-18-1996-score-dugout-collection-96-artist-s-proofs-series-one', 1996, '1996', '18', '1996 Score Dugout Collection ''96 Artist''s Proofs (Series One)', NULL,
        'Score', 'score', '1996_Score-Dugout-Collection-''96-Artist''s-Proofs-(Series-One)_18-Fr.jpg', '1996_Score-Dugout-Collection-''96-Artist''s-Proofs-(Series-One)_18-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1996-94-1996-select-certified-artist-s-proofs', 1996, '1996', '94', '1996 Select Certified Artist''s Proofs', NULL,
        NULL, NULL, '1996_Select-Certified-Artist''s-Proofs_94-Fr.jpg', '1996_Select-Certified-Artist''s-Proofs_94-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1996-94-1996-select-certified-certified-blue', 1996, '1996', '94', '1996 Select Certified Certified Blue', NULL,
        NULL, NULL, '1996_Select-Certified-Certified-Blue_94-Fr.jpg', '1996_Select-Certified-Certified-Blue_94-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1996-15-1996-select-team-nucleus', 1996, '1996', '15', '1996 Select Team Nucleus', NULL,
        NULL, NULL, '1996_Select-Team-Nucleus_15-Fr.jpg', '1996_Select-Team-Nucleus_15-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1996-nno-1996-stadium-club-extreme-players-bronze', 1996, '1996', 'NNO', '1996 Stadium Club Extreme Players Bronze', NULL,
        'Stadium Club', 'stadiumclub', '1996_Stadium-Club-Extreme-Players-Bronze_NNO-Fr.jpg', '1996_Stadium-Club-Extreme-Players-Bronze_NNO-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1996-nno-1996-stadium-club-extreme-players-gold', 1996, '1996', 'NNO', '1996 Stadium Club Extreme Players Gold', NULL,
        'Stadium Club', 'stadiumclub', '1996_Stadium-Club-Extreme-Players-Gold_NNO-Fr.jpg', '1996_Stadium-Club-Extreme-Players-Gold_NNO-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1996-nno-1996-stadium-club-extreme-players-silver', 1996, '1996', 'NNO', '1996 Stadium Club Extreme Players Silver', NULL,
        'Stadium Club', 'stadiumclub', '1996_Stadium-Club-Extreme-Players-Silver_NNO-Fr.jpg', '1996_Stadium-Club-Extreme-Players-Silver_NNO-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1996-180-1996-topps-gallery-player-s-private-issue', 1996, '1996', '180', '1996 Topps Gallery Player''s Private Issue', NULL,
        'Topps', 'topps', '1996_Topps-Gallery-Player''s-Private-Issue_180-Fr.jpg', '1996_Topps-Gallery-Player''s-Private-Issue_180-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1996-11-1996-ultra-prime-leather-gold-medallion', 1996, '1996', '11', '1996 Ultra Prime Leather Gold Medallion', NULL,
        'Ultra', 'ultra', '1996_Ultra-Prime-Leather-Gold-Medallion_11-Fr.jpg', '1996_Ultra-Prime-Leather-Gold-Medallion_11-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1997-71-1997-donruss-limited-limited-exposure-non-glossy', 1997, '1997', '71', '1997 Donruss Limited Limited Exposure Non Glossy', NULL,
        'Donruss', 'donruss', '1997_Donruss-Limited-Limited-Exposure-Non-Glossy_71-Fr.jpg', '1997_Donruss-Limited-Limited-Exposure-Non-Glossy_71-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1997-71-1997-donruss-limited-limited-exposure', 1997, '1997', '71', '1997 Donruss Limited Limited Exposure', NULL,
        'Donruss', 'donruss', '1997_Donruss-Limited-Limited-Exposure_71-Fr.jpg', '1997_Donruss-Limited-Limited-Exposure_71-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1997-71-1997-donruss-limited', 1997, '1997', '71', '1997 Donruss Limited', NULL,
        'Donruss', 'donruss', '1997_Donruss-Limited_71-Fr.jpg', '1997_Donruss-Limited_71-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1997-250-1997-pacific-crown-collection-silver', 1997, '1997', '250', '1997 Pacific Crown Collection Silver', NULL,
        'Pacific', 'pacific', '1997_Pacific-Crown-Collection-Silver_250-Fr.jpg', '1997_Pacific-Crown-Collection-Silver_250-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1997-84-1997-pacific-prism-invincible-light-blue', 1997, '1997', '84', '1997 Pacific Prism Invincible Light Blue', NULL,
        'Pacific', 'pacific', '1997_Pacific-Prism-Invincible-Light-Blue_84-Fr.jpg', '1997_Pacific-Prism-Invincible-Light-Blue_84-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1997-84-1997-pacific-prism-invincible-platinum', 1997, '1997', '84', '1997 Pacific Prism Invincible Platinum', NULL,
        'Pacific', 'pacific', '1997_Pacific-Prism-Invincible-Platinum_84-Fr.jpg', '1997_Pacific-Prism-Invincible-Platinum_84-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1997-44-1997-sp', 1997, '1997', '44', '1997 SP', NULL,
        'SP', 'sp', '1997_SP_44-Fr.jpg', NULL,
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1997-179-1997-score-artist-s-proofs-white-border', 1997, '1997', '179', '1997 Score Artist''s Proofs White Border', NULL,
        'Score', 'score', '1997_Score-Artist''s-Proofs-White-Border_179-Fr.jpg', '1997_Score-Artist''s-Proofs-White-Border_179-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1997-61-1997-skybox-e-x2000', 1997, '1997', '61', '1997 SkyBox E X2000', NULL,
        'SkyBox', 'skybox', '1997_SkyBox-E-X2000_61-Fr.jpg', '1997_SkyBox-E-X2000_61-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1997-96-1997-sports-illustrated-extra-edition', 1997, '1997', '96', '1997 Sports Illustrated Extra Edition', NULL,
        'SP', 'sp', '1997_Sports-Illustrated-Extra-Edition_96-Fr.jpg', '1997_Sports-Illustrated-Extra-Edition_96-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1997-pl10-1997-stadium-club-patent-leather-members-only', 1997, '1997', 'PL10', '1997 Stadium Club Patent Leather Members Only', NULL,
        'Stadium Club', 'stadiumclub', '1997_Stadium-Club-Patent-Leather-Members-Only_PL10-Fr.jpg', '1997_Stadium-Club-Patent-Leather-Members-Only_PL10-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-70-1998-donruss-collections-donruss', 1998, '1998', '70', '1998 Donruss Collections Donruss', NULL,
        'Donruss', 'donruss', '1998_Donruss-Collections-Donruss_70-Fr.jpg', '1998_Donruss-Collections-Donruss_70-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-pc-1998-donruss-collections-leaf-prized-collections', 1998, '1998', 'PC', '1998 Donruss Collections Leaf Prized Collections', NULL,
        'Donruss', 'donruss', '1998_Donruss-Collections-Leaf-Prized-Collections_PC-Fr.jpg', '1998_Donruss-Collections-Leaf-Prized-Collections_PC-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-113-1998-flair-showcase-flair-showcase-row-0-showcase', 1998, '1998', '113', '1998 Flair Showcase Flair Showcase Row 0 (Showcase)', NULL,
        NULL, NULL, '1998_Flair-Showcase-Flair-Showcase-Row-0-(Showcase)_113-Fr.jpg', '1998_Flair-Showcase-Flair-Showcase-Row-0-(Showcase)_113-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-113-1998-flair-showcase-flair-showcase-row-1-grace', 1998, '1998', '113', '1998 Flair Showcase Flair Showcase Row 1 (Grace)', NULL,
        NULL, NULL, '1998_Flair-Showcase-Flair-Showcase-Row-1-(Grace)_113-Fr.jpg', '1998_Flair-Showcase-Flair-Showcase-Row-1-(Grace)_113-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-113-1998-flair-showcase-flair-showcase-row-2-style', 1998, '1998', '113', '1998 Flair Showcase Flair Showcase Row 2 (Style)', NULL,
        NULL, NULL, '1998_Flair-Showcase-Flair-Showcase-Row-2-(Style)_113-Fr.jpg', '1998_Flair-Showcase-Flair-Showcase-Row-2-(Style)_113-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-113-1998-flair-showcase-legacy-collection-row-0-showcase', 1998, '1998', '113', '1998 Flair Showcase Legacy Collection Row 0 (Showcase)', NULL,
        NULL, NULL, '1998_Flair-Showcase-Legacy-Collection-Row-0-(Showcase)_113-Fr.jpg', '1998_Flair-Showcase-Legacy-Collection-Row-0-(Showcase)_113-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-113-1998-flair-showcase-legacy-collection-row-2-style', 1998, '1998', '113', '1998 Flair Showcase Legacy Collection Row 2 (Style)', NULL,
        NULL, NULL, '1998_Flair-Showcase-Legacy-Collection-Row-2-(Style)_113-Fr.jpg', '1998_Flair-Showcase-Legacy-Collection-Row-2-(Style)_113-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-6-1998-fleer-tradition-decade-of-excellence', 1998, '1998', '6', '1998 Fleer Tradition Decade of Excellence', NULL,
        'Fleer', 'fleer', '1998_Fleer-Tradition-Decade-of-Excellence_6-Fr.jpg', '1998_Fleer-Tradition-Decade-of-Excellence_6-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-130-1998-pacific-invincible-gems-of-the-diamond', 1998, '1998', '130', '1998 Pacific Invincible Gems of the Diamond', NULL,
        'Pacific', 'pacific', '1998_Pacific-Invincible-Gems-of-the-Diamond_130-Fr.jpg', '1998_Pacific-Invincible-Gems-of-the-Diamond_130-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-83-1998-pacific-invincible-platinum-blue', 1998, '1998', '83', '1998 Pacific Invincible Platinum Blue', NULL,
        'Pacific', 'pacific', '1998_Pacific-Invincible-Platinum-Blue_83-Fr.jpg', '1998_Pacific-Invincible-Platinum-Blue_83-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-5-1998-pacific-invincible-team-checklists', 1998, '1998', '5', '1998 Pacific Invincible Team Checklists', NULL,
        'Pacific', 'pacific', '1998_Pacific-Invincible-Team-Checklists_5-Fr.jpg', '1998_Pacific-Invincible-Team-Checklists_5-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-141-1998-pacific-online-web-cards-gold-foil', 1998, '1998', '141', '1998 Pacific Online Web Cards (Gold Foil)', NULL,
        'Pacific', 'pacific', '1998_Pacific-Online-Web-Cards-(Gold-Foil)_141-Fr.jpg', '1998_Pacific-Online-Web-Cards-(Gold-Foil)_141-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-16-1998-pacific-team-checklists', 1998, '1998', '16', '1998 Pacific Team Checklists', NULL,
        'Pacific', 'pacific', '1998_Pacific-Team-Checklists_16-Fr.jpg', '1998_Pacific-Team-Checklists_16-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-86-1998-pinnacle-certified-test-issue-certified-red-test-issue', 1998, '1998', '86', '1998 Pinnacle Certified Test Issue Certified Red Test Issue', NULL,
        'Pinnacle', 'pinnacle', '1998_Pinnacle-Certified-Test-Issue-Certified-Red-Test-Issue_86-Fr.jpg', '1998_Pinnacle-Certified-Test-Issue-Certified-Red-Test-Issue_86-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-45-1998-pinnacle-inside-diamond-edition', 1998, '1998', '45', '1998 Pinnacle Inside Diamond Edition', NULL,
        'Pinnacle', 'pinnacle', '1998_Pinnacle-Inside-Diamond-Edition_45-Fr.jpg', '1998_Pinnacle-Inside-Diamond-Edition_45-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-59-1998-pinnacle-performers-peak-performers', 1998, '1998', '59', '1998 Pinnacle Performers Peak Performers', NULL,
        'Pinnacle', 'pinnacle', '1998_Pinnacle-Performers-Peak-Performers_59-Fr.jpg', '1998_Pinnacle-Performers-Peak-Performers_59-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-rtpp119-1998-score-rookie-traded-showcase-series', 1998, '1998', 'RTPP119', '1998 Score Rookie & Traded Showcase Series', NULL,
        'Score', 'score', '1998_Score-Rookie-&-Traded-Showcase-Series_RTPP119-Fr.jpg', '1998_Score-Rookie-&-Traded-Showcase-Series_RTPP119-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-9-1998-skybox-dugout-axcess-inside-axcess', 1998, '1998', '9', '1998 SkyBox Dugout Axcess Inside Axcess', NULL,
        'SkyBox', 'skybox', '1998_SkyBox-Dugout-Axcess-Inside-Axcess_9-Fr.jpg', '1998_SkyBox-Dugout-Axcess-Inside-Axcess_9-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-64-1998-skybox-e-x2001-essential-credentials-now', 1998, '1998', '64', '1998 SkyBox E X2001 Essential Credentials Now', NULL,
        'SkyBox', 'skybox', '1998_SkyBox-E-X2001-Essential-Credentials-Now_64-Fr.jpg', '1998_SkyBox-E-X2001-Essential-Credentials-Now_64-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-64-1998-skybox-e-x2001', 1998, '1998', '64', '1998 SkyBox E X2001', NULL,
        'SkyBox', 'skybox', '1998_SkyBox-E-X2001_64-Fr.jpg', '1998_SkyBox-E-X2001_64-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-86-1998-sports-illustrated-then-and-now-extra-edition', 1998, '1998', '86', '1998 Sports Illustrated Then and Now Extra Edition', NULL,
        'SP', 'sp', '1998_Sports-Illustrated-Then-and-Now-Extra-Edition_86-Fr.jpg', '1998_Sports-Illustrated-Then-and-Now-Extra-Edition_86-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-41-1998-sports-illustrated-world-series-fever', 1998, '1998', '41', '1998 Sports Illustrated World Series Fever', NULL,
        'SP', 'sp', '1998_Sports-Illustrated-World-Series-Fever_41-Fr.jpg', '1998_Sports-Illustrated-World-Series-Fever_41-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-nno-1998-topps-gallery-players-private-issue-100-auction-points', 1998, '1998', 'NNO', '1998 Topps Gallery Players Private Issue 100 Auction Points', NULL,
        'Topps', 'topps', '1998_Topps-Gallery-Players-Private-Issue-100-Auction-Points_NNO-Fr.jpg', '1998_Topps-Gallery-Players-Private-Issue-100-Auction-Points_NNO-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-nno-1998-topps-gallery-players-private-issue-25-auction-points', 1998, '1998', 'NNO', '1998 Topps Gallery Players Private Issue 25 Auction Points', NULL,
        'Topps', 'topps', '1998_Topps-Gallery-Players-Private-Issue-25-Auction-Points_NNO-Fr.jpg', '1998_Topps-Gallery-Players-Private-Issue-25-Auction-Points_NNO-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-nno-1998-topps-gallery-players-private-issue-50-auction-points', 1998, '1998', 'NNO', '1998 Topps Gallery Players Private Issue 50 Auction Points', NULL,
        'Topps', 'topps', '1998_Topps-Gallery-Players-Private-Issue-50-Auction-Points_NNO-Fr.jpg', '1998_Topps-Gallery-Players-Private-Issue-50-Auction-Points_NNO-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-nno-1998-topps-gallery-players-private-issue-75-auction-points', 1998, '1998', 'NNO', '1998 Topps Gallery Players Private Issue 75 Auction Points', NULL,
        'Topps', 'topps', '1998_Topps-Gallery-Players-Private-Issue-75-Auction-Points_NNO-Fr.jpg', '1998_Topps-Gallery-Players-Private-Issue-75-Auction-Points_NNO-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-ppi58-1998-topps-gallery-players-private-issue', 1998, '1998', 'PPI58', '1998 Topps Gallery Players Private Issue', NULL,
        'Topps', 'topps', '1998_Topps-Gallery-Players-Private-Issue_PPI58-Fr.jpg', '1998_Topps-Gallery-Players-Private-Issue_PPI58-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-92-1998-topps-gold-label-class-1-black-label', 1998, '1998', '92', '1998 Topps Gold Label Class 1 Black Label', NULL,
        'Topps', 'topps', '1998_Topps-Gold-Label-Class-1-Black-Label_92-Fr.jpg', '1998_Topps-Gold-Label-Class-1-Black-Label_92-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-92-1998-topps-gold-label-class-1-red-label', 1998, '1998', '92', '1998 Topps Gold Label Class 1 Red Label', NULL,
        'Topps', 'topps', '1998_Topps-Gold-Label-Class-1-Red-Label_92-Fr.jpg', '1998_Topps-Gold-Label-Class-1-Red-Label_92-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-92-1998-topps-gold-label-class-2-black-label', 1998, '1998', '92', '1998 Topps Gold Label Class 2 Black Label', NULL,
        'Topps', 'topps', '1998_Topps-Gold-Label-Class-2-Black-Label_92-Fr.jpg', '1998_Topps-Gold-Label-Class-2-Black-Label_92-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-92-1998-topps-gold-label-class-2-red-label', 1998, '1998', '92', '1998 Topps Gold Label Class 2 Red Label', NULL,
        'Topps', 'topps', '1998_Topps-Gold-Label-Class-2-Red-Label_92-Fr.jpg', '1998_Topps-Gold-Label-Class-2-Red-Label_92-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-92-1998-topps-gold-label-class-3-black-label', 1998, '1998', '92', '1998 Topps Gold Label Class 3 Black Label', NULL,
        'Topps', 'topps', '1998_Topps-Gold-Label-Class-3-Black-Label_92-Fr.jpg', '1998_Topps-Gold-Label-Class-3-Black-Label_92-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-ilm19-1998-topps-interleague-match-up-mystery-finest-refractors', 1998, '1998', 'ILM19', '1998 Topps Interleague Match Up Mystery Finest Refractors', NULL,
        'Topps', 'topps', '1998_Topps-Interleague-Match-Up-Mystery-Finest-Refractors_ILM19-Fr.jpg', '1998_Topps-Interleague-Match-Up-Mystery-Finest-Refractors_ILM19-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-ilm19-1998-topps-interleague-match-up-mystery-finest', 1998, '1998', 'ILM19', '1998 Topps Interleague Match Up Mystery Finest', NULL,
        'Topps', 'topps', '1998_Topps-Interleague-Match-Up-Mystery-Finest_ILM19-Fr.jpg', '1998_Topps-Interleague-Match-Up-Mystery-Finest_ILM19-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-78-1998-topps-tek-diffractors-pattern-11', 1998, '1998', '78', '1998 Topps Tek Diffractors Pattern 11', NULL,
        'Topps', 'topps', '1998_Topps-Tek-Diffractors-Pattern-11_78-Fr.jpg', '1998_Topps-Tek-Diffractors-Pattern-11_78-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-78-1998-topps-tek-diffractors-pattern-6', 1998, '1998', '78', '1998 Topps Tek Diffractors Pattern 6', NULL,
        'Topps', 'topps', '1998_Topps-Tek-Diffractors-Pattern-6_78-Fr.jpg', '1998_Topps-Tek-Diffractors-Pattern-6_78-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-24-1998-upper-deck-10th-anniversary-preview-edition-retail', 1998, '1998', '24', '1998 Upper Deck 10th Anniversary Preview Edition Retail', NULL,
        'Upper Deck', 'upperdeck', '1998_Upper-Deck-10th-Anniversary-Preview-Edition-Retail_24-Fr.jpg', '1998_Upper-Deck-10th-Anniversary-Preview-Edition-Retail_24-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-24-1998-upper-deck-10th-anniversary-preview', 1998, '1998', '24', '1998 Upper Deck 10th Anniversary Preview', NULL,
        'Upper Deck', 'upperdeck', '1998_Upper-Deck-10th-Anniversary-Preview_24-Fr.jpg', '1998_Upper-Deck-10th-Anniversary-Preview_24-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-g18-1998-upper-deck-retro-groovy-kind-of-glove', 1998, '1998', 'G18', '1998 Upper Deck Retro Groovy Kind of Glove', NULL,
        'Upper Deck', 'upperdeck', '1998_Upper-Deck-Retro-Groovy-Kind-of-Glove_G18-Fr.jpg', '1998_Upper-Deck-Retro-Groovy-Kind-of-Glove_G18-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1998-z32-1998-zenith-oversized-gold-impulse-5x7', 1998, '1998', 'Z32', '1998 Zenith Oversized Gold Impulse 5x7', NULL,
        'Zenith', 'zenith', '1998_Zenith-Oversized-Gold-Impulse-5x7_Z32-Fr.jpg', '1998_Zenith-Oversized-Gold-Impulse-5x7_Z32-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1999-90-1999-pacific-private-stock-mini-ps-206', 1999, '1999', '90', '1999 Pacific Private Stock Mini PS 206', NULL,
        'Pacific', 'pacific', '1999_Pacific-Private-Stock-Mini-PS-206_90-Fr.jpg', '1999_Pacific-Private-Stock-Mini-PS-206_90-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1999-28-1999-pacific-revolution-shadow-series', 1999, '1999', '28', '1999 Pacific Revolution Shadow Series', NULL,
        'Pacific', 'pacific', '1999_Pacific-Revolution-Shadow-Series_28-Fr.jpg', '1999_Pacific-Revolution-Shadow-Series_28-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1999-28-1999-spx', 1999, '1999', '28', '1999 SPx', NULL,
        'SP', 'sp', '1999_SPx_28-Fr.jpg', '1999_SPx_28-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1999-47-1999-skybox-e-x-century-essential-credentials-future', 1999, '1999', '47', '1999 SkyBox E X Century Essential Credentials Future', NULL,
        'SkyBox', 'skybox', '1999_SkyBox-E-X-Century-Essential-Credentials-Future_47-Fr.jpg', '1999_SkyBox-E-X-Century-Essential-Credentials-Future_47-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1999-47-1999-skybox-e-x-century-essential-credentials-now', 1999, '1999', '47', '1999 SkyBox E X Century Essential Credentials Now', NULL,
        'SkyBox', 'skybox', '1999_SkyBox-E-X-Century-Essential-Credentials-Now_47-Fr.jpg', '1999_SkyBox-E-X-Century-Essential-Credentials-Now_47-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1999-t8b-1999-stadium-club-triumvirate-illuminator', 1999, '1999', 'T8B', '1999 Stadium Club Triumvirate Illuminator', NULL,
        'Stadium Club', 'stadiumclub', '1999_Stadium-Club-Triumvirate-Illuminator_T8B-Fr.jpg', '1999_Stadium-Club-Triumvirate-Illuminator_T8B-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1999-t8b-1999-stadium-club-triumvirate-luminescent', 1999, '1999', 'T8B', '1999 Stadium Club Triumvirate Luminescent', NULL,
        'Stadium Club', 'stadiumclub', '1999_Stadium-Club-Triumvirate-Luminescent_T8B-Fr.jpg', '1999_Stadium-Club-Triumvirate-Luminescent_T8B-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1999-t8b-1999-stadium-club-triumvirate-luminous', 1999, '1999', 'T8B', '1999 Stadium Club Triumvirate Luminous', NULL,
        'Stadium Club', 'stadiumclub', '1999_Stadium-Club-Triumvirate-Luminous_T8B-Fr.jpg', '1999_Stadium-Club-Triumvirate-Luminous_T8B-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1999-7-1999-upper-deck-ovation-standing-ovation', 1999, '1999', '7', '1999 Upper Deck Ovation Standing Ovation', NULL,
        'Upper Deck', 'upperdeck', '1999_Upper-Deck-Ovation-Standing-Ovation_7-Fr.jpg', '1999_Upper-Deck-Ovation-Standing-Ovation_7-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('1999-25-1999-upper-deck-ultimate-victory-ultimate-collection', 1999, '1999', '25', '1999 Upper Deck Ultimate Victory Ultimate Collection', NULL,
        'Upper Deck', 'upperdeck', '1999_Upper-Deck-Ultimate-Victory-Ultimate-Collection_25-Fr.jpg', '1999_Upper-Deck-Ultimate-Victory-Ultimate-Collection_25-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2000-20-2000-bowman-retro-future', 2000, '2000', '20', '2000 Bowman Retro Future', NULL,
        'Bowman', 'bowman', '2000_Bowman-Retro-Future_20-Fr.jpg', '2000_Bowman-Retro-Future_20-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2000-nno-2000-chicago-cubs-spring-training-program', 2000, '2000', 'NNO', '2000 Chicago Cubs Spring Training Program', NULL,
        NULL, NULL, '2000_Chicago-Cubs-Spring-Training-Program_NNO-Fr.jpg', '2000_Chicago-Cubs-Spring-Training-Program_NNO-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2000-s54-2000-mlb-showdown-1st-edition-strategy', 2000, '2000', 'S54', '2000 MLB Showdown 1st Edition Strategy', NULL,
        NULL, NULL, '2000_MLB-Showdown-1st-Edition-Strategy_S54-Fr.jpg', '2000_MLB-Showdown-1st-Edition-Strategy_S54-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2000-6-2000-metal-fusion', 2000, '2000', '6', '2000 Metal Fusion', NULL,
        NULL, NULL, '2000_Metal-Fusion_6-Fr.jpg', '2000_Metal-Fusion_6-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2000-48-2000-pacific-crown-collection-holographic-purple', 2000, '2000', '48', '2000 Pacific Crown Collection Holographic Purple', NULL,
        'Pacific', 'pacific', '2000_Pacific-Crown-Collection-Holographic-Purple_48-Fr.jpg', '2000_Pacific-Crown-Collection-Holographic-Purple_48-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2000-28-2000-pacific-invincible-holographic-purple', 2000, '2000', '28', '2000 Pacific Invincible Holographic Purple', NULL,
        'Pacific', 'pacific', '2000_Pacific-Invincible-Holographic-Purple_28-Fr.jpg', '2000_Pacific-Invincible-Holographic-Purple_28-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2000-43-2000-pacific-paramount-premiere-date', 2000, '2000', '43', '2000 Pacific Paramount Premiere Date', NULL,
        'Pacific', 'pacific', '2000_Pacific-Paramount-Premiere-Date_43-Fr.jpg', '2000_Pacific-Paramount-Premiere-Date_43-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2000-22-2000-pacific-private-stock-premiere-date', 2000, '2000', '22', '2000 Pacific Private Stock Premiere Date', NULL,
        'Pacific', 'pacific', '2000_Pacific-Private-Stock-Premiere-Date_22-Fr.jpg', '2000_Pacific-Private-Stock-Premiere-Date_22-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2000-57-2000-pacific-vanguard-holographic-gold', 2000, '2000', '57', '2000 Pacific Vanguard Holographic Gold', NULL,
        'Pacific', 'pacific', '2000_Pacific-Vanguard-Holographic-Gold_57-Fr.jpg', '2000_Pacific-Vanguard-Holographic-Gold_57-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2000-22-2000-spx', 2000, '2000', '22', '2000 SPx', NULL,
        'SP', 'sp', '2000_SPx_22-Fr.jpg', '2000_SPx_22-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2000-43-2000-skybox-e-x-essential-credentials-future', 2000, '2000', '43', '2000 SkyBox E X Essential Credentials Future', NULL,
        'SkyBox', 'skybox', '2000_SkyBox-E-X-Essential-Credentials-Future_43-Fr.jpg', '2000_SkyBox-E-X-Essential-Credentials-Future_43-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2000-b7-2000-topps-gold-label-bullion', 2000, '2000', 'B7', '2000 Topps Gold Label Bullion', NULL,
        'Topps', 'topps', '2000_Topps-Gold-Label-Bullion_B7-Fr.jpg', '2000_Topps-Gold-Label-Bullion_B7-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2000-90-2000-upper-deck-victory', 2000, '2000', '90', '2000 Upper Deck Victory', NULL,
        'Upper Deck', 'upperdeck', '2000_Upper-Deck-Victory_90-Fr.jpg', '2000_Upper-Deck-Victory_90-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2001-nno-2001-fleer-e-x-behind-the-numbers-game-jersey', 2001, '2001', 'NNO', '2001 Fleer E X Behind the Numbers Game Jersey', NULL,
        'Fleer', 'fleer', '2001_Fleer-E-X-Behind-the-Numbers-Game-Jersey_NNO-Fr.jpg', '2001_Fleer-E-X-Behind-the-Numbers-Game-Jersey_NNO-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2001-nno-2001-fleer-platinum-national-patch-time', 2001, '2001', 'NNO', '2001 Fleer Platinum National Patch Time', NULL,
        'Fleer', 'fleer', '2001_Fleer-Platinum-National-Patch-Time_NNO-Fr.jpg', '2001_Fleer-Platinum-National-Patch-Time_NNO-Bk.jpg',
        0, 1, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2001-500-2001-fleer-platinum', 2001, '2001', '500', '2001 Fleer Platinum', NULL,
        'Fleer', 'fleer', '2001_Fleer-Platinum_500-Fr.jpg', '2001_Fleer-Platinum_500-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2001-fg-110-2001-leaf-certified-materials-fabric-of-the-game-base', 2001, '2001', 'FG-110', '2001 Leaf Certified Materials Fabric of the Game Base', NULL,
        'Leaf', 'leaf', '2001_Leaf-Certified-Materials-Fabric-of-the-Game-Base_FG-110-Fr.jpg', '2001_Leaf-Certified-Materials-Fabric-of-the-Game-Base_FG-110-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2001-fg-110-2001-leaf-certified-materials-fabric-of-the-game-career', 2001, '2001', 'FG-110', '2001 Leaf Certified Materials Fabric of the Game Career', NULL,
        'Leaf', 'leaf', '2001_Leaf-Certified-Materials-Fabric-of-the-Game-Career_FG-110-Fr.jpg', '2001_Leaf-Certified-Materials-Fabric-of-the-Game-Career_FG-110-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2001-23-2001-pacific-private-stock-gold-portraits', 2001, '2001', '23', '2001 Pacific Private Stock Gold Portraits', NULL,
        'Pacific', 'pacific', '2001_Pacific-Private-Stock-Gold-Portraits_23-Fr.jpg', '2001_Pacific-Private-Stock-Gold-Portraits_23-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2001-14-2001-pacific-private-stock-mini-ps-206-action', 2001, '2001', '14', '2001 Pacific Private Stock Mini PS 206 Action', NULL,
        'Pacific', 'pacific', '2001_Pacific-Private-Stock-Mini-PS-206-Action_14-Fr.jpg', '2001_Pacific-Private-Stock-Mini-PS-206-Action_14-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2001-23-2001-pacific-private-stock-premiere-date', 2001, '2001', '23', '2001 Pacific Private Stock Premiere Date', NULL,
        'Pacific', 'pacific', '2001_Pacific-Private-Stock-Premiere-Date_23-Fr.jpg', '2001_Pacific-Private-Stock-Premiere-Date_23-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2001-23-2001-pacific-private-stock-silver-retail', 2001, '2001', '23', '2001 Pacific Private Stock Silver (Retail)', NULL,
        'Pacific', 'pacific', '2001_Pacific-Private-Stock-Silver-(Retail)_23-Fr.jpg', '2001_Pacific-Private-Stock-Silver-(Retail)_23-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2001-23-2001-pacific-private-stock-silver-portraits', 2001, '2001', '23', '2001 Pacific Private Stock Silver Portraits', NULL,
        'Pacific', 'pacific', '2001_Pacific-Private-Stock-Silver-Portraits_23-Fr.jpg', '2001_Pacific-Private-Stock-Silver-Portraits_23-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2001-od-43-2001-playoff-absolute-memorabilia-home-opener-souvenirs-double', 2001, '2001', 'OD-43', '2001 Playoff Absolute Memorabilia Home Opener Souvenirs Double', NULL,
        'Playoff', 'playoff', '2001_Playoff-Absolute-Memorabilia-Home-Opener-Souvenirs-Double_OD-43-Fr.jpg', '2001_Playoff-Absolute-Memorabilia-Home-Opener-Souvenirs-Double_OD-43-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2001-od-43-2001-playoff-absolute-memorabilia-home-opener-souvenirs', 2001, '2001', 'OD-43', '2001 Playoff Absolute Memorabilia Home Opener Souvenirs', NULL,
        'Playoff', 'playoff', '2001_Playoff-Absolute-Memorabilia-Home-Opener-Souvenirs_OD-43-Fr.jpg', '2001_Playoff-Absolute-Memorabilia-Home-Opener-Souvenirs_OD-43-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2001-mg-2001-sp-game-bat-edition-piece-of-the-game', 2001, '2001', 'MG', '2001 SP Game Bat Edition Piece of the Game', NULL,
        'SP', 'sp', '2001_SP-Game-Bat-Edition-Piece-of-the-Game_MG-Fr.jpg', '2001_SP-Game-Bat-Edition-Piece-of-the-Game_MG-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2001-mg-2001-sp-game-used-edition-authentic-fabric', 2001, '2001', 'MG', '2001 SP Game Used Edition Authentic Fabric', NULL,
        'SP', 'sp', '2001_SP-Game-Used-Edition-Authentic-Fabric_MG-Fr.jpg', '2001_SP-Game-Used-Edition-Authentic-Fabric_MG-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2001-gg-mg-2001-upper-deck-gold-glove-game-jersey', 2001, '2001', 'GG-MG', '2001 Upper Deck Gold Glove Game Jersey', NULL,
        'Upper Deck', 'upperdeck', '2001_Upper-Deck-Gold-Glove-Game-Jersey_GG-MG-Fr.jpg', '2001_Upper-Deck-Gold-Glove-Game-Jersey_GG-MG-Bk.jpg',
        0, 1, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2001-60-2001-upper-deck-gold-glove-gold-glove-finite', 2001, '2001', '60', '2001 Upper Deck Gold Glove Gold Glove Finite', NULL,
        'Upper Deck', 'upperdeck', '2001_Upper-Deck-Gold-Glove-Gold-Glove-Finite_60-Fr.jpg', '2001_Upper-Deck-Gold-Glove-Gold-Glove-Finite_60-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2001-60-2001-upper-deck-gold-glove-gold-glove-limited', 2001, '2001', '60', '2001 Upper Deck Gold Glove Gold Glove Limited', NULL,
        'Upper Deck', 'upperdeck', '2001_Upper-Deck-Gold-Glove-Gold-Glove-Limited_60-Fr.jpg', '2001_Upper-Deck-Gold-Glove-Gold-Glove-Limited_60-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2001-oi-gg-2001-upper-deck-gold-glove-official-issue-game-used-balls', 2001, '2001', 'OI-GG', '2001 Upper Deck Gold Glove Official Issue Game Used Balls', NULL,
        'Upper Deck', 'upperdeck', '2001_Upper-Deck-Gold-Glove-Official-Issue-Game-Used-Balls_OI-GG-Fr.jpg', '2001_Upper-Deck-Gold-Glove-Official-Issue-Game-Used-Balls_OI-GG-Bk.jpg',
        0, 1, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2001-200-2001-upper-deck-rookie-update-2001-sp-authentic-update', 2001, '2001', '200', '2001 Upper Deck Rookie Update 2001 SP Authentic Update', NULL,
        'Upper Deck', 'upperdeck', '2001_Upper-Deck-Rookie-Update-2001-SP-Authentic-Update_200-Fr.jpg', '2001_Upper-Deck-Rookie-Update-2001-SP-Authentic-Update_200-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2001-219-2001-upper-deck-vintage', 2001, '2001', '219', '2001 Upper Deck Vintage', NULL,
        'Upper Deck', 'upperdeck', '2001_Upper-Deck-Vintage_219-Fr.jpg', '2001_Upper-Deck-Vintage_219-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2002-079-2002-donruss-diamond-kings-beckett-samples-gold-front-silver-back', 2002, '2002', '079', '2002 Donruss Diamond Kings Beckett Samples Gold Front Silver Back', NULL,
        'Donruss', 'donruss', '2002_Donruss-Diamond-Kings-Beckett-Samples-Gold-Front-Silver-Back_079-Fr.jpg', '2002_Donruss-Diamond-Kings-Beckett-Samples-Gold-Front-Silver-Back_079-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2002-11-2002-fleer-e-x-hit-and-run', 2002, '2002', '11', '2002 Fleer E X Hit and Run', NULL,
        'Fleer', 'fleer', '2002_Fleer-E-X-Hit-and-Run_11-Fr.jpg', '2002_Fleer-E-X-Hit-and-Run_11-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2002-12-2002-fleer-focus-jersey-edition-century-parallel', 2002, '2002', '12', '2002 Fleer Focus Jersey Edition Century Parallel', NULL,
        'Fleer', 'fleer', '2002_Fleer-Focus-Jersey-Edition-Century-Parallel_12-Fr.jpg', '2002_Fleer-Focus-Jersey-Edition-Century-Parallel_12-Bk.jpg',
        0, 1, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2002-24-2002-fleer-platinum-cornerstones-numbered', 2002, '2002', '24', '2002 Fleer Platinum Cornerstones (Numbered)', NULL,
        'Fleer', 'fleer', '2002_Fleer-Platinum-Cornerstones-(Numbered)_24-Fr.jpg', '2002_Fleer-Platinum-Cornerstones-(Numbered)_24-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2002-40-2002-fleer-platinum-cornerstones-numbered', 2002, '2002', '40', '2002 Fleer Platinum Cornerstones (Numbered)', NULL,
        'Fleer', 'fleer', '2002_Fleer-Platinum-Cornerstones-(Numbered)_40-Fr.jpg', '2002_Fleer-Platinum-Cornerstones-(Numbered)_40-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2002-nno-2002-fleer-platinum-cornerstones-unnumbered', 2002, '2002', 'NNO', '2002 Fleer Platinum Cornerstones (Unnumbered)', NULL,
        'Fleer', 'fleer', '2002_Fleer-Platinum-Cornerstones-(Unnumbered)_NNO-Fr.jpg', '2002_Fleer-Platinum-Cornerstones-(Unnumbered)_NNO-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2002-42-2002-fleer-tradition-update-2002-fleer-tradition-glossy', 2002, '2002', '42', '2002 Fleer Tradition Update 2002 Fleer Tradition Glossy', NULL,
        'Fleer', 'fleer', '2002_Fleer-Tradition-Update-2002-Fleer-Tradition-Glossy_42-Fr.jpg', '2002_Fleer-Tradition-Update-2002-Fleer-Tradition-Glossy_42-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2002-57-2002-fleer-triple-crown-batting-average-parallel', 2002, '2002', '57', '2002 Fleer Triple Crown Batting Average Parallel', NULL,
        'Fleer', 'fleer', '2002_Fleer-Triple-Crown-Batting-Average-Parallel_57-Fr.jpg', '2002_Fleer-Triple-Crown-Batting-Average-Parallel_57-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2002-57-2002-fleer-triple-crown-rbi-parallel', 2002, '2002', '57', '2002 Fleer Triple Crown RBI Parallel', NULL,
        'Fleer', 'fleer', '2002_Fleer-Triple-Crown-RBI-Parallel_57-Fr.jpg', '2002_Fleer-Triple-Crown-RBI-Parallel_57-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2002-5-2002-leaf-beckett-samples-silver', 2002, '2002', '5', '2002 Leaf Beckett Samples Silver', NULL,
        'Leaf', 'leaf', '2002_Leaf-Beckett-Samples-Silver_5-Fr.jpg', '2002_Leaf-Beckett-Samples-Silver_5-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2002-63-2002-leaf-certified-beckett-samples-silver', 2002, '2002', '63', '2002 Leaf Certified Beckett Samples Silver', NULL,
        'Leaf', 'leaf', '2002_Leaf-Certified-Beckett-Samples-Silver_63-Fr.jpg', '2002_Leaf-Certified-Beckett-Samples-Silver_63-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2002-fg-2002-leaf-certified-fabric-of-the-game-jersey-number', 2002, '2002', 'FG', '2002 Leaf Certified Fabric of the Game Jersey Number', NULL,
        'Leaf', 'leaf', '2002_Leaf-Certified-Fabric-of-the-Game-Jersey-Number_FG-Fr.jpg', '2002_Leaf-Certified-Fabric-of-the-Game-Jersey-Number_FG-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2002-tq-2-2002-playoff-absolute-memorabilia-team-quads', 2002, '2002', 'TQ-2', '2002 Playoff Absolute Memorabilia Team Quads', NULL,
        'Playoff', 'playoff', '2002_Playoff-Absolute-Memorabilia-Team-Quads_TQ-2-Fr.jpg', '2002_Playoff-Absolute-Memorabilia-Team-Quads_TQ-2-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2002-tt-71-2002-playoff-absolute-memorabilia-tools-of-the-trade', 2002, '2002', 'TT-71', '2002 Playoff Absolute Memorabilia Tools of the Trade', NULL,
        'Playoff', 'playoff', '2002_Playoff-Absolute-Memorabilia-Tools-of-the-Trade_TT-71-Fr.jpg', '2002_Playoff-Absolute-Memorabilia-Tools-of-the-Trade_TT-71-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2002-pog-56-2002-playoff-piece-of-the-game-materials-bronze', 2002, '2002', 'POG-56', '2002 Playoff Piece of the Game Materials Bronze', NULL,
        'Playoff', 'playoff', '2002_Playoff-Piece-of-the-Game-Materials-Bronze_POG-56-Fr.jpg', '2002_Playoff-Piece-of-the-Game-Materials-Bronze_POG-56-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2002-pog-56-2002-playoff-piece-of-the-game-materials', 2002, '2002', 'POG-56', '2002 Playoff Piece of the Game Materials', NULL,
        'Playoff', 'playoff', '2002_Playoff-Piece-of-the-Game-Materials_POG-56-Fr.jpg', '2002_Playoff-Piece-of-the-Game-Materials_POG-56-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2002-tr-mg-2002-topps-206-framed-relics-series-2', 2002, '2002', 'TR-MG', '2002 Topps 206 Framed Relics (Series 2)', NULL,
        'Topps', 'topps', '2002_Topps-206-Framed-Relics-(Series-2)_TR-MG-Fr.jpg', '2002_Topps-206-Framed-Relics-(Series-2)_TR-MG-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2002-353-2002-topps', 2002, '2002', '353', '2002 Topps', NULL,
        'Topps', 'topps', '2002_Topps_353-Fr.jpg', '2002_Topps_353-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2002-f6-2002-ud-authentics-1989-flashbacks', 2002, '2002', 'F6', '2002 UD Authentics 1989 Flashbacks', NULL,
        NULL, NULL, '2002_UD-Authentics-1989-Flashbacks_F6-Fr.jpg', '2002_UD-Authentics-1989-Flashbacks_F6-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2002-sl-mg-2002-ud-authentics-stars-of-89-jerseys', 2002, '2002', 'SL-MG', '2002 UD Authentics Stars of ''89 Jerseys', NULL,
        NULL, NULL, '2002_UD-Authentics-Stars-of-''89-Jerseys_SL-MG-Fr.jpg', '2002_UD-Authentics-Stars-of-''89-Jerseys_SL-MG-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2002-13-2002-ultra-glove-works', 2002, '2002', '13', '2002 Ultra Glove Works', NULL,
        'Ultra', 'ultra', '2002_Ultra-Glove-Works_13-Fr.jpg', '2002_Ultra-Glove-Works_13-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2002-645-2002-upper-deck-40-man-electric-rainbow', 2002, '2002', '645', '2002 Upper Deck 40 Man Electric Rainbow', NULL,
        'Upper Deck', 'upperdeck', '2002_Upper-Deck-40-Man-Electric-Rainbow_645-Fr.jpg', '2002_Upper-Deck-40-Man-Electric-Rainbow_645-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2002-s-mg-2002-upper-deck-40-man-super-swatch-gold', 2002, '2002', 'S-MG', '2002 Upper Deck 40 Man Super Swatch Gold', NULL,
        'Upper Deck', 'upperdeck', '2002_Upper-Deck-40-Man-Super-Swatch-Gold_S-MG-Fr.jpg', '2002_Upper-Deck-40-Man-Super-Swatch-Gold_S-MG-Bk.jpg',
        0, 1, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2002-4-2002-upper-deck-pepsi-arizona-diamondbacks', 2002, '2002', '4', '2002 Upper Deck Pepsi Arizona Diamondbacks', NULL,
        'Upper Deck', 'upperdeck', '2002_Upper-Deck-Pepsi-Arizona-Diamondbacks_4-Fr.jpg', '2002_Upper-Deck-Pepsi-Arizona-Diamondbacks_4-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2002-h16-2002-upper-deck-piece-of-history-hitting-for-the-cycle', 2002, '2002', 'H16', '2002 Upper Deck Piece of History Hitting for the Cycle', NULL,
        'Upper Deck', 'upperdeck', '2002_Upper-Deck-Piece-of-History-Hitting-for-the-Cycle_H16-Fr.jpg', '2002_Upper-Deck-Piece-of-History-Hitting-for-the-Cycle_H16-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2002-s-mg-2002-upper-deck-vintage-special-collection-game-jersey', 2002, '2002', 'S-MG', '2002 Upper Deck Vintage Special Collection Game Jersey', NULL,
        'Upper Deck', 'upperdeck', '2002_Upper-Deck-Vintage-Special-Collection-Game-Jersey_S-MG-Fr.jpg', '2002_Upper-Deck-Vintage-Special-Collection-Game-Jersey_S-MG-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2003-dc-mg-2003-bowman-heritage-diamond-cuts-relics', 2003, '2003', 'DC-MG', '2003 Bowman Heritage Diamond Cuts Relics', NULL,
        'Bowman', 'bowman', '2003_Bowman-Heritage-Diamond-Cuts-Relics_DC-MG-Fr.jpg', '2003_Bowman-Heritage-Diamond-Cuts-Relics_DC-MG-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2003-tt-67-2003-donruss-elite-throwback-threads', 2003, '2003', 'TT-67', '2003 Donruss Elite Throwback Threads', NULL,
        'Donruss', 'donruss', '2003_Donruss-Elite-Throwback-Threads_TT-67-Fr.jpg', '2003_Donruss-Elite-Throwback-Threads_TT-67-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2003-tt-20-2003-donruss-signature-team-trademarks', 2003, '2003', 'TT-20', '2003 Donruss Signature Team Trademarks', NULL,
        'Donruss', 'donruss', '2003_Donruss-Signature-Team-Trademarks_TT-20-Fr.jpg', '2003_Donruss-Signature-Team-Trademarks_TT-20-Bk.jpg',
        1, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2003-99-2003-donruss-studio-beckett-samples-gold', 2003, '2003', '99', '2003 Donruss Studio Beckett Samples Gold', NULL,
        'Donruss', 'donruss', '2003_Donruss-Studio-Beckett-Samples-Gold_99-Fr.jpg', '2003_Donruss-Studio-Beckett-Samples-Gold_99-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2003-99-2003-donruss-studio-national-sports-collectors-convention-wrapper-redemption', 2003, '2003', '99', '2003 Donruss Studio National Sports Collectors Convention Wrapper Redemption', NULL,
        'Donruss', 'donruss', '2003_Donruss-Studio-National-Sports-Collectors-Convention-Wrapper-Redemption_99-Fr.jpg', '2003_Donruss-Studio-National-Sports-Collectors-Convention-Wrapper-Redemption_99-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2003-68-2003-fleer-focus-jersey-edition-century', 2003, '2003', '68', '2003 Fleer Focus Jersey Edition Century', NULL,
        'Fleer', 'fleer', '2003_Fleer-Focus-Jersey-Edition-Century_68-Fr.jpg', '2003_Fleer-Focus-Jersey-Edition-Century_68-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2003-95-2003-playoff-prestige-xtra-points-purple', 2003, '2003', '95', '2003 Playoff Prestige Xtra Points Purple', NULL,
        'Playoff', 'playoff', '2003_Playoff-Prestige-Xtra-Points-Purple_95-Fr.jpg', '2003_Playoff-Prestige-Xtra-Points-Purple_95-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2003-tr-mg-2003-topps-205-framed-relics-series-two', 2003, '2003', 'TR-MG', '2003 Topps 205 Framed Relics (Series Two)', NULL,
        'Topps', 'topps', '2003_Topps-205-Framed-Relics-(Series-Two)_TR-MG-Fr.jpg', '2003_Topps-205-Framed-Relics-(Series-Two)_TR-MG-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2003-pc-wg-2003-topps-pristine-corners-relics', 2003, '2003', 'PC-WG', '2003 Topps Pristine Corners Relics', NULL,
        'Topps', 'topps', '2003_Topps-Pristine-Corners-Relics_PC-WG-Fr.jpg', '2003_Topps-Pristine-Corners-Relics_PC-WG-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2003-491-2003-upper-deck-40-man-red-white-and-blue', 2003, '2003', '491', '2003 Upper Deck 40 Man Red White and Blue', NULL,
        'Upper Deck', 'upperdeck', NULL, '2003_Upper-Deck-40-Man-Red-White-and-Blue_491-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2003-4-2003-upper-deck-pepsi-arizona-diamondbacks', 2003, '2003', '4', '2003 Upper Deck Pepsi Arizona Diamondbacks', NULL,
        'Upper Deck', 'upperdeck', '2003_Upper-Deck-Pepsi-Arizona-Diamondbacks_4-Fr.jpg', '2003_Upper-Deck-Pepsi-Arizona-Diamondbacks_4-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-152-2004-donruss-diamond-kings-dk-combos-framed-silver', 2004, '2004', '152', '2004 Donruss Diamond Kings DK Combos Framed Silver', NULL,
        'Donruss', 'donruss', '2004_Donruss-Diamond-Kings-DK-Combos-Framed-Silver_152-Fr.jpg', '2004_Donruss-Diamond-Kings-DK-Combos-Framed-Silver_152-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-152-2004-donruss-diamond-kings-framed-bronze', 2004, '2004', '152', '2004 Donruss Diamond Kings Framed Bronze', NULL,
        'Donruss', 'donruss', '2004_Donruss-Diamond-Kings-Framed-Bronze_152-Fr.jpg', '2004_Donruss-Diamond-Kings-Framed-Bronze_152-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-hc-25-2004-donruss-diamond-kings-heritage-collection', 2004, '2004', 'HC-25', '2004 Donruss Diamond Kings Heritage Collection', NULL,
        'Donruss', 'donruss', '2004_Donruss-Diamond-Kings-Heritage-Collection_HC-25-Fr.jpg', '2004_Donruss-Diamond-Kings-Heritage-Collection_HC-25-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-tt-8-2004-donruss-diamond-kings-team-timeline', 2004, '2004', 'TT-8', '2004 Donruss Diamond Kings Team Timeline', NULL,
        'Donruss', 'donruss', '2004_Donruss-Diamond-Kings-Team-Timeline_TT-8-Fr.jpg', '2004_Donruss-Diamond-Kings-Team-Timeline_TT-8-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-rn-17-2004-donruss-elite-extra-edition-round-numbers', 2004, '2004', 'RN-17', '2004 Donruss Elite Extra Edition Round Numbers', NULL,
        'Donruss', 'donruss', '2004_Donruss-Elite-Extra-Edition-Round-Numbers_RN-17-Fr.jpg', '2004_Donruss-Elite-Extra-Edition-Round-Numbers_RN-17-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-et-5-2004-donruss-elite-team', 2004, '2004', 'ET-5', '2004 Donruss Elite Team', NULL,
        'Donruss', 'donruss', '2004_Donruss-Elite-Team_ET-5-Fr.jpg', '2004_Donruss-Elite-Team_ET-5-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-lel-27-2004-donruss-leather-lumber-leather-in-leather', 2004, '2004', 'LEL-27', '2004 Donruss Leather & Lumber Leather in Leather', NULL,
        'Donruss', 'donruss', '2004_Donruss-Leather-&-Lumber-Leather-in-Leather_LEL-27-Fr.jpg', '2004_Donruss-Leather-&-Lumber-Leather-in-Leather_LEL-27-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-pp-8-2004-donruss-leather-lumber-pennants-pinstripes', 2004, '2004', 'PP-8', '2004 Donruss Leather & Lumber Pennants Pinstripes', NULL,
        'Donruss', 'donruss', '2004_Donruss-Leather-&-Lumber-Pennants-Pinstripes_PP-8-Fr.jpg', '2004_Donruss-Leather-&-Lumber-Pennants-Pinstripes_PP-8-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-85-2004-donruss-team-heroes-showdown-bronze', 2004, '2004', '85', '2004 Donruss Team Heroes Showdown Bronze', NULL,
        'Donruss', 'donruss', '2004_Donruss-Team-Heroes-Showdown-Bronze_85-Fr.jpg', '2004_Donruss-Team-Heroes-Showdown-Bronze_85-Bk.jpg',
        0, 0, 1, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-s-9-2004-leaf-certified-cuts-stars', 2004, '2004', 'S-9', '2004 Leaf Certified Cuts Stars', NULL,
        'Leaf', 'leaf', '2004_Leaf-Certified-Cuts-Stars_S-9-Fr.jpg', '2004_Leaf-Certified-Cuts-Stars_S-9-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-227-2004-leaf-certified-cuts', 2004, '2004', '227', '2004 Leaf Certified Cuts', NULL,
        'Leaf', 'leaf', '2004_Leaf-Certified-Cuts_227-Fr.jpg', '2004_Leaf-Certified-Cuts_227-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-fg-178-2004-leaf-certified-materials-fabric-of-the-game-jersey-year', 2004, '2004', 'FG-178', '2004 Leaf Certified Materials Fabric of the Game Jersey Year', NULL,
        'Leaf', 'leaf', '2004_Leaf-Certified-Materials-Fabric-of-the-Game-Jersey-Year_FG-178-Fr.jpg', '2004_Leaf-Certified-Materials-Fabric-of-the-Game-Jersey-Year_FG-178-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-fg-178-2004-leaf-certified-materials-fabric-of-the-game-reward', 2004, '2004', 'FG-178', '2004 Leaf Certified Materials Fabric of the Game Reward', NULL,
        'Leaf', 'leaf', '2004_Leaf-Certified-Materials-Fabric-of-the-Game-Reward_FG-178-Fr.jpg', '2004_Leaf-Certified-Materials-Fabric-of-the-Game-Reward_FG-178-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-214-2004-leaf-limited', 2004, '2004', '214', '2004 Leaf Limited', NULL,
        'Leaf', 'leaf', '2004_Leaf-Limited_214-Fr.jpg', '2004_Leaf-Limited_214-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-103-2004-leaf-press-proofs-blue', 2004, '2004', '103', '2004 Leaf Press Proofs Blue', NULL,
        'Leaf', 'leaf', '2004_Leaf-Press-Proofs-Blue_103-Fr.jpg', '2004_Leaf-Press-Proofs-Blue_103-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-253-2004-leaf-press-proofs-blue', 2004, '2004', '253', '2004 Leaf Press Proofs Blue', NULL,
        'Leaf', 'leaf', '2004_Leaf-Press-Proofs-Blue_253-Fr.jpg', '2004_Leaf-Press-Proofs-Blue_253-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-103-2004-leaf-press-proofs-gold', 2004, '2004', '103', '2004 Leaf Press Proofs Gold', NULL,
        'Leaf', 'leaf', '2004_Leaf-Press-Proofs-Gold_103-Fr.jpg', '2004_Leaf-Press-Proofs-Gold_103-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-253-2004-leaf-press-proofs-gold', 2004, '2004', '253', '2004 Leaf Press Proofs Gold', NULL,
        'Leaf', 'leaf', '2004_Leaf-Press-Proofs-Gold_253-Fr.jpg', '2004_Leaf-Press-Proofs-Gold_253-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-103-2004-leaf-press-proofs-red', 2004, '2004', '103', '2004 Leaf Press Proofs Red', NULL,
        'Leaf', 'leaf', '2004_Leaf-Press-Proofs-Red_103-Fr.jpg', '2004_Leaf-Press-Proofs-Red_103-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-253-2004-leaf-press-proofs-red', 2004, '2004', '253', '2004 Leaf Press Proofs Red', NULL,
        'Leaf', 'leaf', '2004_Leaf-Press-Proofs-Red_253-Fr.jpg', '2004_Leaf-Press-Proofs-Red_253-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-253-2004-leaf-second-edition', 2004, '2004', '253', '2004 Leaf Second Edition', NULL,
        'Leaf', 'leaf', NULL, '2004_Leaf-Second-Edition_253-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-253-2004-leaf', 2004, '2004', '253', '2004 Leaf', NULL,
        'Leaf', 'leaf', '2004_Leaf_253-Fr.jpg', '2004_Leaf_253-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-017-2004-mlb-showdown', 2004, '2004', '017', '2004 MLB Showdown', NULL,
        NULL, NULL, '2004_MLB-Showdown_017-Fr.jpg', '2004_MLB-Showdown_017-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-ttr-14-2004-playoff-absolute-memorabilia-team-trio-material', 2004, '2004', 'TTR-14', '2004 Playoff Absolute Memorabilia Team Trio Material', NULL,
        'Playoff', 'playoff', '2004_Playoff-Absolute-Memorabilia-Team-Trio-Material_TTR-14-Fr.jpg', '2004_Playoff-Absolute-Memorabilia-Team-Trio-Material_TTR-14-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-tt-88-2004-playoff-absolute-memorabilia-tools-of-the-trade-blue', 2004, '2004', 'TT-88', '2004 Playoff Absolute Memorabilia Tools of the Trade Blue', NULL,
        'Playoff', 'playoff', NULL, '2004_Playoff-Absolute-Memorabilia-Tools-of-the-Trade-Blue_TT-88-Bk.jpg',
        0, 1, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-tt-88-2004-playoff-absolute-memorabilia-tools-of-the-trade-material-combo', 2004, '2004', 'TT-88', '2004 Playoff Absolute Memorabilia Tools of the Trade Material Combo', NULL,
        'Playoff', 'playoff', '2004_Playoff-Absolute-Memorabilia-Tools-of-the-Trade-Material-Combo_TT-88-Fr.jpg', '2004_Playoff-Absolute-Memorabilia-Tools-of-the-Trade-Material-Combo_TT-88-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-tt-88-2004-playoff-absolute-memorabilia-tools-of-the-trade-material-signature-single', 2004, '2004', 'TT-88', '2004 Playoff Absolute Memorabilia Tools of the Trade Material Signature Single', NULL,
        'Playoff', 'playoff', '2004_Playoff-Absolute-Memorabilia-Tools-of-the-Trade-Material-Signature-Single_TT-88-Fr.jpg', '2004_Playoff-Absolute-Memorabilia-Tools-of-the-Trade-Material-Signature-Single_TT-88-Bk.jpg',
        1, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-ps-39-2004-playoff-honors-prime-signatures', 2004, '2004', 'PS-39', '2004 Playoff Honors Prime Signatures', NULL,
        'Playoff', 'playoff', '2004_Playoff-Honors-Prime-Signatures_PS-39-Fr.jpg', '2004_Playoff-Honors-Prime-Signatures_PS-39-Bk.jpg',
        1, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-q-1-2004-playoff-honors-quad-material', 2004, '2004', 'Q-1', '2004 Playoff Honors Quad Material', NULL,
        'Playoff', 'playoff', '2004_Playoff-Honors-Quad-Material_Q-1-Fr.jpg', '2004_Playoff-Honors-Quad-Material_Q-1-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-32-2004-playoff-prime-cuts', 2004, '2004', '32', '2004 Playoff Prime Cuts', NULL,
        'Playoff', 'playoff', '2004_Playoff-Prime-Cuts_32-Fr.jpg', '2004_Playoff-Prime-Cuts_32-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-76-2004-sp-legendary-cuts', 2004, '2004', '76', '2004 SP Legendary Cuts', NULL,
        'SP', 'sp', '2004_SP-Legendary-Cuts_76-Fr.jpg', '2004_SP-Legendary-Cuts_76-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-djs-mw-2004-upper-deck-ultimate-collection-dual-materials-signature', 2004, '2004', 'DJS-MW', '2004 Upper Deck Ultimate Collection Dual Materials Signature', NULL,
        'Upper Deck', 'upperdeck', '2004_Upper-Deck-Ultimate-Collection-Dual-Materials-Signature_DJS-MW-Fr.jpg', '2004_Upper-Deck-Ultimate-Collection-Dual-Materials-Signature_DJS-MW-Bk.jpg',
        1, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2004-ds-gc-2004-upper-deck-ultimate-collection-signatures-dual', 2004, '2004', 'DS-GC', '2004 Upper Deck Ultimate Collection Signatures Dual', NULL,
        'Upper Deck', 'upperdeck', '2004_Upper-Deck-Ultimate-Collection-Signatures-Dual_DS-GC-Fr.jpg', '2004_Upper-Deck-Ultimate-Collection-Signatures-Dual_DS-GC-Bk.jpg',
        1, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-336-2005-donruss-champions-impressions', 2005, '2005', '336', '2005 Donruss Champions Impressions', NULL,
        'Donruss', 'donruss', '2005_Donruss-Champions-Impressions_336-Fr.jpg', '2005_Donruss-Champions-Impressions_336-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-bos-18-2005-donruss-classics-stars-of-summer', 2005, '2005', 'BOS-18', '2005 Donruss Classics Stars of Summer', NULL,
        'Donruss', 'donruss', '2005_Donruss-Classics-Stars-of-Summer_BOS-18-Fr.jpg', NULL,
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-427-2005-donruss-diamond-kings-framed-blue', 2005, '2005', '427', '2005 Donruss Diamond Kings Framed Blue', NULL,
        'Donruss', 'donruss', '2005_Donruss-Diamond-Kings-Framed-Blue_427-Fr.jpg', '2005_Donruss-Diamond-Kings-Framed-Blue_427-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-427-2005-donruss-diamond-kings-framed-red', 2005, '2005', '427', '2005 Donruss Diamond Kings Framed Red', NULL,
        'Donruss', 'donruss', '2005_Donruss-Diamond-Kings-Framed-Red_427-Fr.jpg', '2005_Donruss-Diamond-Kings-Framed-Red_427-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-427-2005-donruss-diamond-kings-materials-framed-red', 2005, '2005', '427', '2005 Donruss Diamond Kings Materials Framed Red', NULL,
        'Donruss', 'donruss', '2005_Donruss-Diamond-Kings-Materials-Framed-Red_427-Fr.jpg', '2005_Donruss-Diamond-Kings-Materials-Framed-Red_427-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-gg-4-2005-donruss-leather-lumber-great-gloves', 2005, '2005', 'GG-4', '2005 Donruss Leather & Lumber Great Gloves', NULL,
        'Donruss', 'donruss', '2005_Donruss-Leather-&-Lumber-Great-Gloves_GG-4-Fr.jpg', '2005_Donruss-Leather-&-Lumber-Great-Gloves_GG-4-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-ll-15-2005-donruss-leather-lumber-lumber-leather', 2005, '2005', 'LL-15', '2005 Donruss Leather & Lumber Lumber & Leather', NULL,
        'Donruss', 'donruss', '2005_Donruss-Leather-&-Lumber-Lumber-&-Leather_LL-15-Fr.jpg', '2005_Donruss-Leather-&-Lumber-Lumber-&-Leather_LL-15-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-30-2005-donruss-signature-autograph-material-jersey-silver', 2005, '2005', '30', '2005 Donruss Signature Autograph Material Jersey Silver', NULL,
        'Donruss', 'donruss', '2005_Donruss-Signature-Autograph-Material-Jersey-Silver_30-Fr.jpg', '2005_Donruss-Signature-Autograph-Material-Jersey-Silver_30-Bk.jpg',
        1, 1, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-30-2005-donruss-signature-autograph-silver', 2005, '2005', '30', '2005 Donruss Signature Autograph Silver', NULL,
        'Donruss', 'donruss', '2005_Donruss-Signature-Autograph-Silver_30-Fr.jpg', '2005_Donruss-Signature-Autograph-Silver_30-Bk.jpg',
        1, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-30-2005-donruss-signature-century-proofs-silver', 2005, '2005', '30', '2005 Donruss Signature Century Proofs Silver', NULL,
        'Donruss', 'donruss', '2005_Donruss-Signature-Century-Proofs-Silver_30-Fr.jpg', '2005_Donruss-Signature-Century-Proofs-Silver_30-Bk.jpg',
        1, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-ss-6-2005-donruss-signature-stars-autograph-material-bat', 2005, '2005', 'SS-6', '2005 Donruss Signature Stars Autograph Material Bat', NULL,
        'Donruss', 'donruss', '2005_Donruss-Signature-Stars-Autograph-Material-Bat_SS-6-Fr.jpg', '2005_Donruss-Signature-Stars-Autograph-Material-Bat_SS-6-Bk.jpg',
        1, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-sp-40-2005-donruss-studio-portraits-diamond-kings-red', 2005, '2005', 'SP-40', '2005 Donruss Studio Portraits Diamond Kings Red', NULL,
        'Donruss', 'donruss', '2005_Donruss-Studio-Portraits-Diamond-Kings-Red_SP-40-Fr.jpg', '2005_Donruss-Studio-Portraits-Diamond-Kings-Red_SP-40-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-g-8-2005-donruss-throwback-threads-generations', 2005, '2005', 'G-8', '2005 Donruss Throwback Threads Generations', NULL,
        'Donruss', 'donruss', '2005_Donruss-Throwback-Threads-Generations_G-8-Fr.jpg', '2005_Donruss-Throwback-Threads-Generations_G-8-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-tc-17-2005-donruss-throwback-threads-throwback-collection-material', 2005, '2005', 'TC-17', '2005 Donruss Throwback Threads Throwback Collection Material', NULL,
        'Donruss', 'donruss', '2005_Donruss-Throwback-Threads-Throwback-Collection-Material_TC-17-Fr.jpg', '2005_Donruss-Throwback-Threads-Throwback-Collection-Material_TC-17-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-tc-17-2005-donruss-throwback-threads-throwback-collection', 2005, '2005', 'TC-17', '2005 Donruss Throwback Threads Throwback Collection', NULL,
        'Donruss', 'donruss', '2005_Donruss-Throwback-Threads-Throwback-Collection_TC-17-Fr.jpg', '2005_Donruss-Throwback-Threads-Throwback-Collection_TC-17-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-243-2005-donruss-zenith-artist-s-proofs-silver', 2005, '2005', '243', '2005 Donruss Zenith Artist''s Proofs Silver', NULL,
        'Donruss', 'donruss', '2005_Donruss-Zenith-Artist''s-Proofs-Silver_243-Fr.jpg', '2005_Donruss-Zenith-Artist''s-Proofs-Silver_243-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-243-2005-donruss-zenith-museum-collection', 2005, '2005', '243', '2005 Donruss Zenith Museum Collection', NULL,
        'Donruss', 'donruss', '2005_Donruss-Zenith-Museum-Collection_243-Fr.jpg', '2005_Donruss-Zenith-Museum-Collection_243-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-243-2005-donruss-zenith', 2005, '2005', '243', '2005 Donruss Zenith', NULL,
        'Donruss', 'donruss', '2005_Donruss-Zenith_243-Fr.jpg', '2005_Donruss-Zenith_243-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-3-2005-hero-decks-chicago-cubs-baseball-heroes-playing-cards', 2005, '2005', '3♠', '2005 Hero Decks Chicago Cubs Baseball Heroes Playing Cards', NULL,
        NULL, NULL, '2005_Hero-Decks-Chicago-Cubs-Baseball-Heroes-Playing-Cards_3♠-Fr.jpg', '2005_Hero-Decks-Chicago-Cubs-Baseball-Heroes-Playing-Cards_3♠-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-cuc-2005-leaf-clean-up-crew', 2005, '2005', 'CUC', '2005 Leaf Clean Up Crew', NULL,
        'Leaf', 'leaf', '2005_Leaf-Clean-Up-Crew_CUC-Fr.jpg', '2005_Leaf-Clean-Up-Crew_CUC-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-ah-17-2005-playoff-absolute-memorabilia-heroes-reverse-spectrum', 2005, '2005', 'AH-17', '2005 Playoff Absolute Memorabilia Heroes Reverse Spectrum', NULL,
        'Playoff', 'playoff', '2005_Playoff-Absolute-Memorabilia-Heroes-Reverse-Spectrum_AH-17-Fr.jpg', '2005_Playoff-Absolute-Memorabilia-Heroes-Reverse-Spectrum_AH-17-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-ah-17-2005-playoff-absolute-memorabilia-heroes-swatch-double', 2005, '2005', 'AH-17', '2005 Playoff Absolute Memorabilia Heroes Swatch Double', NULL,
        'Playoff', 'playoff', '2005_Playoff-Absolute-Memorabilia-Heroes-Swatch-Double_AH-17-Fr.jpg', '2005_Playoff-Absolute-Memorabilia-Heroes-Swatch-Double_AH-17-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-ah-60-2005-playoff-absolute-memorabilia-heroes-swatch-double', 2005, '2005', 'AH-60', '2005 Playoff Absolute Memorabilia Heroes Swatch Double', NULL,
        'Playoff', 'playoff', '2005_Playoff-Absolute-Memorabilia-Heroes-Swatch-Double_AH-60-Fr.jpg', '2005_Playoff-Absolute-Memorabilia-Heroes-Swatch-Double_AH-60-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-ah-60-2005-playoff-absolute-memorabilia-heroes', 2005, '2005', 'AH-60', '2005 Playoff Absolute Memorabilia Heroes', NULL,
        'Playoff', 'playoff', NULL, '2005_Playoff-Absolute-Memorabilia-Heroes_AH-60-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-tq-19-2005-playoff-absolute-memorabilia-team-quads-swatch-single-spectrum', 2005, '2005', 'TQ-19', '2005 Playoff Absolute Memorabilia Team Quads Swatch Single Spectrum', NULL,
        'Playoff', 'playoff', '2005_Playoff-Absolute-Memorabilia-Team-Quads-Swatch-Single-Spectrum_TQ-19-Fr.jpg', '2005_Playoff-Absolute-Memorabilia-Team-Quads-Swatch-Single-Spectrum_TQ-19-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-tt-15-2005-playoff-absolute-memorabilia-team-trios-spectrum', 2005, '2005', 'TT-15', '2005 Playoff Absolute Memorabilia Team Trios Spectrum', NULL,
        'Playoff', 'playoff', '2005_Playoff-Absolute-Memorabilia-Team-Trios-Spectrum_TT-15-Fr.jpg', '2005_Playoff-Absolute-Memorabilia-Team-Trios-Spectrum_TT-15-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-tt-15-2005-playoff-absolute-memorabilia-team-trios-swatch-double-spectrum', 2005, '2005', 'TT-15', '2005 Playoff Absolute Memorabilia Team Trios Swatch Double Spectrum', NULL,
        'Playoff', 'playoff', NULL, '2005_Playoff-Absolute-Memorabilia-Team-Trios-Swatch-Double-Spectrum_TT-15-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-tt-15-2005-playoff-absolute-memorabilia-team-trios-swatch-double', 2005, '2005', 'TT-15', '2005 Playoff Absolute Memorabilia Team Trios Swatch Double', NULL,
        'Playoff', 'playoff', '2005_Playoff-Absolute-Memorabilia-Team-Trios-Swatch-Double_TT-15-Fr.jpg', '2005_Playoff-Absolute-Memorabilia-Team-Trios-Swatch-Double_TT-15-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-tt-15-2005-playoff-absolute-memorabilia-team-trios-swatch-single-spectrum', 2005, '2005', 'TT-15', '2005 Playoff Absolute Memorabilia Team Trios Swatch Single Spectrum', NULL,
        'Playoff', 'playoff', '2005_Playoff-Absolute-Memorabilia-Team-Trios-Swatch-Single-Spectrum_TT-15-Fr.jpg', '2005_Playoff-Absolute-Memorabilia-Team-Trios-Swatch-Single-Spectrum_TT-15-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-tt-15-2005-playoff-absolute-memorabilia-team-trios-swatch-single', 2005, '2005', 'TT-15', '2005 Playoff Absolute Memorabilia Team Trios Swatch Single', NULL,
        'Playoff', 'playoff', '2005_Playoff-Absolute-Memorabilia-Team-Trios-Swatch-Single_TT-15-Fr.jpg', '2005_Playoff-Absolute-Memorabilia-Team-Trios-Swatch-Single_TT-15-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-tt-15-2005-playoff-absolute-memorabilia-team-trios', 2005, '2005', 'TT-15', '2005 Playoff Absolute Memorabilia Team Trios', NULL,
        'Playoff', 'playoff', '2005_Playoff-Absolute-Memorabilia-Team-Trios_TT-15-Fr.jpg', '2005_Playoff-Absolute-Memorabilia-Team-Trios_TT-15-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-tt-83-2005-playoff-absolute-memorabilia-tools-of-the-trade-reverse-spectrum-red', 2005, '2005', 'TT-83', '2005 Playoff Absolute Memorabilia Tools of the Trade Reverse Spectrum Red', NULL,
        'Playoff', 'playoff', '2005_Playoff-Absolute-Memorabilia-Tools-of-the-Trade-Reverse-Spectrum-Red_TT-83-Fr.jpg', '2005_Playoff-Absolute-Memorabilia-Tools-of-the-Trade-Reverse-Spectrum-Red_TT-83-Bk.jpg',
        0, 1, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-tt-83-2005-playoff-absolute-memorabilia-tools-of-the-trade-swatch-double-prime-red', 2005, '2005', 'TT-83', '2005 Playoff Absolute Memorabilia Tools of the Trade Swatch Double Prime Red', NULL,
        'Playoff', 'playoff', '2005_Playoff-Absolute-Memorabilia-Tools-of-the-Trade-Swatch-Double-Prime-Red_TT-83-Fr.jpg', '2005_Playoff-Absolute-Memorabilia-Tools-of-the-Trade-Swatch-Double-Prime-Red_TT-83-Bk.jpg',
        0, 1, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-tt-83-2005-playoff-absolute-memorabilia-tools-of-the-trade-swatch-single-jumbo', 2005, '2005', 'TT-83', '2005 Playoff Absolute Memorabilia Tools of the Trade Swatch Single Jumbo', NULL,
        'Playoff', 'playoff', '2005_Playoff-Absolute-Memorabilia-Tools-of-the-Trade-Swatch-Single-Jumbo_TT-83-Fr.jpg', '2005_Playoff-Absolute-Memorabilia-Tools-of-the-Trade-Swatch-Single-Jumbo_TT-83-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-63-2005-sp-collection-2005-sp-authentic', 2005, '2005', '63', '2005 SP Collection 2005 SP Authentic', NULL,
        'SP', 'sp', '2005_SP-Collection-2005-SP-Authentic_63-Fr.jpg', '2005_SP-Collection-2005-SP-Authentic_63-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-63-2005-sp-collection-sp-authentic-materials-parallel', 2005, '2005', '63', '2005 SP Collection SP Authentic Materials Parallel', NULL,
        'SP', 'sp', '2005_SP-Collection-SP-Authentic-Materials-Parallel_63-Fr.jpg', '2005_SP-Collection-SP-Authentic-Materials-Parallel_63-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-cc-mg-2005-sp-legendary-cuts-classic-careers-material-gold', 2005, '2005', 'CC-MG', '2005 SP Legendary Cuts Classic Careers Material Gold', NULL,
        'SP', 'sp', '2005_SP-Legendary-Cuts-Classic-Careers-Material-Gold_CC-MG-Fr.jpg', '2005_SP-Legendary-Cuts-Classic-Careers-Material-Gold_CC-MG-Bk.jpg',
        0, 1, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-cc-mg-2005-sp-legendary-cuts-classic-careers-material', 2005, '2005', 'CC-MG', '2005 SP Legendary Cuts Classic Careers Material', NULL,
        'SP', 'sp', '2005_SP-Legendary-Cuts-Classic-Careers-Material_CC-MG-Fr.jpg', '2005_SP-Legendary-Cuts-Classic-Careers-Material_CC-MG-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-le-mg-2005-sp-legendary-cuts-legendary-lineage-material', 2005, '2005', 'LE-MG', '2005 SP Legendary Cuts Legendary Lineage Material', NULL,
        'SP', 'sp', '2005_SP-Legendary-Cuts-Legendary-Lineage-Material_LE-MG-Fr.jpg', '2005_SP-Legendary-Cuts-Legendary-Lineage-Material_LE-MG-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-4-2005-topps-all-time-fan-favorites', 2005, '2005', '4', '2005 Topps All Time Fan Favorites', NULL,
        'Topps', 'topps', '2005_Topps-All-Time-Fan-Favorites_4-Fr.jpg', '2005_Topps-All-Time-Fan-Favorites_4-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-rc-mg-2005-topps-rookie-cup-autographs', 2005, '2005', 'RC-MG', '2005 Topps Rookie Cup Autographs', NULL,
        'Topps', 'topps', '2005_Topps-Rookie-Cup-Autographs_RC-MG-Fr.jpg', '2005_Topps-Rookie-Cup-Autographs_RC-MG-Bk.jpg',
        1, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-drc-pg-2005-topps-rookie-cup-dual-autographs', 2005, '2005', 'DRC-PG', '2005 Topps Rookie Cup Dual Autographs', NULL,
        'Topps', 'topps', '2005_Topps-Rookie-Cup-Dual-Autographs_DRC-PG-Fr.jpg', '2005_Topps-Rookie-Cup-Dual-Autographs_DRC-PG-Bk.jpg',
        1, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-64-2005-topps-rookie-cup-green', 2005, '2005', '64', '2005 Topps Rookie Cup Green', NULL,
        'Topps', 'topps', '2005_Topps-Rookie-Cup-Green_64-Fr.jpg', '2005_Topps-Rookie-Cup-Green_64-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-64-2005-topps-rookie-cup-red', 2005, '2005', '64', '2005 Topps Rookie Cup Red', NULL,
        'Topps', 'topps', '2005_Topps-Rookie-Cup-Red_64-Fr.jpg', '2005_Topps-Rookie-Cup-Red_64-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-64-2005-topps-rookie-cup-reprints', 2005, '2005', '64', '2005 Topps Rookie Cup Reprints', NULL,
        'Topps', 'topps', '2005_Topps-Rookie-Cup-Reprints_64-Fr.jpg', '2005_Topps-Rookie-Cup-Reprints_64-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-64-2005-topps-rookie-cup', 2005, '2005', '64', '2005 Topps Rookie Cup', NULL,
        'Topps', 'topps', '2005_Topps-Rookie-Cup_64-Fr.jpg', '2005_Topps-Rookie-Cup_64-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2005-nl-mk-2005-upper-deck-artifacts-al-nl-artifacts-rainbow', 2005, '2005', 'NL-MK', '2005 Upper Deck Artifacts AL NL Artifacts Rainbow', NULL,
        'Upper Deck', 'upperdeck', '2005_Upper-Deck-Artifacts-AL-NL-Artifacts-Rainbow_NL-MK-Fr.jpg', '2005_Upper-Deck-Artifacts-AL-NL-Artifacts-Rainbow_NL-MK-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2006-chc-mg-2006-fleer-greats-of-the-game-cubs-greats', 2006, '2006', 'CHC-MG', '2006 Fleer Greats of the Game Cubs Greats', NULL,
        'Fleer', 'fleer', '2006_Fleer-Greats-of-the-Game-Cubs-Greats_CHC-MG-Fr.jpg', '2006_Fleer-Greats-of-the-Game-Cubs-Greats_CHC-MG-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2007-cm-mg-2007-upper-deck-sweet-spot-classic-classic-memorabilia', 2007, '2007', 'CM-MG', '2007 Upper Deck Sweet Spot Classic Classic Memorabilia', NULL,
        'Upper Deck', 'upperdeck', '2007_Upper-Deck-Sweet-Spot-Classic-Classic-Memorabilia_CM-MG-Fr.jpg', '2007_Upper-Deck-Sweet-Spot-Classic-Classic-Memorabilia_CM-MG-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2007-17-2007-upper-deck-sweet-spot-classic', 2007, '2007', '17', '2007 Upper Deck Sweet Spot Classic', NULL,
        'Upper Deck', 'upperdeck', '2007_Upper-Deck-Sweet-Spot-Classic_17-Fr.jpg', '2007_Upper-Deck-Sweet-Spot-Classic_17-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2009-gm-lg-2009-sp-legendary-cuts-generations-dual-memorabilia', 2009, '2009', 'GM-LG', '2009 SP Legendary Cuts Generations Dual Memorabilia', NULL,
        'SP', 'sp', '2009_SP-Legendary-Cuts-Generations-Dual-Memorabilia_GM-LG-Fr.jpg', '2009_SP-Legendary-Cuts-Generations-Dual-Memorabilia_GM-LG-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2014-8-2014-panini-elite-extra-edition-historic-picks', 2014, '2014', '8', '2014 Panini Elite Extra Edition Historic Picks', NULL,
        'Panini', 'panini', '2014_Panini-Elite-Extra-Edition-Historic-Picks_8-Fr.jpg', '2014_Panini-Elite-Extra-Edition-Historic-Picks_8-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2015-ffa-mgr-2015-topps-archives-fan-favorites-autographs', 2015, '2015', 'FFA-MGR', '2015 Topps Archives Fan Favorites Autographs', NULL,
        'Topps', 'topps', '2015_Topps-Archives-Fan-Favorites-Autographs_FFA-MGR-Fr.jpg', '2015_Topps-Archives-Fan-Favorites-Autographs_FFA-MGR-Bk.jpg',
        1, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2015-fsa-mg-2015-topps-five-star-rainbow', 2015, '2015', 'FSA-MG', '2015 Topps Five Star Rainbow', NULL,
        'Topps', 'topps', '2015_Topps-Five-Star-Rainbow_FSA-MG-Fr.jpg', '2015_Topps-Five-Star-Rainbow_FSA-MG-Bk.jpg',
        0, 0, 1, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2015-ht-mge-2015-topps-high-tek-autographs-gold-rainbow', 2015, '2015', 'HT-MGE', '2015 Topps High Tek Autographs Gold Rainbow', NULL,
        'Topps', 'topps', '2015_Topps-High-Tek-Autographs-Gold-Rainbow_HT-MGE-Fr.jpg', '2015_Topps-High-Tek-Autographs-Gold-Rainbow_HT-MGE-Bk.jpg',
        1, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2015-ht-mge-2015-topps-high-tek-pattern-1a-grass-purple-rainbow', 2015, '2015', 'HT-MGE', '2015 Topps High Tek Pattern 1A Grass Purple Rainbow', NULL,
        'Topps', 'topps', '2015_Topps-High-Tek-Pattern-1A-Grass-Purple-Rainbow_HT-MGE-Fr.jpg', '2015_Topps-High-Tek-Pattern-1A-Grass-Purple-Rainbow_HT-MGE-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2015-ht-mge-2015-topps-high-tek-pattern-2a-spiral', 2015, '2015', 'HT-MGE', '2015 Topps High Tek Pattern 2A Spiral', NULL,
        'Topps', 'topps', '2015_Topps-High-Tek-Pattern-2A-Spiral_HT-MGE-Fr.jpg', '2015_Topps-High-Tek-Pattern-2A-Spiral_HT-MGE-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2015-ht-mge-2015-topps-high-tek-pattern-3a-circuit-board', 2015, '2015', 'HT-MGE', '2015 Topps High Tek Pattern 3A Circuit Board', NULL,
        'Topps', 'topps', '2015_Topps-High-Tek-Pattern-3A-Circuit-Board_HT-MGE-Fr.jpg', '2015_Topps-High-Tek-Pattern-3A-Circuit-Board_HT-MGE-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2015-ht-mge-2015-topps-high-tek-pattern-4a-cubes', 2015, '2015', 'HT-MGE', '2015 Topps High Tek Pattern 4A Cubes', NULL,
        'Topps', 'topps', '2015_Topps-High-Tek-Pattern-4A-Cubes_HT-MGE-Fr.jpg', '2015_Topps-High-Tek-Pattern-4A-Cubes_HT-MGE-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2015-ht-mge-2015-topps-high-tek-pattern-6a-stripes', 2015, '2015', 'HT-MGE', '2015 Topps High Tek Pattern 6A Stripes', NULL,
        'Topps', 'topps', '2015_Topps-High-Tek-Pattern-6A-Stripes_HT-MGE-Fr.jpg', '2015_Topps-High-Tek-Pattern-6A-Stripes_HT-MGE-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2015-ht-mge-2015-topps-high-tek', 2015, '2015', 'HT-MGE', '2015 Topps High Tek', NULL,
        'Topps', 'topps', '2015_Topps-High-Tek_HT-MGE-Fr.jpg', '2015_Topps-High-Tek_HT-MGE-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2015-sa-mg-2015-topps-strata-autographs', 2015, '2015', 'SA-MG', '2015 Topps Strata Autographs', NULL,
        'Topps', 'topps', '2015_Topps-Strata-Autographs_SA-MG-Fr.jpg', '2015_Topps-Strata-Autographs_SA-MG-Bk.jpg',
        1, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2015-dar-mg-2015-topps-tier-one-autographed-relics-dual-patch', 2015, '2015', 'DAR-MG', '2015 Topps Tier One Autographed Relics Dual Patch', NULL,
        'Topps', 'topps', '2015_Topps-Tier-One-Autographed-Relics-Dual-Patch_DAR-MG-Fr.jpg', '2015_Topps-Tier-One-Autographed-Relics-Dual-Patch_DAR-MG-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2016-btfmg-2016-donruss-optic-back-to-the-future-signatures', 2016, '2016', 'BTFMG', '2016 Donruss Optic Back to the Future Signatures', NULL,
        'Donruss', 'donruss', '2016_Donruss-Optic-Back-to-the-Future-Signatures_BTFMG-Fr.jpg', '2016_Donruss-Optic-Back-to-the-Future-Signatures_BTFMG-Bk.jpg',
        1, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2016-ps-mg1-2016-panini-pantheon-pantheon-scripts', 2016, '2016', 'PS-MG1', '2016 Panini Pantheon Pantheon Scripts', NULL,
        'Panini', 'panini', '2016_Panini-Pantheon-Pantheon-Scripts_PS-MG1-Fr.jpg', '2016_Panini-Pantheon-Pantheon-Scripts_PS-MG1-Bk.jpg',
        1, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2016-wrig-26-2016-topps-100-years-at-wrigley-field', 2016, '2016', 'WRIG-26', '2016 Topps 100 Years at Wrigley Field', NULL,
        'Topps', 'topps', NULL, '2016_Topps-100-Years-at-Wrigley-Field_WRIG-26-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2016-wrig-4-2016-topps-100-years-at-wrigley-field', 2016, '2016', 'WRIG-4', '2016 Topps 100 Years at Wrigley Field', NULL,
        'Topps', 'topps', '2016_Topps-100-Years-at-Wrigley-Field_WRIG-4-Fr.jpg', '2016_Topps-100-Years-at-Wrigley-Field_WRIG-4-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2016-tra-mg-2016-topps-legacies-of-baseball-tradition-autographs-green', 2016, '2016', 'TRA-MG', '2016 Topps Legacies of Baseball Tradition Autographs Green', NULL,
        'Topps', 'topps', '2016_Topps-Legacies-of-Baseball-Tradition-Autographs-Green_TRA-MG-Fr.jpg', '2016_Topps-Legacies-of-Baseball-Tradition-Autographs-Green_TRA-MG-Bk.jpg',
        1, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2016-tra-mg-2016-topps-legacies-of-baseball-tradition-autographs', 2016, '2016', 'TRA-MG', '2016 Topps Legacies of Baseball Tradition Autographs', NULL,
        'Topps', 'topps', '2016_Topps-Legacies-of-Baseball-Tradition-Autographs_TRA-MG-Fr.jpg', '2016_Topps-Legacies-of-Baseball-Tradition-Autographs_TRA-MG-Bk.jpg',
        1, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2017-237-2017-bowman-bowman-buybacks-1997-bowman-stamped-gold', 2017, '2017', '237', '2017 Bowman Bowman Buybacks 1997 Bowman Stamped Gold', NULL,
        'Bowman', 'bowman', '2017_Bowman-Bowman-Buybacks-1997-Bowman-Stamped-Gold_237-Fr.jpg', '2017_Bowman-Bowman-Buybacks-1997-Bowman-Stamped-Gold_237-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2017-bnr-mg-2017-bowman-chrome-national-sports-collectors-convention-wrapper-redemption', 2017, '2017', 'BNR-MG', '2017 Bowman Chrome National Sports Collectors Convention Wrapper Redemption', NULL,
        'Bowman', 'bowman', '2017_Bowman-Chrome-National-Sports-Collectors-Convention-Wrapper-Redemption_BNR-MG-Fr.jpg', '2017_Bowman-Chrome-National-Sports-Collectors-Convention-Wrapper-Redemption_BNR-MG-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2017-ll-mg-2017-panini-diamond-kings-limited-lithos-dual-relic-autograph', 2017, '2017', 'LL-MG', '2017 Panini Diamond Kings Limited Lithos Dual Relic Autograph', NULL,
        'Panini', 'panini', '2017_Panini-Diamond-Kings-Limited-Lithos-Dual-Relic-Autograph_LL-MG-Fr.jpg', '2017_Panini-Diamond-Kings-Limited-Lithos-Dual-Relic-Autograph_LL-MG-Bk.jpg',
        1, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2017-465-2017-topps-rediscover-topps-1989-topps-stamped-buybacks-gold', 2017, '2017', '465', '2017 Topps Rediscover Topps 1989 Topps Stamped Buybacks Gold', NULL,
        'Topps', 'topps', '2017_Topps-Rediscover-Topps-1989-Topps-Stamped-Buybacks-Gold_465-Fr.jpg', '2017_Topps-Rediscover-Topps-1989-Topps-Stamped-Buybacks-Gold_465-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2018-19-2018-choice-iowa-cubs-50-seasons-legends', 2018, '2018', '19', '2018 Choice Iowa Cubs 50 Seasons Legends', NULL,
        NULL, NULL, '2018_Choice-Iowa-Cubs-50-Seasons-Legends_19-Fr.jpg', '2018_Choice-Iowa-Cubs-50-Seasons-Legends_19-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2018-3-2018-hero-decks-chicago-cubs-baseball-heroes-playing-cards', 2018, '2018', '3♥', '2018 Hero Decks Chicago Cubs Baseball Heroes Playing Cards', NULL,
        NULL, NULL, '2018_Hero-Decks-Chicago-Cubs-Baseball-Heroes-Playing-Cards_3♥-Fr.jpg', '2018_Hero-Decks-Chicago-Cubs-Baseball-Heroes-Playing-Cards_3♥-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2018-fl-chi-2018-panini-national-treasures-franchise-lineups-booklets-platinum', 2018, '2018', 'FL-CHI', '2018 Panini National Treasures Franchise Lineups Booklets Platinum', NULL,
        'Panini', 'panini', '2018_Panini-National-Treasures-Franchise-Lineups-Booklets-Platinum_FL-CHI-Fr.jpg', '2018_Panini-National-Treasures-Franchise-Lineups-Booklets-Platinum_FL-CHI-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2018-t5-2018-topps-on-demand-set-8-dynamic-duals-teammates', 2018, '2018', 'T5', '2018 Topps On Demand Set 8 Dynamic Duals Teammates', NULL,
        'Topps', 'topps', NULL, '2018_Topps-On-Demand-Set-8-Dynamic-Duals-Teammates_T5-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2019-sp-mg2-2019-panini-flawless-signature-patches-emerald', 2019, '2019', 'SP-MG2', '2019 Panini Flawless Signature Patches Emerald', NULL,
        'Panini', 'panini', '2019_Panini-Flawless-Signature-Patches-Emerald_SP-MG2-Fr.jpg', '2019_Panini-Flawless-Signature-Patches-Emerald_SP-MG2-Bk.jpg',
        1, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2019-sp-mg1-2019-panini-flawless-signature-patches-gold', 2019, '2019', 'SP-MG1', '2019 Panini Flawless Signature Patches Gold', NULL,
        'Panini', 'panini', '2019_Panini-Flawless-Signature-Patches-Gold_SP-MG1-Fr.jpg', '2019_Panini-Flawless-Signature-Patches-Gold_SP-MG1-Bk.jpg',
        1, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2019-sp-mg2-2019-panini-flawless-signature-patches-gold', 2019, '2019', 'SP-MG2', '2019 Panini Flawless Signature Patches Gold', NULL,
        'Panini', 'panini', '2019_Panini-Flawless-Signature-Patches-Gold_SP-MG2-Fr.jpg', '2019_Panini-Flawless-Signature-Patches-Gold_SP-MG2-Bk.jpg',
        1, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2019-sp-mg2-2019-panini-flawless-signature-patches-sapphire', 2019, '2019', 'SP-MG2', '2019 Panini Flawless Signature Patches Sapphire', NULL,
        'Panini', 'panini', '2019_Panini-Flawless-Signature-Patches-Sapphire_SP-MG2-Fr.jpg', NULL,
        1, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2019-ggm-mg-2019-panini-national-treasures-game-gear-materials-duals', 2019, '2019', 'GGM-MG', '2019 Panini National Treasures Game Gear Materials Duals', NULL,
        'Panini', 'panini', '2019_Panini-National-Treasures-Game-Gear-Materials-Duals_GGM-MG-Fr.jpg', '2019_Panini-National-Treasures-Game-Gear-Materials-Duals_GGM-MG-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2019-t84-46-2019-topps-1984-topps-baseball-35th-anniversary-chrome-series-one', 2019, '2019', 'T84-46', '2019 Topps 1984 Topps Baseball 35th Anniversary Chrome (Series One)', NULL,
        'Topps', 'topps', '2019_Topps-1984-Topps-Baseball-35th-Anniversary-Chrome-(Series-One)_T84-46-Fr.jpg', '2019_Topps-1984-Topps-Baseball-35th-Anniversary-Chrome-(Series-One)_T84-46-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2019-t84-46-2019-topps-1984-topps-baseball-35th-anniversary-chrome-autographs-series-one', 2019, '2019', 'T84-46', '2019 Topps 1984 Topps Baseball 35th Anniversary Chrome Autographs (Series One)', NULL,
        'Topps', 'topps', '2019_Topps-1984-Topps-Baseball-35th-Anniversary-Chrome-Autographs-(Series-One)_T84-46-Fr.jpg', '2019_Topps-1984-Topps-Baseball-35th-Anniversary-Chrome-Autographs-(Series-One)_T84-46-Bk.jpg',
        1, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2019-as-mg-2019-topps-archives-snapshots-black-and-white', 2019, '2019', 'AS-MG', '2019 Topps Archives Snapshots Black and White', NULL,
        'Topps', 'topps', '2019_Topps-Archives-Snapshots-Black-and-White_AS-MG-Fr.jpg', '2019_Topps-Archives-Snapshots-Black-and-White_AS-MG-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2019-as-mg-2019-topps-archives-snapshots-blue', 2019, '2019', 'AS-MG', '2019 Topps Archives Snapshots Blue', NULL,
        'Topps', 'topps', '2019_Topps-Archives-Snapshots-Blue_AS-MG-Fr.jpg', '2019_Topps-Archives-Snapshots-Blue_AS-MG-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2019-as-mg-2019-topps-archives-snapshots', 2019, '2019', 'AS-MG', '2019 Topps Archives Snapshots', NULL,
        'Topps', 'topps', '2019_Topps-Archives-Snapshots_AS-MG-Fr.jpg', '2019_Topps-Archives-Snapshots_AS-MG-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2019-fof-2-2019-topps-faces-of-the-franchise-150th-anniversary', 2019, '2019', 'FOF-2', '2019 Topps Faces of the Franchise 150th Anniversary', NULL,
        'Topps', 'topps', '2019_Topps-Faces-of-the-Franchise-150th-Anniversary_FOF-2-Fr.jpg', '2019_Topps-Faces-of-the-Franchise-150th-Anniversary_FOF-2-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2019-fof-2-2019-topps-faces-of-the-franchise-5x7-gold', 2019, '2019', 'FOF-2', '2019 Topps Faces of the Franchise 5x7 Gold', NULL,
        'Topps', 'topps', '2019_Topps-Faces-of-the-Franchise-5x7-Gold_FOF-2-Fr.jpg', '2019_Topps-Faces-of-the-Franchise-5x7-Gold_FOF-2-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2019-fof-2-2019-topps-faces-of-the-franchise-5x7', 2019, '2019', 'FOF-2', '2019 Topps Faces of the Franchise 5x7', NULL,
        'Topps', 'topps', '2019_Topps-Faces-of-the-Franchise-5x7_FOF-2-Fr.jpg', '2019_Topps-Faces-of-the-Franchise-5x7_FOF-2-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2019-fof-2-2019-topps-faces-of-the-franchise-black', 2019, '2019', 'FOF-2', '2019 Topps Faces of the Franchise Black', NULL,
        'Topps', 'topps', '2019_Topps-Faces-of-the-Franchise-Black_FOF-2-Fr.jpg', '2019_Topps-Faces-of-the-Franchise-Black_FOF-2-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2019-fof-2-2019-topps-faces-of-the-franchise-blue', 2019, '2019', 'FOF-2', '2019 Topps Faces of the Franchise Blue', NULL,
        'Topps', 'topps', '2019_Topps-Faces-of-the-Franchise-Blue_FOF-2-Fr.jpg', '2019_Topps-Faces-of-the-Franchise-Blue_FOF-2-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2019-fof-2-2019-topps-faces-of-the-franchise-gold', 2019, '2019', 'FOF-2', '2019 Topps Faces of the Franchise Gold', NULL,
        'Topps', 'topps', '2019_Topps-Faces-of-the-Franchise-Gold_FOF-2-Fr.jpg', '2019_Topps-Faces-of-the-Franchise-Gold_FOF-2-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2019-fof-2-2019-topps-faces-of-the-franchise', 2019, '2019', 'FOF-2', '2019 Topps Faces of the Franchise', NULL,
        'Topps', 'topps', '2019_Topps-Faces-of-the-Franchise_FOF-2-Fr.jpg', '2019_Topps-Faces-of-the-Franchise_FOF-2-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2020-325-2020-topps-allen-ginter-mini', 2020, '2020', '325', '2020 Topps Allen & Ginter Mini', NULL,
        'Topps', 'topps', '2020_Topps-Allen-&-Ginter-Mini_325-Fr.jpg', '2020_Topps-Allen-&-Ginter-Mini_325-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2020-325-2020-topps-allen-ginter-silver-portrait', 2020, '2020', '325', '2020 Topps Allen & Ginter Silver Portrait', NULL,
        'Topps', 'topps', NULL, '2020_Topps-Allen-&-Ginter-Silver-Portrait_325-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2020-325-2020-topps-allen-ginter-x', 2020, '2020', '325', '2020 Topps Allen & Ginter X', NULL,
        'Topps', 'topps', '2020_Topps-Allen-&-Ginter-X_325-Fr.jpg', '2020_Topps-Allen-&-Ginter-X_325-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2020-325-2020-topps-allen-ginter', 2020, '2020', '325', '2020 Topps Allen & Ginter', NULL,
        'Topps', 'topps', '2020_Topps-Allen-&-Ginter_325-Fr.jpg', '2020_Topps-Allen-&-Ginter_325-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2020-trc-36-2020-topps-update-turkey-red-2020-chrome', 2020, '2020', 'TRC-36', '2020 Topps Update Turkey Red 2020 Chrome', NULL,
        'Topps', 'topps', '2020_Topps-Update-Turkey-Red-2020-Chrome_TRC-36-Fr.jpg', '2020_Topps-Update-Turkey-Red-2020-Chrome_TRC-36-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2020-tr-36-2020-topps-update-turkey-red-2020', 2020, '2020', 'TR-36', '2020 Topps Update Turkey Red 2020', NULL,
        'Topps', 'topps', '2020_Topps-Update-Turkey-Red-2020_TR-36-Fr.jpg', '2020_Topps-Update-Turkey-Red-2020_TR-36-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2021-mc-18-2021-leaf-lumber-midsummer-classic-relics-purple', 2021, '2021', 'MC-18', '2021 Leaf Lumber Midsummer Classic Relics Purple', NULL,
        'Leaf', 'leaf', '2021_Leaf-Lumber-Midsummer-Classic-Relics-Purple_MC-18-Fr.jpg', '2021_Leaf-Lumber-Midsummer-Classic-Relics-Purple_MC-18-Bk.jpg',
        0, 1, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2021-bos-mg-2021-panini-chronicles-boys-of-summer-autographs', 2021, '2021', 'BOS-MG', '2021 Panini Chronicles Boys of Summer Autographs', NULL,
        'Panini', 'panini', '2021_Panini-Chronicles-Boys-of-Summer-Autographs_BOS-MG-Fr.jpg', '2021_Panini-Chronicles-Boys-of-Summer-Autographs_BOS-MG-Bk.jpg',
        1, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2021-547-2021-topps-chrome-platinum-anniversary-black-white-mini-diamonds-refractors', 2021, '2021', '547', '2021 Topps Chrome Platinum Anniversary Black & White Mini Diamonds Refractors', NULL,
        'Topps', 'topps', '2021_Topps-Chrome-Platinum-Anniversary-Black-&-White-Mini-Diamonds-Refractors_547-Fr.jpg', '2021_Topps-Chrome-Platinum-Anniversary-Black-&-White-Mini-Diamonds-Refractors_547-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2021-547-2021-topps-chrome-platinum-anniversary-blue-mini-diamond-refractors', 2021, '2021', '547', '2021 Topps Chrome Platinum Anniversary Blue Mini Diamond Refractors', NULL,
        'Topps', 'topps', '2021_Topps-Chrome-Platinum-Anniversary-Blue-Mini-Diamond-Refractors_547-Fr.jpg', '2021_Topps-Chrome-Platinum-Anniversary-Blue-Mini-Diamond-Refractors_547-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2021-547-2021-topps-chrome-platinum-anniversary-gold-rose-gold-70th-anniversary-wave-refractors', 2021, '2021', '547', '2021 Topps Chrome Platinum Anniversary Gold Rose Gold 70th Anniversary Wave Refractors', NULL,
        'Topps', 'topps', '2021_Topps-Chrome-Platinum-Anniversary-Gold-Rose-Gold-70th-Anniversary-Wave-Refractors_547-Fr.jpg', '2021_Topps-Chrome-Platinum-Anniversary-Gold-Rose-Gold-70th-Anniversary-Wave-Refractors_547-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2021-547-2021-topps-chrome-platinum-anniversary-x-fractors', 2021, '2021', '547', '2021 Topps Chrome Platinum Anniversary X Fractors', NULL,
        'Topps', 'topps', '2021_Topps-Chrome-Platinum-Anniversary-X-Fractors_547-Fr.jpg', '2021_Topps-Chrome-Platinum-Anniversary-X-Fractors_547-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2021-547-2021-topps-chrome-platinum-anniversary', 2021, '2021', '547', '2021 Topps Chrome Platinum Anniversary', NULL,
        'Topps', 'topps', '2021_Topps-Chrome-Platinum-Anniversary_547-Fr.jpg', '2021_Topps-Chrome-Platinum-Anniversary_547-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2021-dac-sg-2021-topps-definitive-collection-dual-autograph-collection', 2021, '2021', 'DAC-SG', '2021 Topps Definitive Collection Dual Autograph Collection', NULL,
        'Topps', 'topps', '2021_Topps-Definitive-Collection-Dual-Autograph-Collection_DAC-SG-Fr.jpg', '2021_Topps-Definitive-Collection-Dual-Autograph-Collection_DAC-SG-Bk.jpg',
        1, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2021-spdra-mg-2021-topps-museum-collection-single-player-signature-swatches-dual-relic-autographs', 2021, '2021', 'SPDRA-MG', '2021 Topps Museum Collection Single Player Signature Swatches Dual Relic Autographs', NULL,
        'Topps', 'topps', '2021_Topps-Museum-Collection-Single-Player-Signature-Swatches-Dual-Relic-Autographs_SPDRA-MG-Fr.jpg', '2021_Topps-Museum-Collection-Single-Player-Signature-Swatches-Dual-Relic-Autographs_SPDRA-MG-Bk.jpg',
        1, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2021-t1ar-mg-2021-topps-tier-one-autograph-tier-one-relics', 2021, '2021', 'T1AR-MG', '2021 Topps Tier One Autograph Tier One Relics', NULL,
        'Topps', 'topps', '2021_Topps-Tier-One-Autograph-Tier-One-Relics_T1AR-MG-Fr.jpg', '2021_Topps-Tier-One-Autograph-Tier-One-Relics_T1AR-MG-Bk.jpg',
        1, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2021-ttar-mg1-2021-topps-triple-threads-triple-threads-autograph-relics', 2021, '2021', 'TTAR-MG1', '2021 Topps Triple Threads Triple Threads Autograph Relics', NULL,
        'Topps', 'topps', '2021_Topps-Triple-Threads-Triple-Threads-Autograph-Relics_TTAR-MG1-Fr.jpg', '2021_Topps-Triple-Threads-Triple-Threads-Autograph-Relics_TTAR-MG1-Bk.jpg',
        1, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2021-86b-mgr-2021-topps-update-1986-topps-baseball-35th-anniversary-autographs', 2021, '2021', '86B-MGR', '2021 Topps Update 1986 Topps Baseball 35th Anniversary Autographs', NULL,
        'Topps', 'topps', '2021_Topps-Update-1986-Topps-Baseball-35th-Anniversary-Autographs_86B-MGR-Fr.jpg', '2021_Topps-Update-1986-Topps-Baseball-35th-Anniversary-Autographs_86B-MGR-Bk.jpg',
        1, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2022-thk-09-2022-leaf-lumber-the-hit-kings-relics-emerald', 2022, '2022', 'THK-09', '2022 Leaf Lumber The Hit Kings Relics Emerald', NULL,
        'Leaf', 'leaf', '2022_Leaf-Lumber-The-Hit-Kings-Relics-Emerald_THK-09-Fr.jpg', '2022_Leaf-Lumber-The-Hit-Kings-Relics-Emerald_THK-09-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2022-agra-mg-2022-topps-allen-ginter-full-size-relics-a-design', 2022, '2022', 'AGRA-MG', '2022 Topps Allen & Ginter Full Size Relics A Design', NULL,
        'Topps', 'topps', '2022_Topps-Allen-&-Ginter-Full-Size-Relics-A-Design_AGRA-MG-Fr.jpg', '2022_Topps-Allen-&-Ginter-Full-Size-Relics-A-Design_AGRA-MG-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2022-sdar-sr-2022-topps-sterling-sterling-sets-dual-autograph-relics-red', 2022, '2022', 'SDAR-SR', '2022 Topps Sterling Sterling Sets Dual Autograph Relics Red', NULL,
        'Topps', 'topps', '2022_Topps-Sterling-Sterling-Sets-Dual-Autograph-Relics-Red_SDAR-SR-Fr.jpg', '2022_Topps-Sterling-Sterling-Sets-Dual-Autograph-Relics-Red_SDAR-SR-Bk.jpg',
        1, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2022-arc-dsg-2022-topps-triple-threads-autograph-relic-combo-amethyst', 2022, '2022', 'ARC-DSG', '2022 Topps Triple Threads Autograph Relic Combo Amethyst', NULL,
        'Topps', 'topps', '2022_Topps-Triple-Threads-Autograph-Relic-Combo-Amethyst_ARC-DSG-Fr.jpg', '2022_Topps-Triple-Threads-Autograph-Relic-Combo-Amethyst_ARC-DSG-Bk.jpg',
        1, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2023-nno-2023-choice-hillsboro-hops-legends', 2023, '2023', 'NNO', '2023 Choice Hillsboro Hops Legends', NULL,
        NULL, NULL, '2023_Choice-Hillsboro-Hops-Legends_NNO-Fr.jpg', '2023_Choice-Hillsboro-Hops-Legends_NNO-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2023-19-2023-panini-chronicles-elite-blue', 2023, '2023', '19', '2023 Panini Chronicles Elite Blue', NULL,
        'Panini', 'panini', '2023_Panini-Chronicles-Elite-Blue_19-Fr.jpg', '2023_Panini-Chronicles-Elite-Blue_19-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2023-19-2023-panini-chronicles-elite-purple', 2023, '2023', '19', '2023 Panini Chronicles Elite Purple', NULL,
        'Panini', 'panini', '2023_Panini-Chronicles-Elite-Purple_19-Fr.jpg', '2023_Panini-Chronicles-Elite-Purple_19-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2023-19-2023-panini-chronicles-elite', 2023, '2023', '19', '2023 Panini Chronicles Elite', NULL,
        'Panini', 'panini', '2023_Panini-Chronicles-Elite_19-Fr.jpg', '2023_Panini-Chronicles-Elite_19-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2023-214-2023-panini-prizm-blue-ice-prizms', 2023, '2023', '214', '2023 Panini Prizm Blue Ice Prizms', NULL,
        'Panini', 'panini', '2023_Panini-Prizm-Blue-Ice-Prizms_214-Fr.jpg', '2023_Panini-Prizm-Blue-Ice-Prizms_214-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2023-214-2023-panini-prizm-ice-prizms', 2023, '2023', '214', '2023 Panini Prizm Ice Prizms', NULL,
        'Panini', 'panini', '2023_Panini-Prizm-Ice-Prizms_214-Fr.jpg', '2023_Panini-Prizm-Ice-Prizms_214-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2023-214-2023-panini-prizm-silver-prizms', 2023, '2023', '214', '2023 Panini Prizm Silver Prizms', NULL,
        'Panini', 'panini', '2023_Panini-Prizm-Silver-Prizms_214-Fr.jpg', '2023_Panini-Prizm-Silver-Prizms_214-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2023-214-2023-panini-prizm', 2023, '2023', '214', '2023 Panini Prizm', NULL,
        'Panini', 'panini', '2023_Panini-Prizm_214-Fr.jpg', '2023_Panini-Prizm_214-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2023-257-2023-panini-select', 2023, '2023', '257', '2023 Panini Select', NULL,
        'Panini', 'panini', '2023_Panini-Select_257-Fr.jpg', '2023_Panini-Select_257-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2023-74-2023-topps-pristine-refractor', 2023, '2023', '74', '2023 Topps Pristine Refractor', NULL,
        'Topps', 'topps', '2023_Topps-Pristine-Refractor_74-Fr.jpg', '2023_Topps-Pristine-Refractor_74-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2023-74-2023-topps-pristine', 2023, '2023', '74', '2023 Topps Pristine', NULL,
        'Topps', 'topps', '2023_Topps-Pristine_74-Fr.jpg', '2023_Topps-Pristine_74-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2024-ta-5-2024-leaf-metal-triple-autographs-lava-black', 2024, '2024', 'TA-5', '2024 Leaf Metal Triple Autographs Lava Black', NULL,
        'Leaf', 'leaf', '2024_Leaf-Metal-Triple-Autographs-Lava-Black_TA-5-Fr.jpg', '2024_Leaf-Metal-Triple-Autographs-Lava-Black_TA-5-Bk.jpg',
        1, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2024-ta-5-2024-leaf-metal-triple-autographs-prismatic-black', 2024, '2024', 'TA-5', '2024 Leaf Metal Triple Autographs Prismatic Black', NULL,
        'Leaf', 'leaf', '2024_Leaf-Metal-Triple-Autographs-Prismatic-Black_TA-5-Fr.jpg', '2024_Leaf-Metal-Triple-Autographs-Prismatic-Black_TA-5-Bk.jpg',
        1, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2024-173-2024-panini-crusade-silver', 2024, '2024', '173', '2024 Panini Crusade Silver', NULL,
        'Panini', 'panini', '2024_Panini-Crusade-Silver_173-Fr.jpg', '2024_Panini-Crusade-Silver_173-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2024-173-2024-panini-crusade', 2024, '2024', '173', '2024 Panini Crusade', NULL,
        'Panini', 'panini', '2024_Panini-Crusade_173-Fr.jpg', '2024_Panini-Crusade_173-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2024-du-mgr-2024-panini-flawless-dual-patches', 2024, '2024', 'DU-MGR', '2024 Panini Flawless Dual Patches', NULL,
        'Panini', 'panini', '2024_Panini-Flawless-Dual-Patches_DU-MGR-Fr.jpg', '2024_Panini-Flawless-Dual-Patches_DU-MGR-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2024-89ba-mg-2024-topps-1989-topps-baseball-35th-anniversary-autographs-black-series-two', 2024, '2024', '89BA-MG', '2024 Topps 1989 Topps Baseball 35th Anniversary Autographs Black (Series Two)', NULL,
        'Topps', 'topps', '2024_Topps-1989-Topps-Baseball-35th-Anniversary-Autographs-Black-(Series-Two)_89BA-MG-Fr.jpg', '2024_Topps-1989-Topps-Baseball-35th-Anniversary-Autographs-Black-(Series-Two)_89BA-MG-Bk.jpg',
        1, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2024-darbc-bg-2024-topps-allen-ginter-a-g-dual-autographed-relic-books', 2024, '2024', 'DARBC-BG', '2024 Topps Allen & Ginter A&G Dual Autographed Relic Books', NULL,
        'Topps', 'topps', '2024_Topps-Allen-&-Ginter-A&G-Dual-Autographed-Relic-Books_DARBC-BG-Fr.jpg', '2024_Topps-Allen-&-Ginter-A&G-Dual-Autographed-Relic-Books_DARBC-BG-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2024-darbc-mg-2024-topps-allen-ginter-a-g-dual-autographed-relic-books', 2024, '2024', 'DARBC-MG', '2024 Topps Allen & Ginter A&G Dual Autographed Relic Books', NULL,
        'Topps', 'topps', '2024_Topps-Allen-&-Ginter-A&G-Dual-Autographed-Relic-Books_DARBC-MG-Fr.jpg', '2024_Topps-Allen-&-Ginter-A&G-Dual-Autographed-Relic-Books_DARBC-MG-Bk.jpg',
        0, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2024-ma-mg-2024-topps-allen-ginter-framed-mini-baseball-autographs', 2024, '2024', 'MA-MG', '2024 Topps Allen & Ginter Framed Mini Baseball Autographs', NULL,
        'Topps', 'topps', '2024_Topps-Allen-&-Ginter-Framed-Mini-Baseball-Autographs_MA-MG-Fr.jpg', '2024_Topps-Allen-&-Ginter-Framed-Mini-Baseball-Autographs_MA-MG-Bk.jpg',
        1, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2024-mfr-mg-2024-topps-allen-ginter-framed-mini-relics', 2024, '2024', 'MFR-MG', '2024 Topps Allen & Ginter Framed Mini Relics', NULL,
        'Topps', 'topps', '2024_Topps-Allen-&-Ginter-Framed-Mini-Relics_MFR-MG-Fr.jpg', '2024_Topps-Allen-&-Ginter-Framed-Mini-Relics_MFR-MG-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2024-mfr-mgr-2024-topps-allen-ginter-framed-mini-relics', 2024, '2024', 'MFR-MGR', '2024 Topps Allen & Ginter Framed Mini Relics', NULL,
        'Topps', 'topps', '2024_Topps-Allen-&-Ginter-Framed-Mini-Relics_MFR-MGR-Fr.jpg', '2024_Topps-Allen-&-Ginter-Framed-Mini-Relics_MFR-MGR-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2024-agr-mg-2024-topps-allen-ginter-full-size-relics-b', 2024, '2024', 'AGR-MG', '2024 Topps Allen & Ginter Full Size Relics B', NULL,
        'Topps', 'topps', '2024_Topps-Allen-&-Ginter-Full-Size-Relics-B_AGR-MG-Fr.jpg', NULL,
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2024-ttar-mg2-2024-topps-triple-threads-triple-threads-autograph-relics-printing-plates-cyan', 2024, '2024', 'TTAR-MG2', '2024 Topps Triple Threads Triple Threads Autograph Relics Printing Plates Cyan', NULL,
        'Topps', 'topps', '2024_Topps-Triple-Threads-Triple-Threads-Autograph-Relics-Printing-Plates-Cyan_TTAR-MG2-Fr.jpg', '2024_Topps-Triple-Threads-Triple-Threads-Autograph-Relics-Printing-Plates-Cyan_TTAR-MG2-Bk.jpg',
        1, 1, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2024-bin-12-2024-topps-x-chris-berman-boomer-s-baseball-berman-s-illustrious-nicknames', 2024, '2024', 'BIN-12', '2024 Topps x Chris Berman Boomer''s Baseball Berman''s Illustrious Nicknames', NULL,
        'Topps', 'topps', '2024_Topps-x-Chris-Berman-Boomer''s-Baseball-Berman''s-Illustrious-Nicknames_BIN-12-Fr.jpg', '2024_Topps-x-Chris-Berman-Boomer''s-Baseball-Berman''s-Illustrious-Nicknames_BIN-12-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2024-28-2024-topps-x-chris-berman-boomer-s-baseball-berman-s-nicknames-nameplate', 2024, '2024', '28', '2024 Topps x Chris Berman Boomer''s Baseball Berman''s Nicknames Nameplate', NULL,
        'Topps', 'topps', '2024_Topps-x-Chris-Berman-Boomer''s-Baseball-Berman''s-Nicknames-Nameplate_28-Fr.jpg', '2024_Topps-x-Chris-Berman-Boomer''s-Baseball-Berman''s-Nicknames-Nameplate_28-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2024-28-2024-topps-x-chris-berman-boomer-s-baseball-gold', 2024, '2024', '28', '2024 Topps x Chris Berman Boomer''s Baseball Gold', NULL,
        'Topps', 'topps', '2024_Topps-x-Chris-Berman-Boomer''s-Baseball-Gold_28-Fr.jpg', '2024_Topps-x-Chris-Berman-Boomer''s-Baseball-Gold_28-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2024-28-2024-topps-x-chris-berman-boomer-s-baseball-silver', 2024, '2024', '28', '2024 Topps x Chris Berman Boomer''s Baseball Silver', NULL,
        'Topps', 'topps', '2024_Topps-x-Chris-Berman-Boomer''s-Baseball-Silver_28-Fr.jpg', '2024_Topps-x-Chris-Berman-Boomer''s-Baseball-Silver_28-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2024-28-2024-topps-x-chris-berman-boomer-s-baseball', 2024, '2024', '28', '2024 Topps x Chris Berman Boomer''s Baseball', NULL,
        'Topps', 'topps', '2024_Topps-x-Chris-Berman-Boomer''s-Baseball_28-Fr.jpg', '2024_Topps-x-Chris-Berman-Boomer''s-Baseball_28-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2025-90a-mg-2025-topps-1990-topps-baseball-35th-anniversary-autographs-series-one', 2025, '2025', '90A-MG', '2025 Topps 1990 Topps Baseball 35th Anniversary Autographs (Series One)', NULL,
        'Topps', 'topps', '2025_Topps-1990-Topps-Baseball-35th-Anniversary-Autographs-(Series-One)_90A-MG-Fr.jpg', '2025_Topps-1990-Topps-Baseball-35th-Anniversary-Autographs-(Series-One)_90A-MG-Bk.jpg',
        1, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2025-cs-14-2025-topps-all-star-game-classic-swings', 2025, '2025', 'CS-14', '2025 Topps All Star Game Classic Swings', NULL,
        'Topps', 'topps', '2025_Topps-All-Star-Game-Classic-Swings_CS-14-Fr.jpg', '2025_Topps-All-Star-Game-Classic-Swings_CS-14-Bk.jpg',
        0, 0, 0, 1, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2025-096-2025-topps-black-white', 2025, '2025', '096', '2025 Topps Black & White', NULL,
        'Topps', 'topps', '2025_Topps-Black-&-White_096-Fr.jpg', '2025_Topps-Black-&-White_096-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2025-383-2025-topps-chrome-platinum-blue-shimmer-refractors', 2025, '2025', '383', '2025 Topps Chrome Platinum Blue Shimmer Refractors', NULL,
        'Topps', 'topps', '2025_Topps-Chrome-Platinum-Blue-Shimmer-Refractors_383-Fr.jpg', '2025_Topps-Chrome-Platinum-Blue-Shimmer-Refractors_383-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2025-383-2025-topps-chrome-platinum-blue-vibrations-refractors', 2025, '2025', '383', '2025 Topps Chrome Platinum Blue Vibrations Refractors', NULL,
        'Topps', 'topps', '2025_Topps-Chrome-Platinum-Blue-Vibrations-Refractors_383-Fr.jpg', '2025_Topps-Chrome-Platinum-Blue-Vibrations-Refractors_383-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2025-383-2025-topps-chrome-platinum-green-vibrations-refractors', 2025, '2025', '383', '2025 Topps Chrome Platinum Green Vibrations Refractors', NULL,
        'Topps', 'topps', '2025_Topps-Chrome-Platinum-Green-Vibrations-Refractors_383-Fr.jpg', '2025_Topps-Chrome-Platinum-Green-Vibrations-Refractors_383-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2025-383-2025-topps-chrome-platinum-platinum-toile-white-orange-refractors', 2025, '2025', '383', '2025 Topps Chrome Platinum Platinum Toile White Orange Refractors', NULL,
        'Topps', 'topps', '2025_Topps-Chrome-Platinum-Platinum-Toile-White-Orange-Refractors_383-Fr.jpg', '2025_Topps-Chrome-Platinum-Platinum-Toile-White-Orange-Refractors_383-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2025-383-2025-topps-chrome-platinum-prism-refractors', 2025, '2025', '383', '2025 Topps Chrome Platinum Prism Refractors', NULL,
        'Topps', 'topps', '2025_Topps-Chrome-Platinum-Prism-Refractors_383-Fr.jpg', '2025_Topps-Chrome-Platinum-Prism-Refractors_383-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2025-383-2025-topps-chrome-platinum-refractors', 2025, '2025', '383', '2025 Topps Chrome Platinum Refractors', NULL,
        'Topps', 'topps', '2025_Topps-Chrome-Platinum-Refractors_383-Fr.jpg', '2025_Topps-Chrome-Platinum-Refractors_383-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2025-383-2025-topps-chrome-platinum-topps-refractors', 2025, '2025', '383', '2025 Topps Chrome Platinum Topps Refractors', NULL,
        'Topps', 'topps', '2025_Topps-Chrome-Platinum-Topps-Refractors_383-Fr.jpg', '2025_Topps-Chrome-Platinum-Topps-Refractors_383-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2025-383-2025-topps-chrome-platinum', 2025, '2025', '383', '2025 Topps Chrome Platinum', NULL,
        'Topps', 'topps', '2025_Topps-Chrome-Platinum_383-Fr.jpg', '2025_Topps-Chrome-Platinum_383-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2025-801-2025-topps-living', 2025, '2025', '801', '2025 Topps Living', NULL,
        'Topps', 'topps', '2025_Topps-Living_801-Fr.jpg', '2025_Topps-Living_801-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2025-nno-2025-topps-t205-american-beauty-back', 2025, '2025', 'NNO', '2025 Topps T205 American Beauty Back', NULL,
        'Topps', 'topps', '2025_Topps-T205-American-Beauty-Back_NNO-Fr.jpg', NULL,
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2025-nno-2025-topps-t205-blank-back', 2025, '2025', 'NNO', '2025 Topps T205 Blank Back', NULL,
        'Topps', 'topps', '2025_Topps-T205-Blank-Back_NNO-Fr.jpg', '2025_Topps-T205-Blank-Back_NNO-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2025-nno-2025-topps-t205-broad-leaf-back', 2025, '2025', 'NNO', '2025 Topps T205 Broad Leaf Back', NULL,
        'Topps', 'topps', '2025_Topps-T205-Broad-Leaf-Back_NNO-Fr.jpg', '2025_Topps-T205-Broad-Leaf-Back_NNO-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2025-nno-2025-topps-t205-cycle-back', 2025, '2025', 'NNO', '2025 Topps T205 Cycle Back', NULL,
        'Topps', 'topps', '2025_Topps-T205-Cycle-Back_NNO-Fr.jpg', '2025_Topps-T205-Cycle-Back_NNO-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2025-nno-2025-topps-t205-drum-back', 2025, '2025', 'NNO', '2025 Topps T205 Drum Back', NULL,
        'Topps', 'topps', '2025_Topps-T205-Drum-Back_NNO-Fr.jpg', '2025_Topps-T205-Drum-Back_NNO-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2025-nno-2025-topps-t205-piedmont-back', 2025, '2025', 'NNO', '2025 Topps T205 Piedmont Back', NULL,
        'Topps', 'topps', '2025_Topps-T205-Piedmont-Back_NNO-Fr.jpg', '2025_Topps-T205-Piedmont-Back_NNO-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2025-nno-2025-topps-t205-polar-bear-back', 2025, '2025', 'NNO', '2025 Topps T205 Polar Bear Back', NULL,
        'Topps', 'topps', '2025_Topps-T205-Polar-Bear-Back_NNO-Fr.jpg', '2025_Topps-T205-Polar-Bear-Back_NNO-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2025-nno-2025-topps-t205-sovereign-back', 2025, '2025', 'NNO', '2025 Topps T205 Sovereign Back', NULL,
        'Topps', 'topps', '2025_Topps-T205-Sovereign-Back_NNO-Fr.jpg', '2025_Topps-T205-Sovereign-Back_NNO-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2025-nno-2025-topps-t205-sweet-caporal-back', 2025, '2025', 'NNO', '2025 Topps T205 Sweet Caporal Back', NULL,
        'Topps', 'topps', '2025_Topps-T205-Sweet-Caporal-Back_NNO-Fr.jpg', '2025_Topps-T205-Sweet-Caporal-Back_NNO-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2025-nno-2025-topps-t205', 2025, '2025', 'NNO', '2025 Topps T205', NULL,
        'Topps', 'topps', '2025_Topps-T205_NNO-Fr.jpg', '2025_Topps-T205_NNO-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2026-91a-mg-2026-topps-1991-topps-baseball-35th-anniversary-autographs-series-one', 2026, '2026', '91A-MG', '2026 Topps 1991 Topps Baseball 35th Anniversary Autographs (Series One)', NULL,
        'Topps', 'topps', '2026_Topps-1991-Topps-Baseball-35th-Anniversary-Autographs-(Series-One)_91A-MG-Fr.jpg', '2026_Topps-1991-Topps-Baseball-35th-Anniversary-Autographs-(Series-One)_91A-MG-Bk.jpg',
        1, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2026-gw-63-2026-topps-glove-work-pink-foil', 2026, '2026', 'GW-63', '2026 Topps Glove Work Pink Foil', NULL,
        'Topps', 'topps', '2026_Topps-Glove-Work-Pink-Foil_GW-63-Fr.jpg', '2026_Topps-Glove-Work-Pink-Foil_GW-63-Bk.jpg',
        0, 0, 1, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);

INSERT INTO cards (id, year, section, card_num, set_name, variant, brand, brand_slug,
                   image, image_back, is_auto, is_relic, is_parallel, is_insert, tags, owned, sort_order)
VALUES ('2026-gw-63-2026-topps-glove-work', 2026, '2026', 'GW-63', '2026 Topps Glove Work', NULL,
        'Topps', 'topps', '2026_Topps-Glove-Work_GW-63-Fr.jpg', '2026_Topps-Glove-Work_GW-63-Bk.jpg',
        0, 0, 0, 0, NULL, 0,
        (SELECT * FROM (SELECT COALESCE(MAX(sort_order),0)+1 FROM cards) AS t))
ON DUPLICATE KEY UPDATE
  section=VALUES(section), card_num=VALUES(card_num), set_name=VALUES(set_name),
  brand=VALUES(brand), brand_slug=VALUES(brand_slug),
  image=VALUES(image), image_back=VALUES(image_back),
  is_auto=VALUES(is_auto), is_relic=VALUES(is_relic),
  is_parallel=VALUES(is_parallel), is_insert=VALUES(is_insert);
