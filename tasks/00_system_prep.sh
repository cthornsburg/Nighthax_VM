#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y --no-install-recommends \
  ca-certificates \
  sudo \
  unzip \
  software-properties-common

# Enable Ubuntu "universe" repo (many CTF/DFIR packages live here)
add-apt-repository -y universe
apt-get update

# Intentionally NOT installing openssh-server.
# keep openssh-server during build (packer provisioning); remove in hardening.sh

apt-get clean
rm -rf /var/lib/apt/lists/*
