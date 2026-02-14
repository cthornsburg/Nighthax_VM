# Overview

This repo provides a **CTF VM setup kit** for NLC NighHax / cyber defense students.

## What this is
- Guidance for creating a base Linux VM using **VirtualBox** (standard)
  - Includes a step-by-step Xubuntu install walkthrough
  - Host OS can be **Windows 10/11**, **macOS**, or **Linux**
- Optional guidance if you already use VMware Workstation (not the default)
- A setup workflow: `git clone` inside the VM → run `nighthax-setup.sh`
- Curated browser bookmarks + recommended extensions
- Troubleshooting notes (including last-resort Windows 11 security setting changes)

## What this is NOT
- Not a prebuilt VM appliance (no OVA/VDI distribution)
- Not a replacement for CTF writeups (those live in the `nlc_cyber` repo)

## Supported baseline
- Guest OS: **Xubuntu 24.04 LTS** (recommended)
  - Other Ubuntu 24.04 LTS flavors may work, but Xubuntu is the documented baseline.
- Hypervisor (standard): **VirtualBox**
- VMware Workstation: supported only as an *already-installed* alternative (see `docs/90_vmware_optional.md`)

## CTF writeups
CTF writeups and broader program resources live here:
- https://cthornsburg.github.io/nlc_cyber/
