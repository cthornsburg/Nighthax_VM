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

# -----------------------------
# Cosmetics: wallpaper + avatar
# -----------------------------

# Wallpaper (copied in by Packer file provisioner)
if [[ -f /tmp/nighthax-wallpaper.png ]]; then
  install -d /usr/share/backgrounds/nighthax
  install -m 0644 /tmp/nighthax-wallpaper.png /usr/share/backgrounds/nighthax/wallpaper.png

  # Preseed XFCE desktop wallpaper by writing the user config (no GUI session needed)
  install -d -m 0755 /home/nico/.config/xfce4/xfconf/xfce-perchannel-xml
  cat >/home/nico/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml <<'XML'
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
  chown -R nico:nico /home/nico/.config/xfce4
fi

# Avatar (AccountsService)
if [[ -f /tmp/nico-avatar.jpg ]]; then
  install -d /var/lib/AccountsService/icons
  install -m 0644 /tmp/nico-avatar.jpg /var/lib/AccountsService/icons/nico

  install -d /var/lib/AccountsService/users
  cat >/var/lib/AccountsService/users/nico <<'EOF'
[User]
Icon=/var/lib/AccountsService/icons/nico
EOF
fi

# -----------------------------
# Desktop "Start Here" content
# -----------------------------

install -d -m 0755 /etc/nighthax
cat >/etc/nighthax/START_HERE.txt <<'TXT'
NighHax VM — Start Here

1) This VM uses default classroom credentials:
   - Username: nico
   - Password: Nighthax

2) Use this VM ONLY for authorized learning and CTF practice.

3) Tip: Open Firefox and use the NCL-aligned bookmark folders.

(If you use this VM outside of class, change the password.)
TXT

install -d -m 0755 /home/nico/Desktop
cat >/home/nico/Desktop/READ_ME_FIRST.txt <<'TXT'
NighHax VM (classroom build)

- Default credentials:
  Username: nico
  Password: Nighthax

- Change the password if you use this VM outside of class.

- Only test systems you own or have explicit permission to test.

Open /etc/nighthax/START_HERE.txt for a short checklist.
TXT

cat >/home/nico/Desktop/Start-Here.desktop <<'DESKTOP'
[Desktop Entry]
Type=Link
Name=Start Here (NighHax)
URL=file:///etc/nighthax/START_HERE.txt
Icon=help-browser
DESKTOP

chmod 0644 /home/nico/Desktop/Start-Here.desktop /home/nico/Desktop/READ_ME_FIRST.txt
chown -R nico:nico /home/nico/Desktop

apt-get clean
rm -rf /var/lib/apt/lists/*
