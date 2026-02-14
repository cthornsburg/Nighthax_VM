#!/usr/bin/env bash
set -euo pipefail

# Configure Firefox default homepage/policies and provide a local "Start Here" page.
#
# Rationale: avoid desktop clutter; provide onboarding in the browser.

PROFILE="${1:-ctf-standard}"
TARGET_USER="${NIGHHAX_TARGET_USER:-${SUDO_USER:-nico}}"
TARGET_HOME="$(getent passwd "$TARGET_USER" | cut -d: -f6 || true)"

if [[ -z "$TARGET_HOME" || ! -d "$TARGET_HOME" ]]; then
  echo "[nighthax] browser_setup: could not resolve home for user: $TARGET_USER" >&2
  exit 1
fi

# Local start page
install -d /etc/nighthax
cat >/etc/nighthax/start-here.html <<'HTML'
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>NighHax — Start Here</title>
  <style>
    body { font-family: system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, sans-serif; margin: 2rem; max-width: 960px; }
    code, pre { background: #f4f4f4; padding: .2rem .4rem; border-radius: 4px; }
    .card { border: 1px solid #ddd; border-radius: 10px; padding: 1rem 1.2rem; margin: 1rem 0; }
    h1 { margin-top: 0; }
  </style>
</head>
<body>
  <h1>NighHax VM — Start Here</h1>

  <div class="card">
    <h2>Rules</h2>
    <ul>
      <li>Only test systems you own or have explicit permission to test.</li>
      <li>If you use this VM outside of class, change your password.</li>
    </ul>
  </div>

  <div class="card">
    <h2>Bootstrap (tools install)</h2>
    <pre><code>git clone https://github.com/cthornsburg/Nighthax_VM.git
cd Nighthax_VM
sudo ./bootstrap/bootstrap.sh --profile ctf-standard</code></pre>
  </div>

  <div class="card">
    <h2>Bookmarks</h2>
    <p>See the curated bookmarks list in the repo:</p>
    <ul>
      <li><code>Nighthax_VM/config/browser/bookmarks.md</code></li>
      <li>Import file: <code>Nighthax_VM/config/browser/bookmarks.html</code> (if provided)</li>
    </ul>
  </div>

  <div class="card">
    <h2>CTF writeups + student hub</h2>
    <p><a href="https://cthornsburg.github.io/nlc_cyber/">https://cthornsburg.github.io/nlc_cyber/</a></p>
  </div>
</body>
</html>
HTML

# Firefox policies (system-wide)
# Works for deb-based Firefox; often works for snap as well.
POLICY_JSON=$(cat <<'JSON'
{
  "policies": {
    "Homepage": {
      "StartPage": "homepage",
      "URL": "file:///etc/nighthax/start-here.html"
    },
    "OverrideFirstRunPage": "file:///etc/nighthax/start-here.html",
    "DisableTelemetry": true
  }
}
JSON
)

install -d /etc/firefox/policies
printf '%s\n' "$POLICY_JSON" >/etc/firefox/policies/policies.json

# Also attempt snap policy location (best-effort; may not exist)
if [[ -d /var/snap/firefox/common ]]; then
  install -d /var/snap/firefox/common/policies/managed
  printf '%s\n' "$POLICY_JSON" >/var/snap/firefox/common/policies/managed/policies.json
fi
