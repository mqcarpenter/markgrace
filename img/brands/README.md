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
| **Rendered at** | 14 px tall, 64 px wide maximum |
| **Supply at** | ~120x40 px (PNG). Phones are 2-3x, so at least 42 px tall |
| **Aspect ratio** | Up to about 4.6:1. Wider gets capped by the 64 px width and renders shorter |
| **Background** | **Must be transparent.** Rows are white, green-tinted when owned, and navy in dark mode |
| **File size** | Keep under ~10 KB. All 28 load once, then cache |
| **Shape** | Horizontal wordmarks read far better than square icons at 14 px |

Nothing breaks if a file is the wrong size — `object-fit: contain` scales it
down and preserves aspect ratio. Oversized files just waste bandwidth.

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
