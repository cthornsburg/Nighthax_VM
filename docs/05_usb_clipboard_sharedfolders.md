# USB / clipboard / shared folders

This project assumes VirtualBox by default. VMware is optional if already installed.

## Clipboard (VirtualBox)
1) Install Guest Additions (see `docs/02_virtualbox_setup.md`)
2) In the running VM window (macOS: top menu bar), set:
   - Devices → Shared Clipboard → **Bidirectional**
   - Devices → Drag and Drop → **Bidirectional**

If it still fails, see: `docs/06_troubleshooting_faq.md` (Clipboard doesn’t work).

## USB passthrough (VirtualBox)
1) Install the VirtualBox **Extension Pack** (must match your VirtualBox version)
2) VM Settings → USB
   - Enable USB Controller
   - Prefer **USB 3.0 (xHCI)** unless a device requires 2.0
3) Start the VM, then Devices → USB → select the device

If it still fails, see: `docs/06_troubleshooting_faq.md` (USB device won’t attach).

## Shared folders (optional)
Not required for this project.

Preferred delivery method is `git clone` inside the VM.
Shared folders are useful for moving files in/out, but vary between hypervisors.
