#!/usr/bin/env python3
"""Match locally saved TCDB thumbnails to cards, and copy the winners into img/.

TCDB image files are named ``<sid>_<token><kind>.jpg`` where ``sid`` is the set
id and ``token`` is either the card id (``cid``) or the printed card number.
Neither one appears in ``data/cards.json``, so the join has to come from saved
TCDB pages: every ``/ViewCard.cfm/sid/<sid>/cid/<cid>/`` link carries the set
name and card number in its text.

    python3 tools/match-thumbs.py ~/Claude/Projects/"mark grace"

Pass ``--apply`` to actually copy files and rewrite ``data/cards.json``; without
it the script only reports what it would do.

Front and back scans (``<sid>-<token>Fr.jpg`` / ``Bk.jpg``) share the sid+token
key with the thumbnails, so a card that resolves to a front also picks up its
back, which is what the binder's flip animation shows.
"""

import argparse
import html
import json
import os
import re
import shutil
import sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# <sid>_<token><Rep?><kind><browser dedup suffix?>.<ext>
#
# Browsers dedupe a repeat download two different ways depending on how the
# file was saved: Chrome's "Save image as" appends " (1)", while a save from a
# page archive sanitises it to "__1_". Both turn up in this folder, so both
# have to be tolerated or the file silently drops out of the match.
FILE_RE = re.compile(
    r'^(\d+)[_-](.+?)(Rep)?(Thumb\d|Fr|Bk)(__\d+_| \(\d+\))?\.(jpg|jpeg|png|webp)$', re.I)

LINK_RE = re.compile(
    r'<a href="/ViewCard\.cfm/sid/(\d+)/cid/(\d+)/[^"]*">([^<]*)</a>')

# The descriptive scheme, which needs no saved page at all because the year,
# set and card number are right there in the name:
#
#   1988_Fleer-Glossy_641-Fr.jpg
#   1988_Fleer-Update_U-77-Bk.jpg
#   1988-89_Star-Gold_71-Fr-v2.jpg
#
# The year may span two ("1988-89"), spaces in the set are dashes, and an
# alternate scan carries -v2/-v3 on either side of the Fr/Bk marker.
DESC_RE = re.compile(
    r'^(\d{4}(?:-\d{2})?)_(.+)_(.+?)(?:-v\d+)?-(Fr|Bk)(?:-v(\d+))?\.(jpg|jpeg|png|webp)$',
    re.I)

TITLE_RE = re.compile(r'^(.*?)\s+#(\S+)\s+Mark Grace\b')

# Which scan wins when a card resolves to several files. A full "Fr" scan
# beats either TCDB thumbnail, so a card already carrying a thumbnail is
# upgraded when a real scan turns up for it.
FRONT_RANK = {'fr': 0, 'thumb4': 1, 'thumb2': 2}


def norm(s):
    return re.sub(r'[^a-z0-9]+', '', str(s).lower().replace('&', 'and'))


def scan_pages(src):
    """Build sid/cid -> title and sid -> {set name} from saved TCDB pages."""
    links, sid_sets = {}, {}
    pages = [f for f in os.listdir(src) if f.lower().endswith('.html')]
    for name in pages:
        path = os.path.join(src, name)
        with open(path, encoding='utf-8', errors='replace') as fh:
            page = fh.read()
        for sid, cid, text in LINK_RE.findall(page):
            text = html.unescape(text).strip()
            if 'Mark Grace' not in text:
                continue
            links[(sid, cid)] = text
            m = TITLE_RE.match(text)
            set_name = m.group(1) if m else re.sub(r'\s*Mark Grace.*$', '', text)
            sid_sets.setdefault(sid, set()).add(set_name)
    return links, sid_sets, len(pages)


def index_cards(cards):
    by_key, by_set = {}, {}
    for c in cards:
        by_key[(norm(c['full']), norm(c['num']))] = c
        by_set.setdefault(norm(c['full']), []).append(c)
    return by_key, by_set


