-- Migration 012 — attach newly recovered card scans to existing catalog rows.
--
-- 11 cards that were previously missing scans now have front/back images attached.
-- This migration updates only image and image_back and never touches owned, acquired_at, or notes.
--
-- Run as admin:
--   mysql -u ADMIN -p DBNAME < migrate-012-update-new-scans.sql

UPDATE cards SET image = '2004_Donruss-Diamond-Kings-Heritage_HC-25-Fr.jpg' WHERE id = '2004-hc-25-2004-donruss-diamond-kings-heritage';
UPDATE cards SET image = '2004_Donruss-Elite-Throwback-Thread_TT-40-Fr.jpg' WHERE id = '2004-tt-40-2004-donruss-elite-throwback-thread';
UPDATE cards SET image = '2004_Donruss-Team-Heroes-Showdown-S_85-Fr.jpg' WHERE id = '2004-85-2004-donruss-team-heroes-showdown-s';
UPDATE cards SET image = '2005_Donruss-Diamond-Kings-DK-Challenge_427-Fr.jpg' WHERE id = '2005-427-2005-donruss-diamond-kings';
UPDATE cards SET image = '2006_Fleer-Greats-of-the-Game_64-Fr.jpg' WHERE id = '2006-64-2006-fleer-greats-of-the-game';
UPDATE cards SET image = '2007_Arizona-Diamondbacks-Hometown-Tour_NNO-Fr.jpg' WHERE id = '2007-nno-2007-arizona-diamondbacks-hometown-tour';
UPDATE cards SET image = '2013_Panini-Hometown-Heroes-Zip-Code_271-Fr.jpg' WHERE id = '2013-271-2013-panini-hometown-heroes';
UPDATE cards SET image = '1998_Zenith-Oversized-Gold-Impulse-5x7_Z32-Fr.jpg', image_back = '1998_Zenith-Oversized-Gold-Impulse-5x7_Z32-Bk.jpg' WHERE id = '1998-z32-1998-zenith-oversized-gold-impulse';
UPDATE cards SET image = '1998_Topps-Gold-Label-Class-1-Black-Label_92-Fr.jpg', image_back = '1998_Topps-Gold-Label-Class-1-Black-Label_92-Bk.jpg' WHERE id = '1998-92-1998-topps-gold-label-class-1-black';
UPDATE cards SET image = '1998_Topps-Gold-Label-Class-2-Black-Label_92-Fr.jpg', image_back = '1998_Topps-Gold-Label-Class-2-Black-Label_92-Bk.jpg' WHERE id = '1998-92-1998-topps-gold-label-class-2-black';
UPDATE cards SET image = '1998_Topps-Gold-Label-Class-3-Black-Label_92-Fr.jpg', image_back = '1998_Topps-Gold-Label-Class-3-Black-Label_92-Bk.jpg' WHERE id = '1998-92-1998-topps-gold-label-class-3-black';
UPDATE cards SET image = '1999_Topps-Gold-Label-Class-1-Black_3-Fr.jpg', image_back = '1999_Topps-Gold-Label-Class-1-Black_3-Bk.jpg' WHERE id = '1999-3-1999-topps-gold-label-class-1-black';
UPDATE cards SET image = '1999_Topps-Tek-Pattern-19_26B-Fr.jpg' WHERE id = '1999-26b-1999-topps-tek-pattern-19';
UPDATE cards SET image = '1997_Crown-Pro-Stickers-Chicago-Cubs_7-Fr.jpg' WHERE id = '1997-7-1997-crown-pro-stickers-chicago-cubs';
