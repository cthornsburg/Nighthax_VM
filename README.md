# NighHax VM Setup Kit

A beginner-friendly, reproducible Linux VM setup for CTF competitions.

This repo assumes **students create their own base VM** on Windows 11 using **VirtualBox (standard)**, then pull customization via `git clone` inside the VM.

VMware Workstation is acceptable *only if already installed*; see `docs/90_vmware_optional.md`.

## Start here
1) Read: `docs/00_overview.md`
2) Windows 11 prereqs: `docs/01_windows11_prereqs.md`
3) VirtualBox setup: `docs/02_virtualbox_setup.md`
   - VMware optional (already installed): `docs/90_vmware_optional.md`
4) Run setup: `docs/04_bootstrap_quickstart.md`
5) USB + clipboard: `docs/05_usb_clipboard_sharedfolders.md`
6) Troubleshooting: `docs/06_troubleshooting_faq.md`

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

## Status
In active development. Contributions welcome (see `CONTRIBUTING.md`).