def resolve(sid, token, links, sid_sets, by_key, by_set):
    """Find the card a file belongs to, or None. Returns (card, how)."""
    title = links.get((sid, token))
    if title:
        m = TITLE_RE.match(title)
        if m:
            c = by_key.get((norm(m.group(1)), norm(m.group(2))))
            if c:
                return c, 'cid'

    # The token is the printed card number rather than a cid.
    for set_name in sid_sets.get(sid, ()):
        c = by_key.get((norm(set_name), norm(token)))
        if c:
            return c, 'num'

    # Grace appears exactly once in this set, so the card is unambiguous even
    # though the token resolves to nothing.
    for set_name in sid_sets.get(sid, ()):
        same = by_set.get(norm(set_name), [])
        if len(same) == 1:
            return same[0], 'sole'

    return None, None


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('source', help='folder holding saved TCDB pages + image folders')
    ap.add_argument('--apply', action='store_true', help='copy files and update cards.json')
    args = ap.parse_args()

    src = os.path.expanduser(args.source)
    if not os.path.isdir(src):
        sys.exit(f'No such folder: {src}')

    links, sid_sets, page_count = scan_pages(src)
    print(f'Read {page_count} saved page(s): {len(links)} card links, {len(sid_sets)} sets.')

    cards_path = os.path.join(REPO, 'data', 'cards.json')
    with open(cards_path) as fh:
        cards = json.load(fh)
    by_key, by_set = index_cards(cards)

    # Every image file we can see, wherever it lives under the source folder.
    pools = []
    for entry in sorted(os.listdir(src)):
        full = os.path.join(src, entry)
        if os.path.isdir(full) and entry != 'brands':
            pools.append(full)
    pools.append(src)

    fronts, backs = {}, {}
    unresolved = 0
    unresolved_names = []
    for pool in pools:
        for name in sorted(os.listdir(pool)):
            card = None
            kind = None

            # Descriptive names first — they identify a card outright, with no
            # dependence on which pages happen to have been saved.
            d = DESC_RE.match(name)
            if d:
                full = f'{d.group(1)} {d.group(2)}'.replace('-', ' ')
                kind = d.group(4).lower()
                card = by_key.get((norm(full), norm(d.group(3))))
                if not card:
                    # "1989 O-Pee-Chee Stickers 50" splits as set + "50", so a
                    # trailing token of the set may really belong to the name.
                    parts = d.group(2).rsplit('-', 1)
                    if len(parts) == 2:
                        wider = f'{d.group(1)} {d.group(2)} {d.group(3)}'.replace('-', ' ')
                        same = by_set.get(norm(wider), [])
                        if len(same) == 1:
                            card = same[0]

            if not card:
                m = FILE_RE.match(name)
                if not m:
                    continue
                sid, token, kind = m.group(1), m.group(2), m.group(4).lower()
                card, _how = resolve(sid, token, links, sid_sets, by_key, by_set)

            if not card:
                unresolved += 1
                if len(unresolved_names) < 40:
                    unresolved_names.append(name)
                continue
            path = os.path.join(pool, name)
            if kind == 'bk':
                backs.setdefault(card['id'], (name, path))
            else:
                rank = FRONT_RANK.get(kind, 9)
                cur = fronts.get(card['id'])
                if cur is None or rank < cur[0]:
                    fronts[card['id']] = (rank, name, path)

    img_dir = os.path.join(REPO, 'img')
    have = set(os.listdir(img_dir))

    index = {c['id']: c for c in cards}

    new_front = {cid: v for cid, v in fronts.items() if not index[cid]['img']}
    # A card already holding a TCDB thumbnail is upgraded when a full scan
    # turns up — same card, better picture.
    upgrades = {cid: v for cid, v in fronts.items()
                if index[cid]['img'] and v[0] == 0 and index[cid]['img'] != v[1]}
    new_back = {cid: v for cid, v in backs.items() if not index[cid].get('img_back')}

    print(f'Resolved files to {len(fronts)} card(s); {unresolved} file(s) could '
          f'not be tied to a card.')
    print(f'  new front images:      {len(new_front)}')
    print(f'  thumbnails upgraded:   {len(upgrades)}')
    print(f'  new back images:       {len(new_back)}')

    if unresolved_names:
        print('\n  unplaced, first few:')
        for n in unresolved_names[:8]:
            print(f'    {n}')

    if not args.apply:
        print('\nDry run. Re-run with --apply to copy files and update cards.json.')
        return

    copied = 0
    for cid, (_rank, name, path) in list(new_front.items()) + list(upgrades.items()):
        if name not in have:
            shutil.copy2(path, os.path.join(img_dir, name))
            copied += 1
        index[cid]['img'] = name
    for cid, (name, path) in new_back.items():
        if name not in have:
            shutil.copy2(path, os.path.join(img_dir, name))
            copied += 1
        index[cid]['img_back'] = name

    # Give every card the key so the shape stays uniform.
    for c in cards:
        c.setdefault('img_back', None)

    with open(cards_path, 'w') as fh:
        json.dump(cards, fh, indent=1)
        fh.write('\n')

    print(f'\nCopied {copied} file(s) into img/ and updated data/cards.json.')
    print('Run `php seed.php` (or import cards-insert.sql) to push them to MySQL.')


if __name__ == '__main__':
    main()
