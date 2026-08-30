# Mark Grace Card Tracker

A phone-friendly checklist of Mark Grace baseball cards. Tap a card to mark it
owned; the state lives in MySQL, so every device sees the same collection.

**Scope:** base cards, inserts and parallels — no autographs, no relics.
Minor league and oddball/team-issued cards are included.

Currently tracking **2,606 cards (1982–2026)**.
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

Two independent locks, because reading and writing deserve different answers.

### Writing: your iPhone only (passkeys)

Anyone with the URL can look at the collection. Only a **registered device**
can change which cards are owned.

This is a WebAuthn passkey. The private key is generated inside the iPhone's
Secure Enclave and cannot be exported — not by you, not by Apple, not by
malware. The server stores only the matching public key. To flip an `owned`
flag the phone has to sign a fresh random challenge, which takes a Face ID
prompt. A leaked database, a copied cookie, or a shared URL gets an attacker
nothing, because none of them can produce a signature.

**IMEI is not an option, and neither is IP.** No browser exposes a device
serial — Apple blocks it deliberately — and phone IPs change constantly. A
passkey is the thing that actually identifies *this device* on the web.

**Setup, in order:**

1. Run the migration (adds the `devices` table):
   ```bash
   mysql -u ADMIN -p DBNAME < migrate-005-backs-and-devices.sql
   ```
2. Add the new grants from `grants.sql` for the `devices` table.
3. Open the page **on the iPhone** and tap **Unprotected** in the top right.
   Confirm, approve the Face ID prompt, and that device is registered.

> **Do step 3 as soon as the site is up.** Until the first device registers,
> the page behaves exactly as it did before — anyone can edit, *and anyone can
> register themselves as the owner*. That window closes the moment you enrol.
> If you don't want to register straight away, set `'passphrase'` first so
> strangers can't reach the page at all.

Once one device is registered, everything else is read-only.

**Adding a second device later** needs the enrolment key, because the "first
device registers freely" rule no longer applies. Set one in `config.php`:

```php
'enroll_key' => '…',   // php -r 'echo bin2hex(random_bytes(16)), "\n";'
```

Leave it `null` and no further device can enrol over the web at all — the
safest setting. Recovery is then deliberate: delete the row by hand and
re-register.

```sql
SELECT id, label, created_at, last_used_at FROM devices;   -- what's registered
DELETE FROM devices WHERE id = 3;                          -- retire a lost phone
DELETE FROM devices;                                       -- start over
```

Emptying `devices` reopens free registration, which is the intended escape
hatch if you lose the phone. The app account deliberately holds no `DELETE`
on that table, so only you at the database can do it.

One Face ID prompt unlocks writing for 15 minutes (`passkey_ttl`), so marking
a stack of cards doesn't prompt on every tap. The header shows the countdown;
tap it to lock again immediately.

**Passkeys require HTTPS.** On plain HTTP the browser refuses to create one,
and the lock button will say so.

### Reading: a shared passphrase

To keep strangers from *viewing* the page at all, set one in `config.php`:

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
| `webauthn.php` | Passkey verification — CBOR, COSE keys, signature checks |
| `schema.sql` | Table definition |
| `migrate-002-card-types.sql` | Adds auto/relic/parallel/insert flags |
| `migrate-003-brand.sql` | Adds brand columns |
| `migrate-004-variant.sql` | Splits the variant off the set name |
| `migrate-005-backs-and-devices.sql` | Adds `image_back` and the `devices` table |
| `migrate-005b-image-backs.sql` | Fills in the card backs found locally |
| `migrate-006-minor-league.sql` | Three minor league / college cards added by hand |
| `migrate-007-owned-from-md.sql` | Ownership carried over from the old markdown tracker |
| `migrate-008-expand-checklist.sql` | 438 cards found via their scans, incl. 2016-2026 |
| `migrate-009-dedupe-truncated.sql` | Removes 129 rows duplicated under a chopped set name |
| `migrate-010-dedupe-from-pages.sql` | 55 more, found via the saved TCDB pages |
| `cleanup-stale.sql` | Deletes rows left by the earlier import |
| `grants.sql` | Least-privilege database users |
| `seed.php` | One-time import of `data/cards.json` |
| `tools/fix-logo.py` | Prepares a brand logo for `img/brands/` |
| `tools/match-thumbs.py` | Matches saved TCDB thumbnails to cards |
| `cards-insert.sql` | Same data as plain SQL, for phpMyAdmin |
| `data/cards.json` | The card list |
| `img/` | Card images (3,432 files, fronts and backs) |
| `icons/` | App icons for the home screen |
| `manifest.json` | Install metadata (name, icons, standalone) |
| `sw.js` | Offline shell |

