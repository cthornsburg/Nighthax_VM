# Bootstrap quickstart

## 1) Install your base VM
- Create an Ubuntu-family VM (recommended: **Xubuntu 24.04 LTS**)
- Update packages and reboot

## 2) Clone this repo inside the VM
```bash
git clone https://github.com/cthornsburg/Nighthax_VM.git
cd Nighthax_VM
```

## 3) Run the bootstrap
```bash
chmod +x bootstrap/bootstrap.sh
./bootstrap/bootstrap.sh --profile ctf-standard
```

Profiles:
- `ctf-min` (small + fast)
- `ctf-standard` (recommended)
- `ctf-full` (heavier installs)

## 4) Import bookmarks
See: `config/browser/bookmarks.html` and `config/browser/bookmarks.md`
