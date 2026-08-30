-- Migration 009 — remove truncated duplicate rows, fix one name.
--
-- The checklist was built from a TCDB PDF whose set-name column cuts off
-- at about 37 characters, so a number of sets were entered twice: once
-- under the chopped name and once in full. The image scans carry the
-- untruncated names, which is how these were identified.
--
-- Every row deleted here is a chopped name whose full-named twin already
-- exists AND already holds the image, so nothing is lost. The DELETE is
-- guarded on owned = 0 all the same: if you ever marked one of these
-- owned, the row survives and you can merge it by hand.
--
-- Rows where a shorter name is genuinely its own set are NOT touched.
-- 1998 Topps Tek Pattern 2 and Pattern 23 are two real sets, not one
-- truncated, and the same goes for every numeric suffix.
--
-- Needs DELETE, which the app account does not hold. Run as admin:
--   mysql -u ADMIN -p DBNAME < migrate-009-dedupe-truncated.sql

-- Check first — this should list the same rows the DELETE removes:
-- SELECT id, set_name, card_num, owned, image FROM cards WHERE id IN (…);

DELETE FROM cards WHERE id = '1989-291-1989-bowman-collector-s-edition-ti' AND owned = 0;
DELETE FROM cards WHERE id = '1989-17-1989-donruss-super-diamond-kings-5x' AND owned = 0;
DELETE FROM cards WHERE id = '1989-426-1989-fleer-collectors-edition-glos' AND owned = 0;
DELETE FROM cards WHERE id = '1989-3-1989-pacific-cards-comics-big-leagu' AND owned = 0;
DELETE FROM cards WHERE id = '1989-1-1989-pacific-cards-comics-crossed-b' AND owned = 0;
DELETE FROM cards WHERE id = '1989-2-1989-pacific-cards-comics-crossed-b' AND owned = 0;
DELETE FROM cards WHERE id = '1989-9-1989-pacific-cards-comics-series-ii' AND owned = 0;
DELETE FROM cards WHERE id = '1989-465-1989-topps-collector-s-edition-tif' AND owned = 0;
DELETE FROM cards WHERE id = '1990-29-1990-bowman-limited-edition-tiffan' AND owned = 0;
DELETE FROM cards WHERE id = '1990-240-1990-topps-collector-s-edition-tif' AND owned = 0;
DELETE FROM cards WHERE id = '1991-nno-1991-kenner-starting-lineup-cards-c' AND owned = 0;
DELETE FROM cards WHERE id = '1991-520-1991-topps-collector-s-edition-tif' AND owned = 0;
DELETE FROM cards WHERE id = '1991-16-1991-topps-superstar-stand-ups-clea' AND owned = 0;
DELETE FROM cards WHERE id = '1992-7-1992-jka-baseball-star-buttons-squa' AND owned = 0;
DELETE FROM cards WHERE id = '1993-27-1993-pacific-spanish-jugadores-cali' AND owned = 0;
DELETE FROM cards WHERE id = '1993-419-1993-stadium-club-first-day-product' AND owned = 0;
DELETE FROM cards WHERE id = '1993-nno-1993-stadium-club-master-photos-se' AND owned = 0;
DELETE FROM cards WHERE id = '1993-nno-1993-stadium-club-master-photos-mem' AND owned = 0;
DELETE FROM cards WHERE id = '1993-nno-1993-stadium-club-master-photos-red' AND owned = 0;
DELETE FROM cards WHERE id = '1994-114-1994-collector-s-choice-gold-signat' AND owned = 0;
DELETE FROM cards WHERE id = '1994-114-1994-collector-s-choice-silver-sign' AND owned = 0;
DELETE FROM cards WHERE id = '1994-13-1994-fleer-extra-bases-game-breaker' AND owned = 0;
DELETE FROM cards WHERE id = '1994-410-1994-topps-superstar-samplers-bowma' AND owned = 0;
DELETE FROM cards WHERE id = '1994-390-1994-topps-superstar-samplers-fines' AND owned = 0;
DELETE FROM cards WHERE id = '1994-403-1994-topps-superstar-samplers-stadi' AND owned = 0;
DELETE FROM cards WHERE id = '1995-205-1995-collector-s-choice-gold-signat' AND owned = 0;
DELETE FROM cards WHERE id = '1995-83-1995-collector-s-choice-se-gold-sig' AND owned = 0;
DELETE FROM cards WHERE id = '1995-83-1995-collector-s-choice-se-silver-s' AND owned = 0;
DELETE FROM cards WHERE id = '1995-205-1995-collector-s-choice-silver-sign' AND owned = 0;
DELETE FROM cards WHERE id = '1995-213-1995-stadium-club-super-team-exchan' AND owned = 0;
DELETE FROM cards WHERE id = '1995-393-1995-stadium-club-super-team-exchan' AND owned = 0;
DELETE FROM cards WHERE id = '1995-206-1995-stadium-club-virtual-reality-m' AND owned = 0;
DELETE FROM cards WHERE id = '1995-213-1995-topps-stadium-club-first-day-i' AND owned = 0;
DELETE FROM cards WHERE id = '1995-65-1995-upper-deck-electric-diamond-go' AND owned = 0;
DELETE FROM cards WHERE id = '1995-257-1995-upper-deck-special-edition-gol' AND owned = 0;
DELETE FROM cards WHERE id = '1996-89-1996-bowman-s-best-atomic-refractor' AND owned = 0;
DELETE FROM cards WHERE id = '1996-80-1996-collector-s-choice-gold-signat' AND owned = 0;
DELETE FROM cards WHERE id = '1996-80-1996-collector-s-choice-silver-sign' AND owned = 0;
DELETE FROM cards WHERE id = '1996-54-1996-leaf-preferred-steel-gold-prom' AND owned = 0;
DELETE FROM cards WHERE id = '1996-49-1996-leaf-signature-series-press-pr' AND owned = 0;
DELETE FROM cards WHERE id = '1996-52-1996-pinnacle-aficionado-artist-s-p' AND owned = 0;
DELETE FROM cards WHERE id = '1996-52-1996-pinnacle-aficionado-first-pitc' AND owned = 0;
DELETE FROM cards WHERE id = '1996-143-1996-pinnacle-starburst-artist-s-pr' AND owned = 0;
DELETE FROM cards WHERE id = '1996-191-1996-pinnacle-starburst-artist-s-pr' AND owned = 0;
DELETE FROM cards WHERE id = '1996-145-1996-pinnacle-summit-above-and-beyo' AND owned = 0;
DELETE FROM cards WHERE id = '1996-145-1996-pinnacle-summit-artist-s-proof' AND owned = 0;
DELETE FROM cards WHERE id = '1996-145-1996-pinnacle-summit-silver-foilboa' AND owned = 0;
DELETE FROM cards WHERE id = '1996-18-1996-score-dugout-collection-96-s' AND owned = 0;
DELETE FROM cards WHERE id = '1996-18-1996-score-dugout-collection-96-ar' AND owned = 0;
DELETE FROM cards WHERE id = '1996-94-1996-select-certified-artist-s-proo' AND owned = 0;
DELETE FROM cards WHERE id = '1996-94-1996-select-certified-certified-blu' AND owned = 0;
DELETE FROM cards WHERE id = '1996-nno-1996-stadium-club-extreme-players-b' AND owned = 0;
DELETE FROM cards WHERE id = '1996-nno-1996-stadium-club-extreme-players-g' AND owned = 0;
DELETE FROM cards WHERE id = '1996-nno-1996-stadium-club-extreme-players-s' AND owned = 0;
DELETE FROM cards WHERE id = '1996-11-1996-ultra-prime-leather-gold-medal' AND owned = 0;
DELETE FROM cards WHERE id = '1997-84-1997-donruss-preferred-cut-to-the-c' AND owned = 0;
DELETE FROM cards WHERE id = '1997-172-1997-flair-showcase-legacy-collecti' AND owned = 0;
DELETE FROM cards WHERE id = '1997-250-1997-pacific-crown-collection-silve' AND owned = 0;
DELETE FROM cards WHERE id = '1997-84-1997-pacific-prism-invincible-plati' AND owned = 0;
DELETE FROM cards WHERE id = '1997-179-1997-score-artist-s-proofs-white-bo' AND owned = 0;
DELETE FROM cards WHERE id = '1997-96-1997-sports-illustrated-extra-editi' AND owned = 0;
DELETE FROM cards WHERE id = '1997-pl10-1997-stadium-club-patent-leather-me' AND owned = 0;
DELETE FROM cards WHERE id = '1998-30-1998-bowman-s-best-atomic-refractor' AND owned = 0;
DELETE FROM cards WHERE id = '1998-58-1998-donruss-preferred-preferred-se' AND owned = 0;
DELETE FROM cards WHERE id = '1998-113-1998-flair-showcase-legacy-collecti' AND owned = 0;
DELETE FROM cards WHERE id = '1998-83-1998-pacific-invincible-platinum-bl' AND owned = 0;
DELETE FROM cards WHERE id = '1998-45-1998-pinnacle-inside-diamond-editio' AND owned = 0;
DELETE FROM cards WHERE id = '1998-59-1998-pinnacle-performers-peak-perfo' AND owned = 0;
DELETE FROM cards WHERE id = '1998-9-1998-skybox-dugout-axcess-inside-ax' AND owned = 0;
DELETE FROM cards WHERE id = '1998-92-1998-topps-gold-label-class-1-red-l' AND owned = 0;
DELETE FROM cards WHERE id = '1998-92-1998-topps-gold-label-class-2-red-l' AND owned = 0;
DELETE FROM cards WHERE id = '1998-ilm19-1998-topps-interleague-match-up-mys' AND owned = 0;
DELETE FROM cards WHERE id = '1998-24-1998-upper-deck-10th-anniversary-pr' AND owned = 0;
DELETE FROM cards WHERE id = '1998-g18-1998-upper-deck-retro-groovy-kind-o' AND owned = 0;
DELETE FROM cards WHERE id = '1999-61-1999-bowman-s-best-atomic-refractor' AND owned = 0;
DELETE FROM cards WHERE id = '1999-27-1999-pacific-crown-royale-limited-s' AND owned = 0;
DELETE FROM cards WHERE id = '1999-27-1999-pacific-crown-royale-opening-d' AND owned = 0;
DELETE FROM cards WHERE id = '1999-28-1999-pacific-revolution-shadow-seri' AND owned = 0;
DELETE FROM cards WHERE id = '1999-47-1999-skybox-e-x-century-essential-c' AND owned = 0;
DELETE FROM cards WHERE id = '1999-t8b-1999-stadium-club-triumvirate-illum' AND owned = 0;
DELETE FROM cards WHERE id = '1999-t8b-1999-stadium-club-triumvirate-lumin' AND owned = 0;
DELETE FROM cards WHERE id = '1999-7-1999-upper-deck-ovation-standing-ov' AND owned = 0;
DELETE FROM cards WHERE id = '1999-25-1999-upper-deck-ultimate-victory-ul' AND owned = 0;
DELETE FROM cards WHERE id = '2000-48-2000-pacific-crown-collection-holog' AND owned = 0;
DELETE FROM cards WHERE id = '2000-43-2000-pacific-paramount-premiere-dat' AND owned = 0;
DELETE FROM cards WHERE id = '2000-57-2000-pacific-vanguard-holographic-g' AND owned = 0;
DELETE FROM cards WHERE id = '2000-43-2000-skybox-e-x-essential-credentia' AND owned = 0;
DELETE FROM cards WHERE id = '2001-rr23-2001-donruss-rookie-reprints-unsign' AND owned = 0;
DELETE FROM cards WHERE id = '2001-38-2001-donruss-studio-chicago-sun-tim' AND owned = 0;
DELETE FROM cards WHERE id = '2001-nno-2001-fleer-e-x-behind-the-numbers-g' AND owned = 0;
DELETE FROM cards WHERE id = '2001-96-2001-fleer-e-x-essential-credential' AND owned = 0;
DELETE FROM cards WHERE id = '2001-fg-110-2001-leaf-certified-materials-fabri' AND owned = 0;
DELETE FROM cards WHERE id = '2001-23-2001-pacific-private-stock-gold-por' AND owned = 0;
DELETE FROM cards WHERE id = '2001-23-2001-pacific-private-stock-silver-p' AND owned = 0;
DELETE FROM cards WHERE id = '2001-od-43-2001-playoff-absolute-memorabilia-h' AND owned = 0;
DELETE FROM cards WHERE id = '2001-mg-2001-sp-game-bat-edition-piece-of-t' AND owned = 0;
DELETE FROM cards WHERE id = '2001-gg-mg-2001-upper-deck-gold-glove-game-jer' AND owned = 0;
DELETE FROM cards WHERE id = '2001-60-2001-upper-deck-gold-glove-gold-glo' AND owned = 0;
DELETE FROM cards WHERE id = '2002-79-2002-donruss-diamond-kings-bronze-f' AND owned = 0;
DELETE FROM cards WHERE id = '2002-12-2002-fleer-focus-jersey-edition-cen' AND owned = 0;
DELETE FROM cards WHERE id = '2002-nno-2002-fleer-platinum-cornerstones-u' AND owned = 0;
DELETE FROM cards WHERE id = '2002-57-2002-fleer-triple-crown-batting-ave' AND owned = 0;
DELETE FROM cards WHERE id = '2002-57-2002-fleer-triple-crown-rbi-paralle' AND owned = 0;
DELETE FROM cards WHERE id = '2002-tt-71-2002-playoff-absolute-memorabilia-t' AND owned = 0;
DELETE FROM cards WHERE id = '2002-pog-56-2002-playoff-piece-of-the-game-mate' AND owned = 0;
DELETE FROM cards WHERE id = '2002-tr-mg-2002-topps-206-framed-relics-serie' AND owned = 0;
DELETE FROM cards WHERE id = '2002-sl-mg-2002-ud-authentics-stars-of-89-jer' AND owned = 0;
DELETE FROM cards WHERE id = '2002-645-2002-upper-deck-40-man-electric-rai' AND owned = 0;
DELETE FROM cards WHERE id = '2002-4-2002-upper-deck-pepsi-arizona-diamond' AND owned = 0;
DELETE FROM cards WHERE id = '2002-h16-2002-upper-deck-piece-of-history-hi' AND owned = 0;
DELETE FROM cards WHERE id = '2002-s-mg-2002-upper-deck-vintage-special-col' AND owned = 0;
DELETE FROM cards WHERE id = '2003-dc-mg-2003-bowman-heritage-diamond-cuts-r' AND owned = 0;
DELETE FROM cards WHERE id = '2003-77-2003-donruss-diamond-kings-framed-b' AND owned = 0;
DELETE FROM cards WHERE id = '2003-77-2003-donruss-diamond-kings-framed-g' AND owned = 0;
DELETE FROM cards WHERE id = '2003-77-2003-donruss-diamond-kings-framed-w' AND owned = 0;
DELETE FROM cards WHERE id = '2003-tt-20-2003-donruss-signature-team-tradema' AND owned = 0;
DELETE FROM cards WHERE id = '2003-68-2003-fleer-focus-jersey-edition-cen' AND owned = 0;
DELETE FROM cards WHERE id = '2003-95-2003-playoff-prestige-xtra-points-p' AND owned = 0;
DELETE FROM cards WHERE id = '2003-tr-mg-2003-topps-205-framed-relics-serie' AND owned = 0;
DELETE FROM cards WHERE id = '2003-491-2003-upper-deck-40-man-red-white-an' AND owned = 0;
DELETE FROM cards WHERE id = '2003-4-2003-upper-deck-pepsi-arizona-diamond' AND owned = 0;
DELETE FROM cards WHERE id = '2004-tc-30-2004-donruss-classics-team-colors-b' AND owned = 0;
DELETE FROM cards WHERE id = '2004-152-2004-donruss-diamond-kings-bronze-s' AND owned = 0;
DELETE FROM cards WHERE id = '2004-152-2004-donruss-diamond-kings-dk-combo' AND owned = 0;
DELETE FROM cards WHERE id = '2004-152-2004-donruss-diamond-kings-framed-b' AND owned = 0;
DELETE FROM cards WHERE id = '2004-rn-17-2004-donruss-elite-extra-edition-ro' AND owned = 0;
DELETE FROM cards WHERE id = '2004-lel-27-2004-donruss-leather-lumber-leath' AND owned = 0;
DELETE FROM cards WHERE id = '2004-pp-8-2004-donruss-leather-lumber-penna' AND owned = 0;
DELETE FROM cards WHERE id = '2004-85-2004-donruss-team-heroes-showdown-b' AND owned = 0;

-- One row was truncated but had no twin: its name is corrected instead.
UPDATE cards SET set_name = '2000 Pacific Revolution Shadow Series' WHERE id = '2000-31-2000-pacific-revolution-shadow-seri';

-- Anything left behind was marked owned and needs a look:
SELECT id, set_name, card_num FROM cards WHERE id IN (
  '1989-291-1989-bowman-collector-s-edition-ti',
  '1989-17-1989-donruss-super-diamond-kings-5x',
  '1989-426-1989-fleer-collectors-edition-glos',
  '1989-3-1989-pacific-cards-comics-big-leagu',
  '1989-1-1989-pacific-cards-comics-crossed-b' /* …and the rest */ );
