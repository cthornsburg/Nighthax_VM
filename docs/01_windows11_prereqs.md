# Windows 11 prerequisites (host)

## Minimum recommended
- RAM: **8 GB** (16 GB strongly preferred)
- CPU: 4+ cores preferred (VM will use 2)
- Disk: 60+ GB free for the VM

## Required settings
- Enable CPU virtualization in BIOS/UEFI (Intel VT-x / AMD-V)

## Downloads (standard)
- **VirtualBox (official):** https://www.virtualbox.org/wiki/Downloads
- **VirtualBox Extension Pack (official):** https://www.virtualbox.org/wiki/Downloads  
  (matches your VirtualBox version; needed for reliable USB 2/3 passthrough)

## Optional (already installed)
- VMware Workstation is acceptable if it’s already on your computer. See: `docs/90_vmware_optional.md`

## Last-resort (performance / compatibility)
If VMs are extremely slow or unstable, Windows 11 security virtualization may be forcing a compatibility mode.

Only if needed (last resort), consider toggling:
- **Core Isolation → Memory integrity**
- Hyper-V / Virtual Machine Platform / Windows Hypervisor Platform

See: `docs/06_troubleshooting_faq.md`
