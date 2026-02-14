#!/usr/bin/env bash
set -euo pipefail

# Desktop extras (student-facing shortcuts/docs).
#
# We are deferring theme/wallpaper cosmetics for now, but we *do* place two
# reference files on the Desktop so students can quickly see what's installed
# and what online tools are bookmarked.

PROFILE="${1:-ctf-standard}"
TARGET_USER="${NIGHHAX_TARGET_USER:-${SUDO_USER:-nico}}"
TARGET_HOME="$(getent passwd "$TARGET_USER" | cut -d: -f6 || true)"

if [[ -z "$TARGET_HOME" || ! -d "$TARGET_HOME" ]]; then
  echo "[nighthax] desktop_setup: could not resolve home for user: $TARGET_USER" >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

DESKTOP_DIR="${TARGET_HOME}/Desktop"
install -d -m 0755 "$DESKTOP_DIR"

# Login avatar (AccountsService) — reliable and low-risk cosmetic.
AVATAR_SRC="${REPO_ROOT}/assets/branding/nico-icon.jpg"
if [[ -f "$AVATAR_SRC" ]]; then
  install -d /var/lib/AccountsService/icons
  install -m 0644 "$AVATAR_SRC" "/var/lib/AccountsService/icons/${TARGET_USER}"

  install -d /var/lib/AccountsService/users
  cat >"/var/lib/AccountsService/users/${TARGET_USER}" <<EOF
[User]
Icon=/var/lib/AccountsService/icons/${TARGET_USER}
EOF
fi

# Copy the canonical docs onto the Desktop as .txt for easy access.
# (If these files move in the repo, update here.)
if [[ -f "${REPO_ROOT}/docs/TOOLS_INSTALLED.md" ]]; then
  install -m 0644 "${REPO_ROOT}/docs/TOOLS_INSTALLED.md" "${DESKTOP_DIR}/NighHax_Tools_Installed.txt"
fi

if [[ -f "${REPO_ROOT}/docs/TOOLS_ONLINE_BOOKMARKS.md" ]]; then
  install -m 0644 "${REPO_ROOT}/docs/TOOLS_ONLINE_BOOKMARKS.md" "${DESKTOP_DIR}/NighHax_Online_Tools_and_Bookmarks.txt"
fi

chown -R "${TARGET_USER}:${TARGET_USER}" "$DESKTOP_DIR"

echo "[nighthax] desktop_setup: placed tool reference files on Desktop"
