# VMware Workstation setup (supported)

VMware is fine if you already use it. The bootstrap scripts are hypervisor-agnostic.

## VM settings (baseline)
- RAM: 4096 MB
- CPU: 2 cores
- Disk: 60 GB (dynamic)
- Network: NAT

## Clipboard
Typically enabled via VMware Tools.

## VMware Tools (inside Linux)
Install:
- `open-vm-tools`
- `open-vm-tools-desktop` (for desktop guests)

USB passthrough is handled in VMware VM settings.
