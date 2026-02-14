# Windows 11 prerequisites (host)

## Minimum recommended
- RAM: **8 GB** (16 GB strongly preferred)
- CPU: 4+ cores preferred (VM will use 2)
- Disk: 60+ GB free for the VM

## Required settings
- Enable CPU virtualization in BIOS/UEFI (Intel VT-x / AMD-V)

## Downloads
Pick one hypervisor:
- VirtualBox + Extension Pack (needed for reliable USB passthrough)
- VMware Workstation (if already available)

## Last-resort (performance / compatibility)
If VMs are extremely slow or unstable, Windows 11 security virtualization may be forcing a compatibility mode.

Only if needed (last resort), consider toggling:
- **Core Isolation → Memory integrity**
- Hyper-V / Virtual Machine Platform / Windows Hypervisor Platform

See: `docs/06_troubleshooting_faq.md`
