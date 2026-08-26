-- Migration 003: record the card's brand (Topps, Donruss, Toys R Us, ...).
-- Run after migrate-002, before re-importing cards-insert.sql:
--   mysql -u ADMIN -p otbdesig_wp298 < migrate-003-brand.sql
-- Plain ALTER so it works on MySQL and MariaDB. Running twice reports
-- "Duplicate column name", which just means it is already applied.

ALTER TABLE cards
  ADD COLUMN brand      VARCHAR(48) DEFAULT NULL AFTER set_name,
  ADD COLUMN brand_slug VARCHAR(48) DEFAULT NULL AFTER brand;

ALTER TABLE cards ADD INDEX idx_brand (brand_slug);
