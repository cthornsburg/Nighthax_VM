#!/usr/bin/env bash
set -euo pipefail

# Hardening/safety defaults for classroom VM.

# Prefer: do not ship SSH server at all.
# If present for any reason, disable it.
if systemctl list-unit-files | grep -q '^ssh\.service'; then
  systemctl disable --now ssh || true
fi

# Add a visible classroom warning (placeholder). We'll implement a nicer UX (desktop file + first-login notice).
cat >/etc/motd <<'MOTD'
NighHax VM (classroom build)
- Default credentials are for classroom convenience.
- Change the password if you use this VM outside of class.
- Only test systems you own or have explicit permission to test.
MOTD
