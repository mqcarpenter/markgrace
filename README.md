# Mark Grace Card Tracker

A phone-friendly checklist of Mark Grace baseball cards. Tap a card to mark it
owned; the state lives in MySQL, so every device sees the same collection.

**Scope:** base cards, inserts and parallels — no autographs, no relics.
Minor league and oddball/team-issued cards are included.

Currently tracking **2,497 cards (1982–2015)**, 13 marked owned.
TCDB lists 5,411 Mark Grace cards total, so this is a work in progress.

---

## Installing on your host

1. **Upload** these files to a directory your web server serves.

2. **Create the database and tables** (as an admin account):
   ```bash
   mysql -u YOUR_ADMIN -p YOUR_DB < schema.sql
   ```

3. **Create the two restricted users.** Edit `grants.sql` to set both
   passwords first, then:
   ```bash
   mysql -u YOUR_ADMIN -p markgrace < grants.sql
   ```
   See [Database privileges](#database-privileges) for what these can do.

4. **Add your credentials:**
   ```bash
   cp config.example.php config.php
   ```
   Put the two accounts from `grants.sql` into `config.php`.
   `config.php` is gitignored — your credentials never reach GitHub.

5. **Load the cards:**
   ```bash
   php seed.php
   ```
   No shell access, or the importer account won't authenticate? Import
   `cards-insert.sql` through phpMyAdmin instead — same data, same
   re-run safety, and it needs no extra database account.
   Prints how many cards it imported. Safe to re-run — it refreshes card
   details but never overwrites an `owned` flag you've already set.

6. Open the directory in a browser.

### Requirements
PHP 7.4+ with PDO MySQL, and MySQL 5.7+ / MariaDB 10.2+.

---

## Database privileges

**Never point `config.php` at `root`.** The web app needs far less than that,
and `grants.sql` sets up two narrow accounts so a bug or a leaked config can't
become a lost table.

| Account | Privileges | Used by |
|---|---|---|
| `markgrace_app` | `SELECT` on `cards`; `UPDATE` on `owned`, `acquired_at`, `note` **only** | Every web request |
| `markgrace_seed` | `SELECT`, `INSERT`, `UPDATE` on `cards` | `php seed.php`, command line only |
| your admin account | everything | `schema.sql`, by hand |

The app account is deliberately narrow. Verified against MySQL:

- `DROP TABLE`, `TRUNCATE`, `DELETE`, `INSERT` — **denied**
- `UPDATE` of `set_name`, `card_num`, `image`, `year` — **denied**
  (`ERROR 1143: UPDATE command denied ... for column 'set_name'`)
- `SELECT` and flipping `owned` / `acquired_at` — allowed, which is all the
  page ever does
- No access to any other database

`db_admin()` in `db.php` refuses to run outside the command line, so the
importer's account can never be reached by a web request.

A strictly read-only account will not work for the app itself — marking a card
owned is a write. If you later want a public *view-only* page, a third account
with just `SELECT` is the right way to build it.

### Sharing a database with WordPress

If you install the `cards` table into an existing WordPress database (a name
like `otbdesig_wp298`), two things matter:

**Never revoke privileges from the WordPress database user.** WordPress needs
broad rights on its own database. Revoking them takes the site down. Check who
it connects as before touching anything:

```bash
grep DB_USER /path/to/wp-config.php
```

If that name matches either tracker account, skip the optional REVOKE lines in
`grants.sql` entirely.

**Least privilege is weakened by sharing.** If cPanel already granted the app
account ALL PRIVILEGES on the WordPress database, the narrow grants add nothing
— the account can still drop `wp_posts`. Column-level restrictions only mean
something on a database where that account has nothing else.

**The cleaner option is a separate database.** Create `otbdesig_markgrace` in
cPanel, attach both accounts to it, and point `config.php` there. The tracker
uses exactly one table, so the cost is one database slot, and it keeps a public
page's credentials away from your WordPress content.

The `cards` table itself is safe to co-locate — the name can't collide with
WordPress's `wp_`-prefixed tables.

---

## Locking it down

The page is **open to anyone with the URL** by default — including the ability
to change your checkmarks. To require a passphrase, set one in `config.php`:

```php
'passphrase' => 'something-only-you-know',
```

Both reading and writing are then blocked until it's entered. This is a single
shared passphrase, not user accounts — it's meant to keep strangers out of a
personal page, not to protect anything sensitive.

---

## Installing it as an app

Open the page in Safari (iOS) or Chrome (Android) and choose **Add to Home
Screen**. It installs as a standalone app: its own icon, no address bar, no
browser chrome, and it opens straight into the collection.

The icon is Grace's portrait from his 1989 Donruss Super Diamond Kings card.
To change it, replace the files in `icons/` — `apple-touch-icon.png` (180px)
is the one iOS uses.

A service worker (`sw.js`) caches the shell, the card list and any images
you've viewed, so the app opens instantly and still works with no signal.
**Marking a card owned needs a connection** — a write with no network fails
visibly and rolls back rather than pretending to save.

Two deployment notes: `sw.js` must be served from the app root (its scope is
the whole app), and `manifest.json` must stay publicly readable or the
install will silently not happen. The bundled `.htaccess` handles both.

---

## Layout

| Path | What it is |
|---|---|
| `index.php` | The page shell |
| `assets/app.js` | Rendering, filtering, tap-to-toggle |
| `assets/app.css` | Styles, light and dark |
| `api/index.php` | JSON endpoints |
| `db.php` | Config loading, PDO connection, auth helpers |
| `schema.sql` | Table definition |
| `migrate-002-card-types.sql` | Adds auto/relic/parallel/insert flags |
| `migrate-003-brand.sql` | Adds brand columns |
| `grants.sql` | Least-privilege database users |
| `seed.php` | One-time import of `data/cards.json` |
| `cards-insert.sql` | Same data as plain SQL, for phpMyAdmin |
| `data/cards.json` | The card list |
| `img/` | Card images (294 files) |
| `icons/` | App icons for the home screen |
| `manifest.json` | Install metadata (name, icons, standalone) |
| `sw.js` | Offline shell |

### API

| Request | Does |
|---|---|
| `GET api/?action=cards` | All cards, grouped by year |
| `POST api/?action=toggle` | `{"id":"...","owned":true}` — set owned state |
| `GET api/?action=session` | Whether the page is locked |
| `POST api/?action=login` | `{"passphrase":"..."}` |
| `POST api/?action=logout` | Ends the session |

---

## Card types and brands

Every card is included — autographs, relics and parallels among them. They
aren't filtered out, they're **labelled**: each row carries `AUTO`, `RELIC`,
`PARALLEL` or `INSERT` badges plus a serial-number chip (`/25`) where TCDB
records one. The type chips above the list narrow to one kind; "Cards only"
hides autos and relics without deleting them.

Brands show as coloured wordmarks (`TOPPS`, `DONRUSS`, `TOYS R US`). To use
real logos, just drop the file at `img/brands/<slug>.png` — it is picked up
automatically with no code change, and `.svg` and `.webp` work too. Brands
with no file keep the wordmark, so adding a few at a time is fine.
`img/brands/README.md` lists every slug with the number of cards it covers.
No logo files ship with this repo; they are third-party trademarks.

## Known gaps

- **Only ~308 of 2,497 cards have an image.** TCDB blocks hotlinking *and*
  server-side fetching (403), so images can't be pulled automatically. The 43
  here were recovered from previously saved TCDB pages. Remaining images have to
  be added by hand: drop a JPEG in `img/` and set that card's `image` column.
- **Parallels reuse their base card's image.** A Tiffany or Glossy parallel
  shows the base photo, because TCDB usually has no separate image for it.
- **2,497 of ~5,411 known cards are catalogued**, recovered from saved TCDB
  pages and the checklist PDF. The rest are mostly post-2005 parallels.
- **Some set names from the PDF are truncated** at ~37 characters, because
  that is how the printed checklist column was cut.
- **Prices aren't tracked.** The old markdown tracker had an empty price
  column; it was dropped rather than carried over blank.

---

## Web server notes

`.htaccess` (Apache) blocks the files that must never be served: `.sql`
(database passwords), `config.php`, and the `.git` directory. Confirm it's
working after install — these should all return 403 or 404:

```bash
curl -I https://yourhost/markgrace/grants.sql
curl -I https://yourhost/markgrace/config.php
curl -I https://yourhost/markgrace/.git/config
```

**On nginx, `.htaccess` does nothing.** Add this to your server block instead:

```nginx
location ~ \.(sql|md)$        { deny all; }
location ~ /config.*\.php$    { deny all; }
location ~ /\.git             { deny all; }
location ~ ^/data/            { deny all; }
```

Safest of all: keep the app out of the webroot entirely, or delete
`grants.sql` from the server once the users exist — it isn't needed at runtime.
