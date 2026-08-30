-- Migration 010 — 55 more rows duplicated under a chopped set name.
--
-- Same cause as 009: the TCDB PDF cuts set names at about 37 characters.
-- These 55 were identified from the 46 saved TCDB pages rather than from
-- the scans — the page link text carries the untruncated set name, which
-- reaches rows the filenames never covered.
--
-- Each duplicates a fully-named row that already exists, and none of them
-- holds an image its twin lacks. Guarded on owned = 0 regardless.
--
-- Needs DELETE. Run as admin:
--   mysql -u ADMIN -p DBNAME < migrate-010-dedupe-from-pages.sql

DELETE FROM cards WHERE id = '1994-339-1994-stadium-club-team-first-day-is' AND owned = 0;
DELETE FROM cards WHERE id = '1996-54-1996-leaf-preferred-steel-bronze-pr' AND owned = 0;
DELETE FROM cards WHERE id = '1997-64-1997-bowman-chrome-international-re' AND owned = 0;
DELETE FROM cards WHERE id = '1997-16-1997-bowman-s-best-atomic-refractor' AND owned = 0;
DELETE FROM cards WHERE id = '1997-156-1997-donruss-limited-limited-exposu' AND owned = 0;
DELETE FROM cards WHERE id = '1997-42-1997-donruss-signature-series-plati' AND owned = 0;
DELETE FROM cards WHERE id = '1997-172-1997-flair-showcase-masterpiece-leg' AND owned = 0;
DELETE FROM cards WHERE id = '1998-39-1998-bowman-chrome-golden-anniversa' AND owned = 0;
DELETE FROM cards WHERE id = '1998-39-1998-bowman-chrome-international-re' AND owned = 0;
DELETE FROM cards WHERE id = '1998-70-1998-donruss-collections-donruss-sa' AND owned = 0;
DELETE FROM cards WHERE id = '1998-60-1998-donruss-crusade-green-executiv' AND owned = 0;
DELETE FROM cards WHERE id = '1998-60-1998-donruss-crusade-purple-executi' AND owned = 0;
DELETE FROM cards WHERE id = '1998-67-1998-donruss-signature-series-signa' AND owned = 0;
DELETE FROM cards WHERE id = '1998-160-1998-finest-no-protectors-refractor' AND owned = 0;
DELETE FROM cards WHERE id = '1998-174-1998-99-donruss-crusade-test-issue-gre' AND owned = 0;
DELETE FROM cards WHERE id = '1998-174-1998-99-donruss-crusade-test-issue-pur' AND owned = 0;
DELETE FROM cards WHERE id = '1999-64-1999-bowman-chrome-international-re' AND owned = 0;
DELETE FROM cards WHERE id = '1999-56-1999-pacific-crown-collection-plati' AND owned = 0;
DELETE FROM cards WHERE id = '1999-29-1999-pacific-invincible-platinum-bl' AND owned = 0;
DELETE FROM cards WHERE id = '2000-89-2000-fleer-showcase-legacy-collecti' AND owned = 0;
DELETE FROM cards WHERE id = '2001-38-2001-donruss-classics-timeless-trib' AND owned = 0;
DELETE FROM cards WHERE id = '2001-38-2001-donruss-elite-chicago-sun-time' AND owned = 0;
DELETE FROM cards WHERE id = '2001-97-2001-donruss-signature-signature-pr' AND owned = 0;
DELETE FROM cards WHERE id = '2002-39-2002-donruss-best-of-fan-club-natio' AND owned = 0;
DELETE FROM cards WHERE id = '2002-39-2002-donruss-best-of-fan-club-spotl' AND owned = 0;
DELETE FROM cards WHERE id = '2002-26-2002-donruss-chicago-sun-times-coll' AND owned = 0;
DELETE FROM cards WHERE id = '2002-79-2002-donruss-diamond-kings-gold-foi' AND owned = 0;
DELETE FROM cards WHERE id = '2002-079-2002-donruss-diamond-kings-sample-g' AND owned = 0;
DELETE FROM cards WHERE id = '2002-79-2002-donruss-diamond-kings-sample-g' AND owned = 0;
DELETE FROM cards WHERE id = '2002-79-2002-donruss-diamond-kings-sample-s' AND owned = 0;
DELETE FROM cards WHERE id = '2002-79-2002-donruss-diamond-kings-silver-f' AND owned = 0;
DELETE FROM cards WHERE id = '2002-26-2002-donruss-national-sports-collec' AND owned = 0;
DELETE FROM cards WHERE id = '2002-26-2002-donruss-originals-beckett-samp' AND owned = 0;
DELETE FROM cards WHERE id = '2003-mg-2003-bowman-heritage-diamond-cuts-r' AND owned = 0;
DELETE FROM cards WHERE id = '2003-15-2003-donruss-champions-beckett-samp' AND owned = 0;
DELETE FROM cards WHERE id = '2003-15-2003-donruss-champions-national-spo' AND owned = 0;
DELETE FROM cards WHERE id = '2003-230-2003-donruss-chicago-collection-wra' AND owned = 0;
DELETE FROM cards WHERE id = '2003-23-2003-donruss-elite-recollection-col' AND owned = 0;
DELETE FROM cards WHERE id = '2003-jk-11-2003-donruss-jersey-kings-studio-se' AND owned = 0;
DELETE FROM cards WHERE id = '2003-230-2003-donruss-national-sports-collec' AND owned = 0;
DELETE FROM cards WHERE id = '2003-6-2003-donruss-signature-autographs-d' AND owned = 0;
DELETE FROM cards WHERE id = '2003-6-2003-donruss-signature-autographs-n' AND owned = 0;
DELETE FROM cards WHERE id = '2003-6-2003-donruss-signature-century-proo' AND owned = 0;
DELETE FROM cards WHERE id = '2003-6-2003-donruss-signature-decade-proof' AND owned = 0;
DELETE FROM cards WHERE id = '2004-cc-16-2004-donruss-classics-classic-combo' AND owned = 0;
DELETE FROM cards WHERE id = '2004-cc-13-2004-donruss-classics-classic-singl' AND owned = 0;
DELETE FROM cards WHERE id = '2004-dc-17-2004-donruss-classics-dress-code-ba' AND owned = 0;
DELETE FROM cards WHERE id = '2004-dc-17-2004-donruss-classics-dress-code-co' AND owned = 0;
DELETE FROM cards WHERE id = '2004-dc-17-2004-donruss-classics-dress-code-je' AND owned = 0;
DELETE FROM cards WHERE id = '2004-59-2004-donruss-classics-significant-s' AND owned = 0;
DELETE FROM cards WHERE id = '2004-tc-30-2004-donruss-classics-team-colors-c' AND owned = 0;
DELETE FROM cards WHERE id = '2004-tc-30-2004-donruss-classics-team-colors-j' AND owned = 0;
DELETE FROM cards WHERE id = '2004-tc-30-2004-donruss-classics-team-colors-s' AND owned = 0;
DELETE FROM cards WHERE id = '2004-59-2004-donruss-classics-timeless-trib' AND owned = 0;
DELETE FROM cards WHERE id = '2004-63-2004-donruss-diamond-kings-dk-combo' AND owned = 0;
