-- Migration 011 — remove duplicate reference / phantom letter-suffix card rows.
--
-- These 63 rows represent TCDB checklist reference variations (e.g. #12a, #12b,
-- #40a-#40c, #255a-#255d) where the true base card already exists (and holds the
-- scans) or where malformed/chopped set rows generated phantom lettered numbers.
-- None of these 63 rows hold scans or are marked owned.
--
-- Needs DELETE. Run as admin:
--   mysql -u ADMIN -p DBNAME < migrate-011-dedupe-number-variants.sql

DELETE FROM cards WHERE id = '1988-40a-1988-donruss' AND owned = 0;
DELETE FROM cards WHERE id = '1988-40b-1988-donruss' AND owned = 0;
DELETE FROM cards WHERE id = '1988-40c-1988-donruss' AND owned = 0;
DELETE FROM cards WHERE id = '1988-11a-1988-rookies-commemorati' AND owned = 0;
DELETE FROM cards WHERE id = '1988-11b-1988-rookies-commemorati' AND owned = 0;
DELETE FROM cards WHERE id = '1989-255a-1989-donruss' AND owned = 0;
DELETE FROM cards WHERE id = '1989-255b-1989-donruss' AND owned = 0;
DELETE FROM cards WHERE id = '1989-255c-1989-donruss' AND owned = 0;
DELETE FROM cards WHERE id = '1989-255d-1989-donruss' AND owned = 0;
DELETE FROM cards WHERE id = '1989-12a-1989-holsum-schafer-s-super-stars-discs' AND owned = 0;
DELETE FROM cards WHERE id = '1989-12b-1989-holsum-schafer-s-super-stars-discs' AND owned = 0;
DELETE FROM cards WHERE id = '1989-12a-1989-holsum-super-stars-discs' AND owned = 0;
DELETE FROM cards WHERE id = '1989-12b-1989-holsum-super-stars-discs' AND owned = 0;
DELETE FROM cards WHERE id = '1989-12a-1989-j-j-nissen-super-stars' AND owned = 0;
DELETE FROM cards WHERE id = '1989-12b-1989-j-j-nissen-super-stars' AND owned = 0;
DELETE FROM cards WHERE id = '1989-210a-1989-o-pee-chee-stickers-50' AND owned = 0;
DELETE FROM cards WHERE id = '1989-210b-1989-o-pee-chee-stickers-50' AND owned = 0;
DELETE FROM cards WHERE id = '1989-210c-1989-o-pee-chee-stickers-50' AND owned = 0;
DELETE FROM cards WHERE id = '1989-12a-1989-rainier-farms-super-stars-discs' AND owned = 0;
DELETE FROM cards WHERE id = '1989-12b-1989-rainier-farms-super-stars-discs' AND owned = 0;
DELETE FROM cards WHERE id = '1989-210a-1989-topps-stickers-50' AND owned = 0;
DELETE FROM cards WHERE id = '1989-210b-1989-topps-stickers-50' AND owned = 0;
DELETE FROM cards WHERE id = '1989-210c-1989-topps-stickers-50' AND owned = 0;
DELETE FROM cards WHERE id = '1989-210d-1989-topps-stickers-50' AND owned = 0;
DELETE FROM cards WHERE id = '1990-577a-1990-donruss' AND owned = 0;
DELETE FROM cards WHERE id = '1990-577b-1990-donruss' AND owned = 0;
DELETE FROM cards WHERE id = '1990-577c-1990-donruss' AND owned = 0;
DELETE FROM cards WHERE id = '1990-32a-1990-fleer' AND owned = 0;
DELETE FROM cards WHERE id = '1990-32b-1990-fleer' AND owned = 0;
DELETE FROM cards WHERE id = '1990-19a-1990-topps-big' AND owned = 0;
DELETE FROM cards WHERE id = '1990-19b-1990-topps-big' AND owned = 0;
DELETE FROM cards WHERE id = '1990-128a-1990-upper-deck' AND owned = 0;
DELETE FROM cards WHERE id = '1990-128b-1990-upper-deck' AND owned = 0;
DELETE FROM cards WHERE id = '1991-199a-1991-donruss' AND owned = 0;
DELETE FROM cards WHERE id = '1991-199b-1991-donruss' AND owned = 0;
DELETE FROM cards WHERE id = '1991-199c-1991-donruss' AND owned = 0;
DELETE FROM cards WHERE id = '1991-422a-1991-fleer' AND owned = 0;
DELETE FROM cards WHERE id = '1991-422b-1991-fleer' AND owned = 0;
DELETE FROM cards WHERE id = '1991-290a-1991-stadium-club' AND owned = 0;
DELETE FROM cards WHERE id = '1991-290b-1991-stadium-club' AND owned = 0;
DELETE FROM cards WHERE id = '1991-134b-1991-upper-deck' AND owned = 0;
DELETE FROM cards WHERE id = '1991-134c-1991-upper-deck' AND owned = 0;
DELETE FROM cards WHERE id = '1991-99b-1991-upper-deck' AND owned = 0;
DELETE FROM cards WHERE id = '1992-281a-1992-donruss' AND owned = 0;
DELETE FROM cards WHERE id = '1992-281b-1992-donruss' AND owned = 0;
DELETE FROM cards WHERE id = '1992-381a-1992-fleer' AND owned = 0;
DELETE FROM cards WHERE id = '1992-381b-1992-fleer' AND owned = 0;
DELETE FROM cards WHERE id = '1992-26a-1992-leaf' AND owned = 0;
DELETE FROM cards WHERE id = '1992-26b-1992-leaf' AND owned = 0;
DELETE FROM cards WHERE id = '1992-174a-1992-stadium-club' AND owned = 0;
DELETE FROM cards WHERE id = '1992-174b-1992-stadium-club' AND owned = 0;
DELETE FROM cards WHERE id = '1992-4a-1992-topps-kids' AND owned = 0;
DELETE FROM cards WHERE id = '1992-4b-1992-topps-kids' AND owned = 0;
DELETE FROM cards WHERE id = '1994-360a-1994-topps' AND owned = 0;
DELETE FROM cards WHERE id = '1994-360b-1994-topps' AND owned = 0;
DELETE FROM cards WHERE id = '1994-33a-1994-topps-black-gold' AND owned = 0;
DELETE FROM cards WHERE id = '1994-33b-1994-topps-black-gold' AND owned = 0;
DELETE FROM cards WHERE id = '1996-216a-1996-flair' AND owned = 0;
DELETE FROM cards WHERE id = '1996-216b-1996-flair' AND owned = 0;
DELETE FROM cards WHERE id = '1998-59b-1998-collector-s-choice' AND owned = 0;
DELETE FROM cards WHERE id = '2002-115b-2002-leaf-rookies-stars' AND owned = 0;
DELETE FROM cards WHERE id = '2002-115a-2002-leaf-rookies-stars-longevity' AND owned = 0;
DELETE FROM cards WHERE id = '2002-pog-56b-2002-playoff-piece-of-the-game-mate' AND owned = 0;
DELETE FROM cards WHERE id = '1988-4-1988-san-diego-state-university-50th-anniversary' AND owned = 0;
DELETE FROM cards WHERE id = '1988-3-1988-gray-star-wrigley-field-series-2-unlicensed' AND owned = 0;

