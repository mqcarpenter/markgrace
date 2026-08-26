-- Privileges for the Mark Grace tracker.
--
-- Assumes the two accounts ALREADY EXIST (created in cPanel or by hand):
--   otbdesig_gracey  -> the web app
--   otbdesig_harper  -> the command-line importer
--
-- Run as an admin account, AFTER schema.sql. Replace DBNAME with your
-- actual database (cPanel usually prefixes it, e.g. otbdesig_markgrace).
--
-- Use --force: the REVOKE lines below error with 1141 ("no such grant")
-- when there is nothing to revoke, which would otherwise abort the script.
--
--   mysql --force -u ADMIN -p DBNAME < grants.sql
--
-- No passwords appear in this file. Set those where the accounts were made.

-- ---------------------------------------------------------------------
-- Step 1: strip any blanket privileges.
-- cPanel grants ALL PRIVILEGES when you attach a user to a database, which
-- would make the narrow grants below meaningless. Error 1141 here is
-- harmless — it just means there was nothing to take away.
-- ---------------------------------------------------------------------
REVOKE ALL PRIVILEGES ON DBNAME.* FROM 'otbdesig_gracey'@'localhost';
REVOKE ALL PRIVILEGES ON DBNAME.* FROM 'otbdesig_harper'@'localhost';

-- ---------------------------------------------------------------------
-- Step 2: grant only what each account actually needs.
-- ---------------------------------------------------------------------

-- The web app. Reads cards and flips ownership — nothing else. Cannot
-- INSERT, DELETE, drop tables, or rewrite a card's name, number or image.
GRANT SELECT ON DBNAME.cards TO 'otbdesig_gracey'@'localhost';
GRANT UPDATE (owned, acquired_at, note) ON DBNAME.cards TO 'otbdesig_gracey'@'localhost';

-- The importer. Used only by `php seed.php` from the command line, which
-- needs INSERT to add cards not yet in the table.
GRANT SELECT, INSERT, UPDATE ON DBNAME.cards TO 'otbdesig_harper'@'localhost';

FLUSH PRIVILEGES;

-- Verify afterwards — gracey must NOT show INSERT, DELETE or DROP:
--   SHOW GRANTS FOR 'otbdesig_gracey'@'localhost';
--   SHOW GRANTS FOR 'otbdesig_harper'@'localhost';
