# NighHax VM Setup Kit

A beginner-friendly, reproducible Linux VM setup for CTF competitions.

Project map: `PROJECT_MAP.md`

This repo assumes **students create their own base VM** on Windows 11 using **VirtualBox (standard)**, then pull customization via `git clone` inside the VM.

VMware Workstation is acceptable *only if already installed*; see `docs/90_vmware_optional.md`.

## Start here
1) Read: `docs/00_overview.md`
2) Windows 11 prereqs: `docs/01_windows11_prereqs.md`
3) VirtualBox setup: `docs/02_virtualbox_setup.md`
   - VMware optional (already installed): `docs/90_vmware_optional.md`
4) Install Xubuntu: `docs/03_xubuntu_install_step_by_step.md`
5) Run setup: `docs/04_setup_quickstart.md`
6) USB + clipboard: `docs/05_usb_clipboard_sharedfolders.md`
7) Troubleshooting: `docs/06_troubleshooting_faq.md`

## How to participate

Students are welcome to participate even if they are new to GitHub:

- Open an **issue** to ask a setup question, report a confusing step, suggest a tool/bookmark, or flag a broken link.
- Open a **pull request** when you already have a focused edit ready for review.
- Start with `docs/participation-guide.md` if you are unsure where to begin.
- See `CONTRIBUTING.md` for safety rules, especially around flags, credentials, target IPs, and restricted challenge content.

## CTF writeups / broader student hub
CTF writeups and broader program resources live in `nlc_cyber`:
- https://cthornsburg.github.io/nlc_cyber/

## Quick install (student)
```bash
git clone https://github.com/cthornsburg/Nighthax_VM.git
cd Nighthax_VM
sudo bash ./nighthax-setup.sh
```

(If you prefer, you can also do `chmod +x ./nighthax-setup.sh` then run `sudo ./nighthax-setup.sh`.)

Default profile is `ctf-standard`. (Advanced: `--profile ctf-min|ctf-full`.)

## What’s included
- Installed tools list (GUI + CLI): `docs/TOOLS_INSTALLED.md`
- Online tools + bookmark folders: `docs/TOOLS_ONLINE_BOOKMARKS.md`

## Status
In active development. Contributions welcome (see `CONTRIBUTING.md`).