-- Corrupted PDF / chopped dual-player remnants:
DELETE FROM cards WHERE id = '1990-1990-star-will-clark' AND owned = 0;
DELETE FROM cards WHERE id = '1997-1997-donruss-limited-71-darin-erstad' AND owned = 0;
DELETE FROM cards WHERE id = '1997-1997-donruss-limited-limited-exposu-71-darin-erstad' AND owned = 0;
DELETE FROM cards WHERE id = '1998-1998-pacific-invincible-team-checkl-5-sammy-sosa' AND owned = 0;
DELETE FROM cards WHERE id = '1998-1998-pacific-team-checklists-16-sammy-sosa' AND owned = 0;
DELETE FROM cards WHERE id = '2000-2000-topps-gold-label-bullion-b7-sammy-sosa' AND owned = 0;
DELETE FROM cards WHERE id = '2000-2000-topps-gold-label-bullion-one-t-b7-sammy-sosa' AND owned = 0;
DELETE FROM cards WHERE id = '2000-2000-upper-deck-victory-90-sammy-sosa' AND owned = 0;
DELETE FROM cards WHERE id = '2002-2002-fleer-platinum-cornerstones-n-40-cs-john-olerud' AND owned = 0;
DELETE FROM cards WHERE id = '2002-2002-fleer-platinum-cornerstones-u-nno-john-olerud' AND owned = 0;
DELETE FROM cards WHERE id = '2002-2002-fleer-platinum-cornerstones-me-nno-john-olerud' AND owned = 0;
DELETE FROM cards WHERE id = '2003-2003-donruss-elite-throwback-thread-tt-67-sammy-sosa' AND owned = 0;
DELETE FROM cards WHERE id = '2004-2004-donruss-diamond-kings-team-tim-tt-8-andre-dawson' AND owned = 0;
DELETE FROM cards WHERE id = '2004-2004-donruss-world-series-signature-4-steve-finley' AND owned = 0;
DELETE FROM cards WHERE id = '1989-10-1989-champ' AND owned = 0;
DELETE FROM cards WHERE id = '1989-3-1989-champ' AND owned = 0;
DELETE FROM cards WHERE id = '1989-9-1989-pacific-cards-comics-signature' AND owned = 0;
DELETE FROM cards WHERE id = '1998-141-1998-pacific-online-web-cards-gold' AND owned = 0;
DELETE FROM cards WHERE id = '2002-cs-2002-fleer-platinum-cornerstones-n-24' AND owned = 0;

