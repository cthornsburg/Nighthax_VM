#!/usr/bin/env bash
set -euo pipefail

# Desktop cosmetics + convenience defaults.
#
# This task assumes an Ubuntu/Xubuntu (XFCE) desktop is already present.
# It is safe to re-run.

PROFILE="${1:-ctf-standard}"
TARGET_USER="${NIGHHAX_TARGET_USER:-${SUDO_USER:-nico}}"
TARGET_HOME="$(getent passwd "$TARGET_USER" | cut -d: -f6 || true)"

if [[ -z "$TARGET_HOME" || ! -d "$TARGET_HOME" ]]; then
  echo "[nighthax] desktop_setup: could not resolve home for user: $TARGET_USER" >&2
  exit 1
fi

ASSET_WALLPAPER="/opt/nighthax/assets/nighthax-wallpaper.png"
ASSET_AVATAR="/opt/nighthax/assets/nico-icon.jpg"

# -----------------------------
# Install assets to stable paths
# -----------------------------
install -d /opt/nighthax/assets

# Wallpaper + avatar are stored in repo under assets/branding/.
# Copy them into /opt/nighthax/assets so paths are consistent.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

if [[ -f "${REPO_ROOT}/assets/branding/nighthax-wallpaper.png" ]]; then
  install -m 0644 "${REPO_ROOT}/assets/branding/nighthax-wallpaper.png" "$ASSET_WALLPAPER"
fi
if [[ -f "${REPO_ROOT}/assets/branding/nico-icon.jpg" ]]; then
  install -m 0644 "${REPO_ROOT}/assets/branding/nico-icon.jpg" "$ASSET_AVATAR"
fi

# -----------------------------
# Cosmetics: wallpaper + avatar
# -----------------------------

# Wallpaper
if [[ -f "$ASSET_WALLPAPER" ]]; then
  install -d /usr/share/backgrounds/nighthax
  install -m 0644 "$ASSET_WALLPAPER" /usr/share/backgrounds/nighthax/wallpaper.png

  # Preseed XFCE desktop wallpaper by writing the user config
  install -d -m 0755 "${TARGET_HOME}/.config/xfce4/xfconf/xfce-perchannel-xml"
  cat >"${TARGET_HOME}/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml" <<'XML'
<?xml version="1.0" encoding="UTF-8"?>
<channel name="xfce4-desktop" version="1.0">
  <property name="backdrop" type="empty">
    <property name="screen0" type="empty">
      <property name="monitor0" type="empty">
        <property name="workspace0" type="empty">
          <property name="color-style" type="int" value="0"/>
          <property name="image-path" type="string" value="/usr/share/backgrounds/nighthax/wallpaper.png"/>
          <property name="image-style" type="int" value="5"/>
        </property>
      </property>
    </property>
  </property>
</channel>
XML
fi

# Theme defaults (XFCE)
# We avoid fancy custom themes; use commonly-present Xubuntu themes.
install -d -m 0755 "${TARGET_HOME}/.config/xfce4/xfconf/xfce-perchannel-xml"
cat >"${TARGET_HOME}/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml" <<'XML'
<?xml version="1.0" encoding="UTF-8"?>
<channel name="xsettings" version="1.0">
  <property name="Net" type="empty">
    <property name="ThemeName" type="string" value="Greybird"/>
    <property name="IconThemeName" type="string" value="elementary-xfce"/>
  </property>
</channel>
XML

cat >"${TARGET_HOME}/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml" <<'XML'
<?xml version="1.0" encoding="UTF-8"?>
<channel name="xfwm4" version="1.0">
  <property name="general" type="empty">
    <property name="theme" type="string" value="Greybird"/>
  </property>
</channel>
XML

# Avatar (AccountsService)
if [[ -f "$ASSET_AVATAR" ]]; then
  install -d /var/lib/AccountsService/icons
  install -m 0644 "$ASSET_AVATAR" "/var/lib/AccountsService/icons/${TARGET_USER}"

  install -d /var/lib/AccountsService/users
  cat >"/var/lib/AccountsService/users/${TARGET_USER}" <<EOF
[User]
Icon=/var/lib/AccountsService/icons/${TARGET_USER}
EOF
fi

chown -R "${TARGET_USER}:${TARGET_USER}" "${TARGET_HOME}/.config/xfce4" || true

# NOTE: We intentionally do NOT drop desktop shortcuts or "Start Here" icons.
# Messages will be delivered via Firefox homepage/policies.
