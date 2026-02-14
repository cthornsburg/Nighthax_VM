# VMware Workstation (optional)

VirtualBox is the **standard** for this project (that’s what our screenshots/instructions assume).

VMware Workstation is acceptable **only if it’s already installed** on your Windows host.
The bootstrap scripts are hypervisor-agnostic.

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
