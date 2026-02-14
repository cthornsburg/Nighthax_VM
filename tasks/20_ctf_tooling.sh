#!/usr/bin/env bash
set -euo pipefail

# Install core tools for the NighHax VM.
# DRAFT: exact package list will be finalized during build validation.

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
  sqlitebrowser \
  gdb \
  ca-certificates

# Optional packages (best-effort; skip if not present in repos)
# bulk_extractor binary comes from bulk-extractor package (universe)
apt-get install -y --no-install-recommends bulk-extractor || echo "[nighthax] note: bulk-extractor not available in this repo set"

# volatility3 package name varies; prefer apt, fall back to pipx if needed
apt-get install -y --no-install-recommends volatility3 || \
  apt-get install -y --no-install-recommends python3-volatility3 || \
  (echo "[nighthax] note: volatility3 apt package not available; installing via pipx" && pipx install volatility3)

apt-get clean
rm -rf /var/lib/apt/lists/*
