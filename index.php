<?php require __DIR__ . '/db.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="theme-color" content="#0f1115">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-title" content="Grace">
<title>Mark Grace Card Tracker</title>
<link rel="stylesheet" href="assets/app.css?v=2">
</head>
<body>

<div class="wrap hide" id="gate">
  <form class="gate" id="gateForm">
    <h2>Mark Grace Tracker</h2>
    <p>Enter the passphrase to view and edit your collection.</p>
    <input type="password" id="gatePass" placeholder="Passphrase" autocomplete="current-password" required>
    <button type="submit">Unlock</button>
    <p class="err" id="gateErr"></p>
  </form>
</div>

<div class="wrap hide" id="app">
  <header class="top">
    <h1>Mark Grace Card Tracker</h1>
    <p class="sub">Base, inserts and parallels — no autos or relics. Tap a card to mark it owned.</p>
  </header>

  <div class="bar">
    <div class="pct"><b id="pctNum">—</b><span id="pctTxt">loading…</span></div>
    <div class="track"><div class="fill" id="fill" style="width:0"></div></div>
  </div>

  <div class="sticky">
    <input class="search" id="q" type="search" placeholder="Search set, card #, year…" autocomplete="off">
    <div class="chips" id="statusChips">
      <button class="chip" type="button" data-f="all"    aria-pressed="true">All</button>
      <button class="chip" type="button" data-f="needed" aria-pressed="false">Needed</button>
      <button class="chip" type="button" data-f="owned"  aria-pressed="false">Owned</button>
    </div>
    <div class="chips" id="yearChips"></div>
  </div>

  <main id="list"></main>
  <div class="empty hide" id="empty">No cards match.</div>

  <footer>
    <div>Saved to the database — your marks show up on every device.</div>
    <button id="theme" type="button">Toggle theme</button>
  </footer>
</div>

<div id="toast" role="status" aria-live="polite"></div>
<script src="assets/app.js?v=2"></script>
</body>
</html>
