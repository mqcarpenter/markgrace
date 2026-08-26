-- Mark Grace Card Tracker — MySQL schema
-- Run once:  mysql -u USER -p DBNAME < schema.sql

CREATE TABLE IF NOT EXISTS cards (
  id           VARCHAR(191) NOT NULL PRIMARY KEY,
  year         SMALLINT     NOT NULL,
  section      VARCHAR(191) NOT NULL,
  card_num     VARCHAR(64)  NOT NULL,
  set_name     VARCHAR(255) NOT NULL,
  variant      VARCHAR(160) DEFAULT NULL,
  brand        VARCHAR(48)  DEFAULT NULL,
  brand_slug   VARCHAR(48)  DEFAULT NULL,
  image        VARCHAR(255) DEFAULT NULL,
  is_auto      TINYINT(1)   NOT NULL DEFAULT 0,
  is_relic     TINYINT(1)   NOT NULL DEFAULT 0,
  is_parallel  TINYINT(1)   NOT NULL DEFAULT 0,
  is_insert    TINYINT(1)   NOT NULL DEFAULT 0,
  tags         VARCHAR(120) DEFAULT NULL,
  owned        TINYINT(1)   NOT NULL DEFAULT 0,
  acquired_at  DATETIME     DEFAULT NULL,
  note         TEXT         DEFAULT NULL,
  sort_order   INT          NOT NULL DEFAULT 0,
  updated_at   TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY idx_year  (year),
  KEY idx_brand (brand_slug),
  KEY idx_auto  (is_auto),
  KEY idx_relic (is_relic),
  KEY idx_owned (owned)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
