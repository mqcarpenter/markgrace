-- Mark Grace Card Tracker — MySQL schema
-- Run once:  mysql -u USER -p DBNAME < schema.sql

CREATE TABLE IF NOT EXISTS cards (
  id           VARCHAR(191) NOT NULL PRIMARY KEY,
  year         SMALLINT     NOT NULL,
  section      VARCHAR(191) NOT NULL,
  card_num     VARCHAR(64)  NOT NULL,
  set_name     VARCHAR(255) NOT NULL,
  image        VARCHAR(255) DEFAULT NULL,
  owned        TINYINT(1)   NOT NULL DEFAULT 0,
  acquired_at  DATETIME     DEFAULT NULL,
  note         TEXT         DEFAULT NULL,
  sort_order   INT          NOT NULL DEFAULT 0,
  updated_at   TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY idx_year  (year),
  KEY idx_owned (owned)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
