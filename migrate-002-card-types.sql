-- Migration 002: flag card types (autograph, relic, parallel, insert).
-- Run ONCE, as an admin account, BEFORE importing cards-insert.sql:
--   mysql -u ADMIN -p otbdesig_wp298 < migrate-002-card-types.sql
--
-- Adds columns only. Existing rows and their `owned` flags are untouched.
-- Deliberately plain ALTER syntax so it works on both MySQL and MariaDB.
-- Running it twice is harmless: you'll get "Duplicate column name", which
-- means the migration is already applied.

ALTER TABLE cards
  ADD COLUMN is_auto     TINYINT(1)   NOT NULL DEFAULT 0 AFTER image,
  ADD COLUMN is_relic    TINYINT(1)   NOT NULL DEFAULT 0 AFTER is_auto,
  ADD COLUMN is_parallel TINYINT(1)   NOT NULL DEFAULT 0 AFTER is_relic,
  ADD COLUMN is_insert   TINYINT(1)   NOT NULL DEFAULT 0 AFTER is_parallel,
  ADD COLUMN tags        VARCHAR(120) DEFAULT NULL       AFTER is_insert;

ALTER TABLE cards ADD INDEX idx_auto  (is_auto);
ALTER TABLE cards ADD INDEX idx_relic (is_relic);

-- The app account already holds SELECT on this table, so it can read the new
-- columns with no grant change. It still cannot write them: its UPDATE grant
-- covers only owned, acquired_at and note.
