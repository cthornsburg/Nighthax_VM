# VirtualBox setup (recommended)

## VM settings (baseline)
- RAM: 4096 MB
- CPU: 2 cores
- Disk: 60 GB (dynamic)
- Network: NAT
- Display: 128 MB video memory

## Clipboard / drag & drop
After installing Guest Additions:
- Devices → Shared Clipboard → Bidirectional
- Devices → Drag and Drop → Bidirectional

## USB passthrough
1) Install the **VirtualBox Extension Pack** (matches your VirtualBox version)
2) VM Settings → USB:
   - Enable USB Controller
   - Prefer **USB 3.0 (xHCI)** unless a device requires 2.0
3) Add a USB filter for the device (optional)

## Guest Additions (inside Linux)
Install guest additions to enable:
- auto-resize
- shared clipboard
- shared folders (optional)

If guest additions are already working, do not fight it—move on to the setup script.
