#!/usr/bin/env bash
set -euo pipefail

# Install core tools for the NighHax VM.

export DEBIAN_FRONTEND=noninteractive

apt-get update

# Core packages (expect to be available on Ubuntu + universe)
apt-get install -y --no-install-recommends \
  git curl wget \
  jq gron ripgrep tmux p7zip-full \
  python3 python3-venv pipx \
  build-essential \
  tcpdump tshark wireshark nmap \
  john \
  ssdeep \
  exiftool binwalk foremost whois dnsutils \
  poppler-utils \
  openssl \
  sqlitebrowser \
  libreoffice \
  gdb \
  ca-certificates

# Common CTF add-ons (best-effort)
for pkg in gobuster ffuf hashid fcrackzip steghide; do
  apt-get install -y --no-install-recommends "$pkg" || echo "[nighthax] note: $pkg not available in this repo set"
done

# Optional packages (best-effort; skip if not present in repos)
# bulk_extractor binary comes from bulk-extractor package (universe)
apt-get install -y --no-install-recommends bulk-extractor || echo "[nighthax] note: bulk-extractor not available in this repo set"

# volatility3 package name varies; prefer apt, fall back to pipx if needed.
# IMPORTANT: The setup script runs as root, but we want pipx-installed CLIs to land
# in the *student* user's home so they are on that user's PATH.
apt-get install -y --no-install-recommends volatility3 || \
  apt-get install -y --no-install-recommends python3-volatility3 || \
  (
    echo "[nighthax] note: volatility3 apt package not available; installing via pipx (user scope)";
    TARGET_USER="${NIGHHAX_TARGET_USER:-${SUDO_USER:-nico}}";
    sudo -u "$TARGET_USER" -H bash -lc 'pipx install -f volatility3 && pipx ensurepath'
  )

# Optional: Didier Stevens pdf-parser.py (best-effort)
# Many CTF writeups reference this script for PDF triage.
# Prefer the official GitHub raw file (DidierStevensSuite).
if command -v curl >/dev/null 2>&1; then
  install -d /opt/nighthax/bin
  PDFP_URL="https://raw.githubusercontent.com/DidierStevens/DidierStevensSuite/master/pdf-parser.py"
  curl -fsSL -o /opt/nighthax/bin/pdf-parser.py "$PDFP_URL" || true
  if [[ -s /opt/nighthax/bin/pdf-parser.py ]]; then
    chmod 0755 /opt/nighthax/bin/pdf-parser.py
    ln -sf /opt/nighthax/bin/pdf-parser.py /usr/local/bin/pdf-parser.py
  else
    echo "[nighthax] note: pdf-parser.py download failed ($PDFP_URL)"
  fi
fi

apt-get clean
rm -rf /var/lib/apt/lists/*
