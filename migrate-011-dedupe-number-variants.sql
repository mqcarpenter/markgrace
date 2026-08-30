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
