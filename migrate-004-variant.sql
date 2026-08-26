-- Migration 004: keep the variant separate from the base set name.
-- TCDB writes "Base Set - Variant"; splitting them makes it obvious at a
-- glance whether a row is the base card or a parallel/subset.
--   mysql -u ADMIN -p otbdesig_wp298 < migrate-004-variant.sql
-- Plain ALTER: "Duplicate column name" just means it is already applied.

ALTER TABLE cards ADD COLUMN variant VARCHAR(160) DEFAULT NULL AFTER set_name;
