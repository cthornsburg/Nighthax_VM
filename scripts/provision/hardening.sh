#!/usr/bin/env bash
set -euo pipefail

# Hardening/safety defaults for classroom VM.

# Remove SSH server (was enabled for Packer provisioning)
if dpkg -s openssh-server >/dev/null 2>&1; then
  systemctl disable --now ssh || true
  apt-get purge -y openssh-server || true
  apt-get autoremove -y || true
fi

# Remove temporary passwordless sudo
rm -f /etc/sudoers.d/99-nico || true

# Visible classroom warning
install -d /etc/nighthax
cat >/etc/nighthax/CLASSROOM_WARNING.txt <<'TXT'
NighHax VM (classroom build)

- Default credentials are for classroom convenience.
  Username: nico
  Password: Nighthax

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
