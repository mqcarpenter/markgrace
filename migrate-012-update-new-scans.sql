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
UPDATE cards SET image = '1996-07_Danbury-Mint-22KT-Gold_110-Fr.jpg' WHERE id = '1996-110-1996-07-danbury-mint-22kt-gold';
UPDATE cards SET image = '1997_Bowman\'s-Best-Atomic-Refractors_16-Fr.jpg' WHERE id = '1997-16-1997-bowman-s-best-atomic-refractors';
UPDATE cards SET image = '1997_Donruss-Press-Proofs-Gold_120-Fr.jpg' WHERE id = '1997-120-1997-donruss-press-proofs-gold';
UPDATE cards SET image = '1999_Ultra-Gold-Medallion_161G-Fr.jpg', image_back = '1999_Ultra-Gold-Medallion_161G-Bk.jpg' WHERE id = '1999-161g-1999-ultra-gold-medallion';
UPDATE cards SET image = '2015_Topps-Archives-Fan-Favorites-Autographs-Gold_FFA-MGR-Fr.jpg' WHERE id = '2015-ffa-mgr-2015-topps-archives-fan-favorites-autographs-gold';
UPDATE cards SET image = '2015_Topps-Five-Star_FSA-MG-Fr.jpg' WHERE id = '2015-fsa-mg-2015-topps-five-star';
UPDATE cards SET image = '2015_Topps-Five-Star-Emerald_FSA-MG-Fr.jpg' WHERE id = '2015-fsa-mg-2015-topps-five-star-emerald';
UPDATE cards SET image = '2015_Donruss-Signature-Series-Blue_75-Fr.jpg', image_back = '2015_Donruss-Signature-Series-Blue_75-Bk.jpg' WHERE id = '2015-75-2015-donruss-signature-series-blue';
UPDATE cards SET image = '1998_Studio-Studio-Proofs_40-Fr.jpg' WHERE id = '1998-40-1998-studio-studio-proofs';
UPDATE cards SET image = '1998_Pacific-Invincible-Gems-of-the-Diamond_130-Fr.jpg' WHERE id = '1998-130-1998-pacific-invincible-gems-of-the';
UPDATE cards SET image = '1999_Pacific-Omega-Gold_47-Fr.jpg' WHERE id = '1999-47-1999-pacific-omega-gold';
UPDATE cards SET image = '1996_Topps-Chrome-Refractors_20-Fr.jpg' WHERE id = '1996-20-1996-topps-chrome-refractors';
UPDATE cards SET image = '1997_Bowman-Chrome-Refractors_64-Fr.jpg' WHERE id = '1997-64-1997-bowman-chrome-refractors';
UPDATE cards SET image = '1998_Donruss-Elite-Aspirations_66-Fr.jpg' WHERE id = '1998-66-1998-donruss-elite-aspirations';
UPDATE cards SET image = '2001_Donruss-Elite-Aspirations_38-Fr.jpg' WHERE id = '2001-38-2001-donruss-elite-aspirations';
UPDATE cards SET image = '2003_Donruss-Signature-Autographs_6-Fr.jpg' WHERE id = '2003-6-2003-donruss-signature-autographs';
UPDATE cards SET image = '2014_Panini-Elite-Extra-Edition-Historic-Picks-Signatures_8-Fr.jpg', image_back = '2014_Panini-Elite-Extra-Edition-Historic-Picks-Signatures_8-Bk.jpg' WHERE id = '2014-8-2014-panini-elite-extra-edition-historic-picks-signatures';
UPDATE cards SET image = '2014_Panini-Immaculate-Collection-Immaculate-Autograph-Materials-Prime_9-Fr.jpg', image_back = '2014_Panini-Immaculate-Collection-Immaculate-Autograph-Materials-Prime_9-Bk.jpg' WHERE id = '2014-9-2014-panini-immaculate-collection-immaculate-autograph-materials-prime';
UPDATE cards SET image = '2005_Donruss-Champions-Impressions-Blue_336-Fr.jpg' WHERE id = '2005-336-2005-donruss-champions-impressions-blue';
UPDATE cards SET image = '2005_Playoff-Absolute-Memorabilia-Heroes_AH-60-Fr.jpg' WHERE id = '2005-ah-60-2005-playoff-absolute-memorabilia-heroes';
UPDATE cards SET image = '2006_Fleer-Greats-of-the-Game-Autographs_64-Fr.jpg' WHERE id = '2006-64-2006-fleer-greats-of-the-game-autographs';
UPDATE cards SET image = '2007_Upper-Deck-Sweet-Spot-Classic-Classic-Memorabilia_17-Fr.jpg' WHERE id = '2007-17-2007-upper-deck-sweet-spot-classic-classic-memorabilia';
UPDATE cards SET image = '2008_SP-Legendary-Cuts-Legendary-Memorabilia-Blue_LM-MG-Fr.jpg' WHERE id = '2008-lm-mg-2008-sp-legendary-cuts-legendary-memorabilia-blue';
UPDATE cards SET image = '2009_SP-Legendary-Cuts-Legendary-Memorabilia-Brown_LM-MG-Fr.jpg' WHERE id = '2009-lm-mg-2009-sp-legendary-cuts-legendary-memorabilia-brown';
UPDATE cards SET image = '1999_Bowman''s-Best-Refractors_61-Fr.jpg' WHERE id = '1999-61-1999-bowman-s-best-refractors';
UPDATE cards SET image = '2000_Fleer-Mystique-Gold_6-Fr.jpg' WHERE id = '2000-6-2000-fleer-mystique-gold';
UPDATE cards SET image = '1997_Topps-Chrome-Refractors_13-Fr.jpg' WHERE id = '1997-13-1997-topps-chrome-refractors';
UPDATE cards SET image = '1997_Donruss-Signature-Series-Platinum-Press-Proofs_42-Fr.jpg' WHERE id = '1997-42-1997-donruss-signature-series-platinum-press-proofs';
UPDATE cards SET image = '1996_Leaf-Press-Proofs-Gold_126-Fr.jpg' WHERE id = '1996-126-1996-leaf-press-proofs-gold';
UPDATE cards SET image = '1990_Old-Style-Chicago-Cubs-Photocards_NNO-Fr.jpg' WHERE id = '1990-nno-1990-old-style-chicago-cubs-photocards';
UPDATE cards SET image = '2001_Topps-Chrome-Retrofractors_251-Fr.jpg' WHERE id = '2001-251-2001-topps-chrome-retrofractors';
UPDATE cards SET image = '2014_Panini-Classics-Significant-Signatures-Jerseys-Gold-Prime_51-Fr.jpg' WHERE id = '2014-51-2014-panini-classics-significant-signatures-jerseys-gold-prime';
UPDATE cards SET image = '1990_Star-Platinum-Promos_NNO-Fr.jpg' WHERE id = '1990-nno-1990-star-platinum-promos';
UPDATE cards SET image = '1996_Leaf-Preferred-Steel-Bronze-Promos_54-Fr.jpg' WHERE id = '1996-54-1996-leaf-preferred-steel-bronze-promos';
UPDATE cards SET image = '1996_Select-Certified-Mirror-Blue_94-Fr.jpg' WHERE id = '1996-94-1996-select-certified-mirror-blue';