-- Fix unclosed parenthesis syntax on 1995 Topps CyberStats:
UPDATE cards SET set_name = '1995 Topps CyberStats (Spectralight)' WHERE id = '1995-061-1995-topps-cyberstats-spectralight';
DELETE FROM cards WHERE id = '1989-29-1989-all-star-set-collec' AND owned = 0;
DELETE FROM cards WHERE id = '1990-12-1990-all-star-set-collec' AND owned = 0;

-- Chopped duplicate entries cleanup
DELETE FROM cards WHERE id = '1998-174-1998-99-donruss-crusade-test-issue-red' AND owned = 0;
DELETE FROM cards WHERE id = '1999-53-1999-retro-mar' AND owned = 0;
DELETE FROM cards WHERE id = '1999-53-1999-retro-stat-line-s' AND owned = 0;
DELETE FROM cards WHERE id = '2000-241-2000-fleer-tradition-glossy-hawaii' AND owned = 0;
DELETE FROM cards WHERE id = '2000-24-2000-retro-mar' AND owned = 0;
DELETE FROM cards WHERE id = '2000-24-2000-retro-stat-line-s' AND owned = 0;
DELETE FROM cards WHERE id = '2001-97-2001-donruss-signature-hawaii-trade' AND owned = 0;
DELETE FROM cards WHERE id = '2002-079-2002-donruss-diamond-kings-2002-hawaii-trade-conference-framed-blue' AND owned = 0;

-- Truncated generic sample/convention duplicate cleanup
DELETE FROM cards WHERE id = '2002-44-2002-donruss-elite-beckett-samples' AND owned = 0;
DELETE FROM cards WHERE id = '2002-44-2002-donruss-elite-national-sports' AND owned = 0;
DELETE FROM cards WHERE id = '2002-44-2002-donruss-studio-beckett-samples' AND owned = 0;
DELETE FROM cards WHERE id = '2002-44-2002-donruss-studio-national-sports' AND owned = 0;
DELETE FROM cards WHERE id = '2003-85-2003-donruss-elite-national-sports' AND owned = 0;
DELETE FROM cards WHERE id = '2003-99-2003-donruss-studio-beckett-samples' AND owned = 0;
DELETE FROM cards WHERE id = '2003-99-2003-donruss-studio-national-sports' AND owned = 0;

-- 2001 chopped twin duplicate cleanup
DELETE FROM cards WHERE id = '2001-39-2001-march-20' AND owned = 0;
DELETE FROM cards WHERE id = '2001-97-2001-donruss-signature-chicago-sun' AND owned = 0;

-- 2004 Diamond Kings truncated duplicate cleanup
DELETE FROM cards WHERE id = '2004-152-2004-donruss-diamond-kings-dk-mater' AND owned = 0;
DELETE FROM cards WHERE id = '2004-152-2004-donruss-diamond-kings-dk-signa' AND owned = 0;
DELETE FROM cards WHERE id = '2004-63-2004-donruss-diamond-kings-dk-signa' AND owned = 0;
DELETE FROM cards WHERE id = '2004-63-2004-donruss-diamond-kings-framed-b' AND owned = 0;
DELETE FROM cards WHERE id = '2004-152-2004-donruss-diamond-kings-framed-g' AND owned = 0;
DELETE FROM cards WHERE id = '2004-63-2004-donruss-diamond-kings-framed-g' AND owned = 0;
DELETE FROM cards WHERE id = '2004-152-2004-donruss-diamond-kings-framed-p' AND owned = 0;
DELETE FROM cards WHERE id = '2004-63-2004-donruss-diamond-kings-framed-p' AND owned = 0;
DELETE FROM cards WHERE id = '2004-152-2004-donruss-diamond-kings-framed-s' AND owned = 0;
DELETE FROM cards WHERE id = '2004-63-2004-donruss-diamond-kings-framed-s' AND owned = 0;
DELETE FROM cards WHERE id = '2004-152-2004-donruss-diamond-kings-hawaii-t' AND owned = 0;
DELETE FROM cards WHERE id = '2004-63-2004-donruss-diamond-kings-hawaii-t' AND owned = 0;
DELETE FROM cards WHERE id = '2004-77-2004-donruss-diamond-kings-recollec' AND owned = 0;
DELETE FROM cards WHERE id = '2004-79-2004-donruss-diamond-kings-recollec' AND owned = 0;
DELETE FROM cards WHERE id = '2004-152-2004-donruss-diamond-kings-silver-s' AND owned = 0;
DELETE FROM cards WHERE id = '2004-152-2004-donruss-diamond-kings-bronze' AND owned = 0;
DELETE FROM cards WHERE id = '2004-hc-25-2004-donruss-diamond-kings-heritage' AND owned = 0;

