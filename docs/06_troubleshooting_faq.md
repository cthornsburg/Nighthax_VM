# Troubleshooting FAQ

## VM is painfully slow
1) Confirm the VM has at least 2 CPU cores + 4 GB RAM
2) Close heavy apps on Windows (Chrome, Teams)
3) Ensure virtualization is enabled in BIOS/UEFI

### Last resort: Windows 11 virtualization-based security (VBS)
If VirtualBox/VMware are running in a compatibility mode, performance can be unusable.

Only if needed, consider toggling:
- Windows Security → Device Security → Core isolation → **Memory integrity**
- Windows Features: Hyper-V / Virtual Machine Platform / Windows Hypervisor Platform

Document and revert if your organization requires these controls.

## Clipboard doesn’t work
- VirtualBox: install Guest Additions and set Shared Clipboard to Bidirectional
- VMware: install open-vm-tools-desktop

## USB device won’t attach
- VirtualBox: install Extension Pack; enable USB controller (2.0/3.0) and try a USB filter
- VMware: attach device via VMware removable devices menu

## apt is locked / dpkg interrupted
- Wait for background updates to finish, or reboot and re-run the setup script
