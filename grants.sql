-- Least-privilege database users for the Mark Grace tracker.
-- Run as an admin account, AFTER schema.sql:
--   mysql -u root -p markgrace < grants.sql
-- Change both passwords first.

-- 1. The web app. Reads cards and flips the `owned` flag — nothing else.
--    Cannot INSERT, DELETE, or alter the schema. This is the account that
--    goes in config.php under 'db', and the only one exposed to the web.
CREATE USER IF NOT EXISTS 'markgrace_app'@'localhost'
    IDENTIFIED BY 'CHANGE_ME_APP';
GRANT SELECT ON markgrace.cards TO 'markgrace_app'@'localhost';
-- Column-level: the app may only flip these two fields. Even a fully
-- compromised web request cannot rewrite a card's name, number or image.
GRANT UPDATE (owned, acquired_at, note) ON markgrace.cards TO 'markgrace_app'@'localhost';

-- 2. The importer. Used only by `php seed.php` from the command line,
--    which needs INSERT to add cards that aren't in the table yet.
--    Goes in config.php under 'db_admin'. Never used by a web request.
CREATE USER IF NOT EXISTS 'markgrace_seed'@'localhost'
    IDENTIFIED BY 'CHANGE_ME_SEED';
GRANT SELECT, INSERT, UPDATE ON markgrace.cards TO 'markgrace_seed'@'localhost';

FLUSH PRIVILEGES;

-- Neither account can DROP, TRUNCATE, or touch any other database.
-- Schema changes stay with your admin account, applied by hand.
