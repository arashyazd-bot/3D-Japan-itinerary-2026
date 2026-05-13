#!/bin/bash
# Honeymoon Map Itinerary — local launcher
# Double-click this file to open the app in your default browser.

set -e

# Move to the folder this script lives in.
cd "$(dirname "$0")"

PORT=4173

# Find a free port if 4173 is in use.
while lsof -iTCP -sTCP:LISTEN -nP 2>/dev/null | grep -q ":${PORT} "; do
  PORT=$((PORT + 1))
done

# Pick a Python interpreter.
if command -v python3 >/dev/null 2>&1; then
  PY=python3
elif command -v python >/dev/null 2>&1; then
  PY=python
else
  osascript -e 'display alert "Python required" message "This app needs Python 3 to run a tiny local server.\n\nOn macOS, open Terminal and type:\n  xcode-select --install\n\nThat installs the developer tools (which include Python 3). Then double-click this command file again."'
  exit 1
fi

URL="http://localhost:$PORT/"

# Open the browser shortly after the server starts.
( sleep 1 && open "$URL" ) &

echo ""
echo "============================================="
echo "  Honeymoon Map Itinerary"
echo "============================================="
echo ""
echo "  Server running at: $URL"
echo "  Your browser should open automatically."
echo ""
echo "  To stop the app: close this Terminal window"
echo "                   (or press Control + C)"
echo ""
echo "============================================="
echo ""

exec "$PY" -m http.server "$PORT"
