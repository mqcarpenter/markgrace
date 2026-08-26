#!/usr/bin/env python3
"""
Prepare a brand logo for img/brands/.

Strips a flat background to transparency, trims the surrounding space, scales
to the size the page actually renders, and writes an optimised PNG.

    python3 tools/fix-logo.py topps-raw.png img/brands/topps.png
    python3 tools/fix-logo.py raw.png out.png --bg white
    python3 tools/fix-logo.py raw.png out.png --bg auto --tol 40
    python3 tools/fix-logo.py raw.png out.png --keep-holes

Options
  --bg white|black|auto|R,G,B   Colour to remove. "auto" samples the corners.
                                Default: auto.
  --tol N                       How far a pixel may differ and still count as
                                background, 0-255. Default 32. Raise it for
                                JPEG-ish edges, lower it if the logo itself
                                starts disappearing.
  --keep-holes                  Only clear background connected to the border,
                                so enclosed areas (letter counters) stay filled.
  --height N                    Output height in px. Default 72 (3x the 20px
                                the page renders, for retina screens).
  --check                       Report on a file without writing anything.
"""
import argparse, sys
from collections import deque

try:
    from PIL import Image
except ImportError:
    sys.exit("Pillow is required:  pip3 install Pillow")


def describe(path):
    im = Image.open(path)
    alpha = "none"
    if im.mode in ("RGBA", "LA"):
        lo, hi = im.getchannel("A").getextrema()
        alpha = f"{lo}-{hi}" + ("  (opaque - background is baked in)" if lo == 255 else "  (transparent)")
    ratio = im.width / im.height
    rw = min(82, round(20 * ratio))
    rh = 20 if ratio <= 82 / 20 else round(82 / ratio)
    print(f"  {path}")
    print(f"    {im.width}x{im.height}  mode={im.mode}  alpha={alpha}")
    print(f"    aspect {ratio:.2f}:1  ->  renders {rw}x{rh}px on the card row")
    return im


def main():
    ap = argparse.ArgumentParser(add_help=True)
    ap.add_argument("src")
    ap.add_argument("dest", nargs="?")
    ap.add_argument("--bg", default="auto")
    ap.add_argument("--tol", type=int, default=32)
    ap.add_argument("--height", type=int, default=72)
    ap.add_argument("--keep-holes", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()

    im = describe(a.src)
    if a.check:
        return
    if not a.dest:
        sys.exit("give an output path, or pass --check")

    im = im.convert("RGBA")
    w, h = im.size
    px = im.load()

    if a.bg == "auto":
        corners = [px[0, 0], px[w - 1, 0], px[0, h - 1], px[w - 1, h - 1]]
        target = tuple(sum(c[i] for c in corners) // 4 for i in range(3))
    elif a.bg == "white":
        target = (255, 255, 255)
    elif a.bg == "black":
        target = (0, 0, 0)
    else:
        target = tuple(int(v) for v in a.bg.split(","))
    print(f"  removing background rgb{target} with tolerance {a.tol}"
          + ("  (border-connected only)" if a.keep_holes else ""))

    def close(p):
        return max(abs(p[0] - target[0]), abs(p[1] - target[1]), abs(p[2] - target[2])) <= a.tol

    cleared = 0
    if a.keep_holes:
        seen = [[False] * h for _ in range(w)]
        q = deque()
        for x in range(w):
            q.append((x, 0)); q.append((x, h - 1))
        for y in range(h):
            q.append((0, y)); q.append((w - 1, y))
        while q:
            x, y = q.popleft()
            if x < 0 or y < 0 or x >= w or y >= h or seen[x][y]:
                continue
            seen[x][y] = True
            if not close(px[x, y]):
                continue
            px[x, y] = (0, 0, 0, 0); cleared += 1
            q.extend([(x + 1, y), (x - 1, y), (x, y + 1), (x, y - 1)])
    else:
        for y in range(h):
            for x in range(w):
                if close(px[x, y]):
                    px[x, y] = (0, 0, 0, 0); cleared += 1

    if cleared == 0:
        print("  WARNING: nothing matched the background colour. Try --bg white,"
              " --bg black, an explicit R,G,B, or a larger --tol.")

    box = im.getbbox()
    if box:
        im = im.crop(box)
    im = im.resize((max(1, round(im.width * a.height / im.height)), a.height), Image.LANCZOS)
    im.save(a.dest, optimize=True)

    import os
    print(f"  wrote {a.dest}  {im.width}x{im.height}  {os.path.getsize(a.dest) // 1024} KB")
    lo, _ = im.getchannel("A").getextrema()
    print("  alpha OK" if lo == 0 else "  WARNING: still fully opaque")


if __name__ == "__main__":
    main()