-- 1999 chopped duplicate cleanup
DELETE FROM cards WHERE id = '1999-144-1999-metal-universe-precious-metal' AND owned = 0;
DELETE FROM cards WHERE id = '1999-28-1999-pacific-revolution-premiere-da' AND owned = 0;
DELETE FROM cards WHERE id = '1999-61-1999-topps-gallery-player-s-private' AND owned = 0;
DELETE FROM cards WHERE id = '1999-61-1999-topps-gallery-press-plates-bla' AND owned = 0;
DELETE FROM cards WHERE id = '1999-61-1999-topps-gallery-press-plates-cya' AND owned = 0;
DELETE FROM cards WHERE id = '1999-61-1999-topps-gallery-press-plates-mag' AND owned = 0;
DELETE FROM cards WHERE id = '1999-61-1999-topps-gallery-press-plates-yel' AND owned = 0;
DELETE FROM cards WHERE id = '1999-3-1999-topps-gold-label-class-1-one-t' AND owned = 0;
DELETE FROM cards WHERE id = '1999-3-1999-topps-gold-label-class-1-red-o' AND owned = 0;
DELETE FROM cards WHERE id = '1999-3-1999-topps-gold-label-class-2-one-t' AND owned = 0;
DELETE FROM cards WHERE id = '1999-3-1999-topps-gold-label-class-2-red-o' AND owned = 0;
DELETE FROM cards WHERE id = '1999-3-1999-topps-gold-label-class-3-one-t' AND owned = 0;
DELETE FROM cards WHERE id = '1999-3-1999-topps-gold-label-class-3-red-o' AND owned = 0;

-- 2000 chopped duplicate cleanup
DELETE FROM cards WHERE id = '2000-61-2000-essential-crede' AND owned = 0;
DELETE FROM cards WHERE id = '2000-64-2000-fleer-focus-masterpiece' AND owned = 0;
DELETE FROM cards WHERE id = '2000-48-2000-pacific-crown-collection-plati' AND owned = 0;
DELETE FROM cards WHERE id = '2000-48-2000-pacific-crown-collection-premi' AND owned = 0;
DELETE FROM cards WHERE id = '2000-28-2000-pacific-invincible-platinum-bl' AND owned = 0;
DELETE FROM cards WHERE id = '2000-43-2000-pacific-paramount-platinum-blu' AND owned = 0;
DELETE FROM cards WHERE id = '2000-22-2000-pacific-private-stock-gold-por' AND owned = 0;
DELETE FROM cards WHERE id = '2000-22-2000-pacific-private-stock-silver-p' AND owned = 0;
DELETE FROM cards WHERE id = '2000-31-2000-pacific-revolution-premiere-da' AND owned = 0;
DELETE FROM cards WHERE id = '2000-57-2000-pacific-vanguard-holographic-p' AND owned = 0;

-- 1997-1998 chopped duplicate cleanup
DELETE FROM cards WHERE id = '1997-66-1997-donruss-limited-fabric-of-the' AND owned = 0;
DELETE FROM cards WHERE id = '1997-250-1997-pacific-crown-collection-light' AND owned = 0;
DELETE FROM cards WHERE id = '1997-96-1997-pinnacle-inside-diamond-editio' AND owned = 0;
DELETE FROM cards WHERE id = '1997-106-1997-pinnacle-pre' AND owned = 0;
DELETE FROM cards WHERE id = '1998-60-1998-donruss-crusade-red-executive' AND owned = 0;
DELETE FROM cards WHERE id = '1998-70-1998-donruss-collections-donruss-pr-pc' AND owned = 0;
DELETE FROM cards WHERE id = '1998-466-1998-donruss-collections-elite-priz-pc' AND owned = 0;
DELETE FROM cards WHERE id = '1998-296-1998-donruss-collections-leaf-prize-pc' AND owned = 0;
DELETE FROM cards WHERE id = '1998-608-1998-donruss-collections-preferred-pc' AND owned = 0;
