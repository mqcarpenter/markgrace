# Brand logos

Drop a logo here and it appears on every card of that brand automatically —
no code change. Name the file for the brand's slug:

    img/brands/topps.png
    img/brands/donruss.svg
    img/brands/upperdeck-dark.png

## Constraints

| | |
|---|---|
| **Formats** | `.png`, `.svg`, `.webp` — tried in that order |
| **Rendered at** | 20 px tall, 82 px wide maximum |
| **Supply at** | ~3x the rendered size: about 240x60 for a wordmark, 72x72 for a square mark |
| **Aspect ratio** | Up to about 4:1. Wider gets capped by the 82 px width and renders shorter. Square marks are fine and render 20x20 |
| **Background** | **Must be transparent.** Rows are white, green-tinted when owned, and navy in dark mode |
| **File size** | Keep under ~10 KB. All 28 load once, then cache |
| **Shape** | Horizontal wordmarks read far better than square icons at 14 px |

Nothing breaks if a file is the wrong size — `object-fit: contain` scales it
down and preserves aspect ratio. Oversized files just waste bandwidth.

## Preparing a file

`tools/fix-logo.py` does the whole job — strips the background, trims, resizes
and optimises:

```bash
python3 tools/fix-logo.py raw-logo.png img/brands/topps.png --bg white
python3 tools/fix-logo.py img/brands/topps.png --check    # report, write nothing
```

Useful flags: `--bg white|black|auto|R,G,B`, `--tol N` (raise for soft edges,
lower if the logo itself starts vanishing), `--keep-holes` (only clear
background touching the border, so letter counters stay filled), `--height N`.

**Transparency is the one that actually bites.** A logo saved as RGB with an
opaque backdrop renders as a solid tile: wrong on white rows, wrong again on
the green owned rows and the navy dark-mode rows. Save as PNG-32 with alpha,
or use SVG. To check a file:

```bash
python3 -c "from PIL import Image; im=Image.open('donruss.png'); \
print(im.mode, im.size, im.getchannel('A').getextrema() if im.mode=='RGBA' else 'NO ALPHA')"
```

`RGBA` with an alpha range starting at 0 is what you want. `RGB`, or alpha
`(255, 255)`, means the background is baked in.

## Dark mode

Rows are `#0f2a68` navy in dark mode, so a black logo (Upper Deck, Nike, SP)
disappears. Two options:

1. Use a logo that reads on both — most brand logos in white or their brand
   colour work fine.
2. Supply a second file named `<slug>-dark.png`. When present it is used in
   dark mode automatically and the plain file is used in light mode. It is
   entirely optional; with only one file, that file is used in both.

## Fallback

Any brand with no file keeps its coloured wordmark chip, so adding logos a
few at a time is fine — there is no broken state in between.

These are third-party trademarks and none ship with this repo. Supply your
own copies. Using them to identify which company made a card is ordinary
descriptive use for a personal collection, but that call is yours.

## Slugs, by how many cards each covers

| Cards | Brand | Filename |
|---|---|---|
| 483 | Donruss | `donruss.png` |
| 420 | Topps | `topps.png` |
| 191 | Pacific | `pacific.png` |
| 167 | Fleer | `fleer.png` |
| 138 | Leaf | `leaf.png` |
| 116 | Upper Deck | `upperdeck.png` |
| 75 | Bowman | `bowman.png` |
| 74 | Stadium Club | `stadiumclub.png` |
| 69 | Star | `star.png` |
| 59 | Pinnacle | `pinnacle.png` |
| 46 | Panini | `panini.png` |
| 46 | SP | `sp.png` |
| 43 | Score | `score.png` |
| 38 | Ultra | `ultra.png` |
| 27 | SkyBox | `skybox.png` |
| 27 | Playoff | `playoff.png` |
| 25 | Collectors Choice | `collectorschoice.png` |
| 18 | Studio | `studio.png` |
| 15 | Classic | `classic.png` |
| 12 | Zenith | `zenith.png` |
| 11 | O-Pee-Chee | `opeechee.png` |
| 7 | Post | `post.png` |
| 5 | ProCards | `procards.png` |
| 4 | Sportflics | `sportflics.png` |
| 4 | Cracker Jack | `crackerjack.png` |
| 2 | Toys R Us | `toysrus.png` |
| 1 | Nike | `nike.png` |
| 1 | Kmart | `kmart.png` |
