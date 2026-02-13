#!/usr/bin/env bash
set -euo pipefail

# Install core tools for the NighHax VM.
# DRAFT: exact package list will be finalized during build validation.

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y --no-install-recommends \
  git curl wget \
  jq ripgrep tmux p7zip-full \
  python3 python3-venv pipx \
  build-essential \
  tcpdump tshark wireshark \
  john \
  ssdeep \
  exiftool binwalk foremost \
  gdb \
  ca-certificates

apt-get clean
rm -rf /var/lib/apt/lists/*
