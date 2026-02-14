# Xubuntu install (step-by-step)

This walkthrough is designed for students who have never installed a Linux VM before.

## Official downloads (authorized)
- Xubuntu downloads page (official): https://xubuntu.org/download/
- Xubuntu 24.04 (Noble) ISO directory (official Ubuntu cdimages):
  https://cdimages.ubuntu.com/xubuntu/releases/noble/release/
- SHA256SUMS (official):
  https://cdimages.ubuntu.com/xubuntu/releases/noble/release/SHA256SUMS

Recommended ISO: **Xubuntu 24.04.x LTS Desktop (64-bit)**.

## Before you start
- Complete: `docs/02_virtualbox_setup.md`
- VM baseline settings (recommended):
  - 2 CPU
  - 4096 MB RAM
  - 60 GB disk (dynamic)
  - NAT networking

## 1) Boot the ISO
Start the VM. You may see either:
- A boot menu (“Try or Install Xubuntu”), or
- The Xubuntu **Try** desktop

Either way is fine.

If you land on the desktop, double-click **Install Xubuntu**.

## 2) Installer screens (what to choose)

### Language
- Choose **English** (recommended for easier troubleshooting)

### Keyboard
- Keep the default (usually **English (US)**)

### Internet
- If it shows connected (usually wired/NAT), continue

### Install mode
- Choose **Interactive** (recommended)

### Apps to install
You will likely see:
- **Xubuntu Minimal** (recommended)
- Xubuntu Desktop

Choose **Xubuntu Minimal**.

### Proprietary / third-party software
You may see checkboxes like:
- Install 3rd party software for graphics and Wi‑Fi hardware
- Download and install support for additional media formats

Recommended: enable these (reduces “why is my display weird” and codec friction).

### Disk setup
Choose:
- **Erase disk and install Xubuntu**

This only erases the **virtual disk** in your VM (not your Windows computer).

Do **not** choose “Manual installation” unless your instructor tells you to.

### Timezone
- Choose the correct timezone for your location

### Create account
Students should create their own account.
- Use a username you will remember
- Use a password you will remember (you’ll need it for `sudo`)

Note: the installer may force the computer name (hostname) to lowercase.

## 3) Installation finishes
During install, the screen may go black (screensaver/blank). This is normal.
Move the mouse to wake it.

When it says the install is complete, click **Restart now**.

If it appears frozen during reboot, press **Enter** once and wait.

## 4) Post-install updates (recommended)
After first login:

```bash
sudo apt update
sudo apt -y upgrade
sudo reboot
```

## 5) Next step
Proceed to: `docs/04_setup_quickstart.md`
