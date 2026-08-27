-- Migration 005
--   1. image_back — the reverse scan, shown when a binder card is flipped.
--   2. devices    — registered passkeys. Writing to `owned` requires one.
--
--   mysql -u ADMIN -p DBNAME < migrate-005-backs-and-devices.sql
--
-- Safe to re-run: both statements are guarded, so a second run is a no-op.

-- ---------------------------------------------------------------------
-- Card backs
-- ---------------------------------------------------------------------
-- MySQL has no ADD COLUMN IF NOT EXISTS before 8.0.29, so check first.
SET @sql := IF(
  (SELECT COUNT(*) FROM information_schema.COLUMNS
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME   = 'cards'
      AND COLUMN_NAME  = 'image_back') > 0,
  'SELECT "cards.image_back already present" AS note',
  'ALTER TABLE cards ADD COLUMN image_back VARCHAR(255) DEFAULT NULL AFTER image');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ---------------------------------------------------------------------
-- Registered devices (WebAuthn passkeys)
-- ---------------------------------------------------------------------
-- One row per registered device. `public_key` is a PEM public key — it is
-- not a secret, and it cannot be used to forge an assertion; only the
-- private half, which never leaves the iPhone's Secure Enclave, can sign.
CREATE TABLE IF NOT EXISTS devices (
  id            INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  credential_id VARBINARY(255) NOT NULL,
  public_key    TEXT           NOT NULL,
  -- Bumped by the authenticator on every assertion. A value that fails to
  -- advance is the signal for a cloned credential. Apple's passkeys always
  -- report 0, so a stuck-at-zero counter is expected, not an alarm.
  sign_count    INT UNSIGNED   NOT NULL DEFAULT 0,
  label         VARCHAR(64)    DEFAULT NULL,
  created_at    DATETIME       NOT NULL,
  last_used_at  DATETIME       DEFAULT NULL,
  UNIQUE KEY uniq_credential (credential_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
