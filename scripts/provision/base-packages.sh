#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y --no-install-recommends \
  ca-certificates \
  sudo \
  unzip

# Intentionally NOT installing openssh-server.
apt-get purge -y openssh-server || true

apt-get clean
rm -rf /var/lib/apt/lists/*
