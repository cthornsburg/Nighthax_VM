# NighHax VM — Build Spec (DRAFT)

## Goals
- Beginner-friendly GUI VM for CTF + network-traffic analysis
- VMware-first build; exported artifact should be usable in VirtualBox
- Lightweight baseline; offline-capable for core tools
- Curated tools (no sqlmap, no metasploit)
- Strong browser bookmarks as built-in learning scaffolding

## Accounts
- Single user:
  - username: `nico`
  - password: `Nighthax`

## Safety defaults
- **No SSH server** installed/enabled by default.
- Show an explicit warning that the default credentials are for classroom use; change password if used elsewhere.
- Reminder: do not attack systems you do not own / lack permission to test.

## OS / Desktop
- Base: Ubuntu 24.04 LTS
- Desktop: XFCE (lightweight)
- Browser: Firefox (pre-seeded profile + bookmarks)

## Tools (installed in base image)
### Core workflow
- git, curl, wget, jq, ripgrep, tmux, p7zip
- python3 + venv + pipx
- build-essential

### Network analysis
- tcpdump
- tshark
- Wireshark GUI (capture requires sudo)

### Forensics
- exiftool
- binwalk
- foremost
- ssdeep
- md5sum (coreutils)

### Reverse / debugging
- gdb
- GEF (GDB Enhanced Features)

### Password cracking
- john

## Exclusions (explicit)
- sqlmap
- metasploit
- suricata
- security onion
- OWASP Juice Shop / WebGoat (ship as optional docs, not base)

## Optional add-ons (documented)
- NetworkMiner (optional)
- radare2 (optional)
- Heavy tooling (Ghidra, Burp, Docker, etc.) via optional install docs

## Wordlists strategy
- Ship a small curated set in `/opt/wordlists/`.
- Provide instructions to download/build larger wordlists (e.g., rockyou) when needed.

## Cosmetic / UX touches
- Use NighHax/Nico icon for:
  - desktop wallpaper
  - user avatar (nico)
  - desktop launcher icons
- Add a desktop "Start Here" folder with:
  - Quickstart
  - Rules/safety
  - Bookmarks overview

## Build tooling (planned)
- Packer build for VMware
- Provisioner scripts (shell)
- Export to OVA and test import in VirtualBox
