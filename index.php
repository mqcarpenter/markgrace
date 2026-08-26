<?php require __DIR__ . '/db.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="theme-color" content="#0E3386">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<meta name="apple-mobile-web-app-title" content="Grace">
<meta name="description" content="Mark Grace baseball card collection tracker.">
<title>Mark Grace Card Tracker</title>
<link rel="stylesheet" href="assets/app.css?v=4">
</head>
<body>

<div id="gate" class="wrap hide">
  <form class="gate" id="gateForm">
    <div class="mark"></div>
    <h2>Mark Grace Tracker</h2>
    <p>Enter the passphrase to view and update your collection.</p>
    <input type="password" id="gatePass" placeholder="Passphrase" autocomplete="current-password" required>
    <button type="submit">Unlock</button>
    <p class="err" id="gateErr"></p>
  </form>
</div>

<div id="app" class="hide">

  <div class="masthead">
    <div class="wrap">
      <span class="brandline"><span class="dot"></span>Chicago Cubs &middot; 1988&ndash;2003</span>
      <h1>Mark Grace
        <span class="thin">Card collection tracker</span>
      </h1>
    </div>
  </div>

  <div class="wrap">
    <div class="bar">
      <div class="pct">
        <b id="pctNum">&mdash;</b>
        <span id="pctTxt">loading&hellip;</span>
      </div>
      <div class="track"><div class="fill" id="fill" style="width:0"></div></div>
    </div>

    <div class="sticky">
      <div class="searchwrap">
        <svg viewBox="0 0 20 20" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true">
          <circle cx="9" cy="9" r="6"/><path d="M13.5 13.5L18 18" stroke-linecap="round"/>
        </svg>
        <input class="search" id="q" type="search" placeholder="Search set, card #, year&hellip;" autocomplete="off">
      </div>
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
      <div>Tap a card to mark it owned. Saved to the database &mdash; your marks show up on every device.</div>
      <button id="theme" type="button">Toggle theme</button>
    </footer>
  </div>
</div>

<div id="toast" role="status" aria-live="polite"></div>
<script src="assets/app.js?v=4"></script>
</body>
</html>
