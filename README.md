# Mark Grace Card Tracker

A phone-friendly checklist of Mark Grace baseball cards. Tap a card to mark it
owned; the state lives in MySQL, so every device sees the same collection.

**Scope:** base cards, inserts and parallels — no autographs, no relics.
Minor league and oddball/team-issued cards are included.

Currently tracking **171 cards (1986–2004)**, 13 marked owned.
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

## Adding to your phone's home screen

Open the page in Safari (iOS) or Chrome (Android) and choose **Add to Home
Screen**. It opens full-screen like an app.

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
| `grants.sql` | Least-privilege database users |
| `seed.php` | One-time import of `data/cards.json` |
| `data/cards.json` | The card list |
| `img/` | Card thumbnails (38 files) |

### API

| Request | Does |
|---|---|
| `GET api/?action=cards` | All cards, grouped by year |
| `POST api/?action=toggle` | `{"id":"...","owned":true}` — set owned state |
| `GET api/?action=session` | Whether the page is locked |
| `POST api/?action=login` | `{"passphrase":"..."}` |
| `POST api/?action=logout` | Ends the session |

---

## Known gaps

- **Only 43 of 171 cards have an image.** TCDB blocks hotlinking *and*
  server-side fetching (403), so images can't be pulled automatically. The 43
  here were recovered from previously saved TCDB pages. Remaining images have to
  be added by hand: drop a JPEG in `img/` and set that card's `image` column.
- **Parallels reuse their base card's image.** A Tiffany or Glossy parallel
  shows the base photo, because TCDB usually has no separate image for it.
- **171 of 5,411 known cards are catalogued.** Coverage is strongest 1986–1993
  and thin after; the insert-heavy mid-90s are barely started.
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
