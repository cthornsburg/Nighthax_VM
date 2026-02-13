#!/usr/bin/env bash
set -euo pipefail

# Install a lightweight desktop environment (XFCE) and basic GUI tooling.
# We use Ubuntu live-server as the base for repeatable automation.

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y --no-install-recommends \
  xfce4 xfce4-goodies \
  lightdm \
  firefox \
  network-manager \
  xdg-utils \
  gnome-keyring

# Cosmetic placeholders (wallpaper + avatar) will be implemented next.

apt-get clean
rm -rf /var/lib/apt/lists/*