### API

| Request | Does |
|---|---|
| `GET api/?action=cards` | All cards, grouped by year |
| `POST api/?action=toggle` | `{"id":"...","owned":true}` — set owned state. Needs a passkey. |
| `GET api/?action=session` | Lock state, device count, seconds of write access left |
| `POST api/?action=login` | `{"passphrase":"..."}` |
| `POST api/?action=logout` | Ends the session |
| `POST api/?action=passkey-register-options` | Challenge + options for enrolling a device |
| `POST api/?action=passkey-register` | Stores a new device's public key |
| `GET api/?action=passkey-auth-options` | Challenge for proving possession |
| `POST api/?action=passkey-auth` | Verifies a signature, opens the write window |
| `POST api/?action=passkey-lock` | Closes the write window immediately |

---

## Set names and variants

TCDB writes a parallel as `Base Set - Variant`. Those are stored in separate
columns and shown as `1988 Fleer Update | Glossy`, so a parallel is never
mistaken for the base card. 574 cards carry a variant.

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

## The binder

The **Binder** toggle swaps the list for a nine-pocket album page — three
across, three down, the way the cards actually sit in the sheet. Owned cards
sit in their pocket in colour; ones you still need show greyed out, so a page
reads at a glance as how far along that stretch of the collection is.

- **Tap a card** to flip it. If a back scan exists it shows the real reverse;
  otherwise it shows a printed panel with the set, number, badges and the date
  you added it.
- **Tap the corner check** to mark it owned. Flipping never changes state, so
  you can browse the backs without touching the collection.
- **Swipe left/right**, use the arrows, or press the arrow keys to turn pages.

Every filter applies — pick a year and the binder becomes that year's pages.
`prefers-reduced-motion` turns off the page-turn and flip animations.

## Filtering by brand

The dropdown next to the search box lists every brand with its card count,
biggest first. There are ~90 of them, which is far too many for a chip row.
It composes with the year, type and status filters, and with search, which
also now matches the brand name.

## Card images

`tools/match-thumbs.py` matches locally saved TCDB thumbnails to cards. TCDB
names its files `<sid>_<token><kind>.jpg`, where `sid` is the set id — and
neither id appears in `data/cards.json`, so the join comes from saved TCDB
pages: every `/ViewCard.cfm/sid/…/cid/…/` link carries the set name and card
number in its link text.

```bash
python3 tools/match-thumbs.py ~/path/to/saved-tcdb-folder          # dry run
python3 tools/match-thumbs.py ~/path/to/saved-tcdb-folder --apply
```

**Two naming schemes are understood.** The descriptive one —
`1988_Fleer-Glossy_641-Fr.jpg` — carries the year, set and card number in
the name, so it needs no saved page at all and is by far the better source.
The older TCDB one — `120901_8223068Thumb2.jpg` — encodes only internal ids,
so it can only be placed when a saved page happens to name that set. Files
of the second kind are what remain unmatched.

A full `Fr` scan outranks either thumbnail, so a card already carrying a
TCDB thumbnail is upgraded in place when a real scan turns up for it.

## The checklist PDF is only Part 1

`Trading Card Database _ Mark Grace Checklist.pdf` in the project folder is
**not** the full checklist, despite covering 34 pages. Its footer reads
`Part=1`, and the last row on page 34/34 is a 2004 Donruss card. Everything
from late 2004 onward is in a Part 2 that isn't in the folder.

That matters because the PDF was treated as ground truth for "does this card
exist". It can't answer that for anything after 2004. Until Part 2 is
exported from TCDB, the scan filenames are the better source for recent years
— they carry the full set name and card number, untruncated.

It's also two-column, and a naive text extraction interleaves the columns into
nonsense. Crop each page into halves and extract them separately:

```python
for x0, x1 in ((0, page.width / 2), (page.width / 2, page.width)):
    text = page.crop((x0, 0, x1, page.height)).extract_text()
```

Rows wrap, so rejoin any line that doesn't start with a four-digit year. Set
names in the PDF are still truncated to ~37 characters, which is a property of
the printed column and not of the extraction.

That truncation put 129 sets into the checklist twice — once chopped, once in
full — which `migrate-009` clears out. The scans are what settle it, since
their filenames carry the untruncated name. Numeric suffixes are deliberately
left alone: `Topps Tek Pattern 2` and `Pattern 23` are two real sets, not one
cut short.

