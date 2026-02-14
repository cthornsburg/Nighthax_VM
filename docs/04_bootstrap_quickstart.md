# Setup quickstart

## 1) Install your base VM
- Create an Ubuntu-family VM (recommended: **Xubuntu 24.04 LTS**)
- Update packages and reboot

## 2) Clone this repo inside the VM
```bash
git clone https://github.com/cthornsburg/Nighthax_VM.git
cd Nighthax_VM
```

## 3) Run the setup script
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
sudo ./nighthax-setup.sh --profile ctf-full
```

## 4) Import bookmarks
See: `config/browser/bookmarks.html` and `config/browser/bookmarks.md`
