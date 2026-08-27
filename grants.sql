-- Privileges for the Mark Grace tracker.
--
-- Accounts are assumed to ALREADY EXIST (cPanel-created):
--   otbdesig_gracey  -> the web app
--   otbdesig_harper  -> the command-line importer
--
-- Replace DBNAME below with your database, then run as an admin account
-- AFTER schema.sql:
--
--   mysql -u ADMIN -p DBNAME < grants.sql
--
-- No passwords appear in this file. Those live only in config.php.
--
-- =====================================================================
-- STOP — READ THIS IF YOU ARE SHARING A DATABASE WITH ANOTHER APP
-- =====================================================================
-- This file only ADDS privileges. It deliberately does NOT revoke
-- anything, because revoking is destructive when the database is shared.
--
-- If DBNAME is a WordPress database (a name like otbdesig_wp298 usually
-- is), and either account is the one WordPress connects with, then
-- revoking its privileges TAKES THE SITE DOWN.
--
-- Check before touching privileges:
--   grep DB_USER /path/to/wp-config.php
--
-- If that prints otbdesig_gracey or otbdesig_harper, do not revoke from
-- that account, and see "Sharing with WordPress" in the README.
-- =====================================================================

GRANT SELECT ON DBNAME.cards TO 'otbdesig_gracey'@'localhost';
GRANT UPDATE (owned, acquired_at, note) ON DBNAME.cards TO 'otbdesig_gracey'@'localhost';

-- Registered passkeys. The app must be able to add a device, read the keys
-- back, and bump the signature counter — but never delete one, so a bug or a
-- hostile request cannot silently unlock the page by emptying the table.
-- Removing a lost device is a deliberate act you do by hand:
--   DELETE FROM devices WHERE label = '...';
GRANT SELECT, INSERT ON DBNAME.devices TO 'otbdesig_gracey'@'localhost';
GRANT UPDATE (sign_count, last_used_at) ON DBNAME.devices TO 'otbdesig_gracey'@'localhost';

GRANT SELECT, INSERT, UPDATE ON DBNAME.cards TO 'otbdesig_harper'@'localhost';

FLUSH PRIVILEGES;

-- Verify:
--   SHOW GRANTS FOR 'otbdesig_gracey'@'localhost';
--   SHOW GRANTS FOR 'otbdesig_harper'@'localhost';
--
-- ---------------------------------------------------------------------
-- OPTIONAL, and only on a database used by nothing but this tracker.
-- These make the narrow grants above meaningful by removing any blanket
-- ALL PRIVILEGES that cPanel attached. Run them BY HAND, one at a time,
-- never on a shared or WordPress database. Error 1141 just means there
-- was nothing to revoke.
--
--   REVOKE ALL PRIVILEGES ON DBNAME.* FROM 'otbdesig_gracey'@'localhost';
--   REVOKE ALL PRIVILEGES ON DBNAME.* FROM 'otbdesig_harper'@'localhost';
-- ---------------------------------------------------------------------
