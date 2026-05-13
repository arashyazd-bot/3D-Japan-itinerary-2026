#!/bin/bash
# Operation: Honeymoon — Japan 3D Map launcher (macOS).
# Double-click this file. It starts a small local server and opens your browser.

cd "$(dirname "$0")"
PORT=8765

clear
cat <<'BANNER'
=================================================
   OPERATION: HONEYMOON  —  Japan 3D Map
   Arash & Laila  ·  April 17 – 30, 2026
=================================================

Starting local server...
Your browser will open in a moment.

When you're done exploring, just close this window
(or press Ctrl+C below).

BANNER

# Open the browser ~2s after the server starts
( sleep 2 && open "http://localhost:$PORT/" ) &

# Use Python 3 (preinstalled on macOS 13+) to serve the static files.
# `exec` so closing the window or pressing Ctrl+C kills the server cleanly.
exec python3 -m http.server "$PORT" 2>&1