## What the variants mean

TCDB writes a parallel as `Base Set - Variant`, and the variant is trade
shorthand: *Glossy*, *Tiffany*, *Rave*, *Press Proof*. Those are explained in
the app now — the variant is underlined with dots, and tapping it puts a
plain-English note in the toast. Hover works on desktop; the tap is there
because a `title` tooltip does nothing on a phone.

`explainVariant()` in `assets/app.js` holds the glossary, matched
most-specific-first so *Atomic Refractors* isn't answered as *Refractors*.
Anything unmatched still gets a sensible fallback, so adding a term is a
one-line change.

**Card numbers carry meaning too, and the case matters.** A trailing
lowercase letter is a print variation — `#40a` and `#40b` are one card with
small back-text differences between printings, and both are tappable for the
explanation. An uppercase suffix is something else and is deliberately *not*
treated as a variation: `#80T` is Score's Traded set, `#68G` an Ultra Gold
Medallion, `#26A` and `#26B` two distinct Topps Tek patterns.

## Landscape scans

About a quarter of the scans are wider than they are tall — 5x7 posters, uncut
panels, and the many card backs printed sideways.

They are shown **turned a quarter turn, filling the portrait frame**, because
that is how the card physically sits in a nine-pocket sleeve: the pocket is
portrait, so a landscape card goes in sideways and you turn the binder to read
it. Fitting them upright inside the pocket instead would letterbox them and
show something the binder never does.

Orientation is measured from `naturalWidth`/`naturalHeight` as each image
loads, and a cached image can be complete before the load listener sees it, so
every repaint also sweeps what is already on screen.

Two details in the CSS worth keeping:

- Rotation doesn't affect layout, so the box's width and height are swapped
  first and the extra width pulled back with a negative margin. Without that
  the list rows would grow by the difference.
- In the binder the turned card's box has to be as wide as the pocket is tall
  — 140% of the pocket width, `+3px` because `.card3d` sits inset by 3px and
  that shifts the ratio slightly off a clean 7:5.

The turn is clockwise. To go the other way, change the two `rotate(90deg)`
values to `rotate(-90deg)`.

## Minor league and college

Grace's minor league run (Peoria 1986, Pittsfield 1987, Iowa 1988) and his
San Diego State cards are in scope and catalogued.

**Watch for the same card under two names.** TCDB's set names often differ
from how collectors say them, and the difference reads as a missing card when
it isn't. Real examples, all already in the checklist:

| Said as | Catalogued as |
|---|---|
| 1990 Classic #8 | 1990 Classic **Blue** #8 |
| 1988 ProCards **Minor League** #539 | 1988 ProCards #539 |
| 1988 **Kodak** Peoria Chiefs Team Issue | 1988 Peoria Chiefs #NNO |
| 1988 **Broder** Rookies Series **IV** #1 | 1988 Rookies **IV Final Series (unlicensed)** #1 |
| 1988 **Broder** Class of '88 #3 | 1988 Class of '88 **(unlicensed)** #3 |
| 1988 **Broder/**Baseball's Best Series II #17 | 1988 Baseball's Best Series II **(unlicensed)** #17 |
| 1988 Baseball Stars Series **IV** #9 | 1988 Baseball Stars Series **4 (unlicensed)** #9 |

Two rules cover most of it: TCDB drops **Broder** (it catalogues those as
`(unlicensed)` instead) and writes series numbers as digits, not Roman
numerals. Search by card number first — it survives the renaming.

## Known gaps

- **1,694 of 2,606 cards have a front image, and 1,580 have a back.** TCDB
  blocks hotlinking *and* server-side fetching (403), so images can't be pulled
  automatically; these were recovered from previously saved TCDB pages. More
  saved pages is the unlock — see [Card images](#card-images). Failing that,
  drop a JPEG in `img/` and set that card's `image` column by hand.
- **Parallels reuse their base card's image.** A Tiffany or Glossy parallel
  shows the base photo, because TCDB usually has no separate image for it.
- **2,606 of ~5,411 known cards are catalogued**, recovered from saved TCDB
  pages and the checklist PDF. The rest are mostly post-2005 parallels.
- **Some set names from the PDF are truncated** at ~37 characters, because
  that is how the printed checklist column was cut. Where a saved TCDB page
  has the full name it is used instead, which recovered 67 of them.
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
