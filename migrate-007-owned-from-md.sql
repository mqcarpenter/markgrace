-- Migration 007 — ownership carried over from mark-grace-card-tracker.md.
--
-- The old markdown tracker marked 8 cards owned in its 1982-1988 range.
-- These are those 8. Marking a card owned is additive and reversible in
-- the app, so this is safe to run even where the flag is already set.
--
--   mysql -u ADMIN -p DBNAME < migrate-007-owned-from-md.sql
-- or paste into phpMyAdmin.

UPDATE cards SET owned = 1, acquired_at = COALESCE(acquired_at, NOW()) WHERE id = '1988-14-1988-cmc-iowa-cubs';  -- 1988 CMC Iowa Cubs #14
UPDATE cards SET owned = 1, acquired_at = COALESCE(acquired_at, NOW()) WHERE id = '1988-40-1988-donruss';  -- 1988 Donruss #40
UPDATE cards SET owned = 1, acquired_at = COALESCE(acquired_at, NOW()) WHERE id = '1988-1-1988-donruss-rookies-boxed-set';  -- 1988 Donruss The Rookies #1
UPDATE cards SET owned = 1, acquired_at = COALESCE(acquired_at, NOW()) WHERE id = '1988-641-1988-fleer';  -- 1988 Fleer #641
UPDATE cards SET owned = 1, acquired_at = COALESCE(acquired_at, NOW()) WHERE id = '1988-u-77-1988-fleer-update';  -- 1988 Fleer Update #U-77
UPDATE cards SET owned = 1, acquired_at = COALESCE(acquired_at, NOW()) WHERE id = '1988-nno-1988-peoria-chiefs';  -- 1988 Peoria Chiefs #NNO
UPDATE cards SET owned = 1, acquired_at = COALESCE(acquired_at, NOW()) WHERE id = '1988-80t-1988-score-rookie-traded';  -- 1988 Score Rookie & Traded #80T
UPDATE cards SET owned = 1, acquired_at = COALESCE(acquired_at, NOW()) WHERE id = '1988-42t-1988-topps-traded';  -- 1988 Topps Traded #42T

-- Check afterwards:
--   SELECT COUNT(*) FROM cards WHERE owned = 1;
