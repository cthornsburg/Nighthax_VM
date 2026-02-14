# Verification checklist (student build)

Use this checklist after installing Xubuntu and running `nighthax-setup.sh`.

## 1) Boot + login
- [ ] VM boots to the desktop without errors
- [ ] Student can log in with the account they created during install

## 2) Network + updates
- [ ] Internet works in the VM (NAT is fine)
- [ ] `sudo apt update` works without errors

## 3) Browser + bookmarks
- [ ] Firefox opens
- [ ] Homepage points to https://nighthax.com
- [ ] Bookmarks toolbar is visible
- [ ] Bookmark folders are populated (NCL categories)

## 4) Tool presence (quick smoke tests)
Run:
- [ ] `nmap --version`
- [ ] `wireshark --version`
- [ ] `tshark --version`
- [ ] `tcpdump --version`
- [ ] `jq --version`
- [ ] `rg --version`
- [ ] `sqlitebrowser --version` (or open DB Browser for SQLite from the menu)
- [ ] `libreoffice --version`

## 5) SSH stance (recommended default)
- [ ] SSH server is disabled by default
  - Check: `systemctl is-enabled ssh` → `disabled` (if installed)
  - Check: `systemctl is-active ssh` → `inactive`

## 6) Desktop reference files
- [ ] Desktop contains:
  - `NighHax_Tools_Installed.txt`
  - `NighHax_Online_Tools_and_Bookmarks.txt`

## 7) Common failure checks
- [ ] Setup script can be re-run safely: `sudo bash ./nighthax-setup.sh`
- [ ] If apt is locked, reboot and retry
