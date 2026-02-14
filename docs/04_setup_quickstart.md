# Setup quickstart

## 1) Install your base VM
- Install Xubuntu (recommended: **Xubuntu 24.04 LTS**) using: `docs/03_xubuntu_install_step_by_step.md`
- Update packages and reboot

## 2) Clone this repo inside the VM
```bash
git clone https://github.com/cthornsburg/Nighthax_VM.git
cd Nighthax_VM
```

## 3) Run the setup script
Recommended (works even if the execute bit is missing):
```bash
sudo bash ./nighthax-setup.sh
```

Alternative:
```bash
chmod +x ./nighthax-setup.sh
sudo ./nighthax-setup.sh
```

Profiles (optional):
- `ctf-min` (small + fast)
- `ctf-standard` (default)
- `ctf-full` (heavier installs)

Example:
```bash
sudo bash ./nighthax-setup.sh --profile ctf-full
```

## 4) Import bookmarks
See: `config/browser/bookmarks.html` and `config/browser/bookmarks.md`
