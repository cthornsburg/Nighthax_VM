#!/usr/bin/env bash
set -euo pipefail

# Hardening/safety defaults for classroom VM.
#
# IMPORTANT: We no longer purge SSH by default. Many students won't need it,
# but instructors may enable it for troubleshooting.

# Disable SSH server (keep package installed)
if systemctl list-unit-files | grep -q '^ssh\.service'; then
  systemctl disable --now ssh || true
fi

# Remove temporary passwordless sudo (legacy)
rm -f /etc/sudoers.d/99-nico || true

# Visible classroom warning
install -d /etc/nighthax
cat >/etc/nighthax/CLASSROOM_WARNING.txt <<'TXT'
NighHax VM (classroom build)

- Default credentials are for classroom convenience.
  Username: nico
  Password: (set during install)

- Do NOT use this VM outside of class unless you change the password.

- Only test systems you own or have explicit permission to test.
TXT

# Also show on login banner (local console)
cat >/etc/motd <<'MOTD'
NighHax VM (classroom build)
- Default credentials are for classroom convenience.
- Change the password if you use this VM outside of class.
- Only test systems you own or have explicit permission to test.
MOTD
