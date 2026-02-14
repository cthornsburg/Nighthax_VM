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

# Firefox policies (system-wide)
#
# We use a hosted HTTPS start page to avoid snap confinement / file:// access issues.
START_URL="https://nighthax.com"

POLICY_JSON=$(cat <<JSON
{
  "policies": {
    "Homepage": {
      "StartPage": "homepage",
      "URL": "${START_URL}"
    },
    "OverrideFirstRunPage": "${START_URL}",
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
