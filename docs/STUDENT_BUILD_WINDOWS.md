# Build the NighHax VM on Windows (from this repo)

This guide is for students who want to build the VM themselves instead of downloading the OVA.

## What you need (Windows)

### Required
- Windows 10/11
- **VMware Workstation Player** (or Pro)
- **Packer** (HashiCorp)
- Internet access during the build (the goal VM is offline-capable, but the build process downloads packages)
- Disk space: **60+ GB free** recommended

### Recommended
- 8–16 GB RAM
- 4 CPU cores available

## Step 1 — Install VMware Workstation Player
- Download and install from VMware.
- Reboot if prompted.

## Step 2 — Install Packer

### Option A: Winget (if available)
```powershell
winget install HashiCorp.Packer
```

### Option B: Manual
- Download Packer from: https://developer.hashicorp.com/packer/downloads
- Unzip and add `packer.exe` to your PATH

Verify:
```powershell
packer --version
```

## Step 3 — Clone the repository

Option A (GitHub Desktop):
- Install GitHub Desktop
- File → Clone repository → paste repo URL

Option B (git CLI):
```powershell
git clone https://github.com/cthornsburg/Nighthax_VM.git
cd Nighthax_VM
```

## Step 4 — Build the VM

> NOTE: The exact build commands depend on the Packer template names in `packer/`.
> Maintainers will keep the commands below updated.

From PowerShell in the repo directory:

```powershell
cd packer
packer init .
packer validate .
packer build .
```

## Step 5 — Find the output

After a successful build, you will have a VMware VM output directory (exact path depends on the template). It will contain the VM configuration and virtual disk.

## Step 6 — Export to OVA (optional)

If you built a VMware VM and want to share it, export it to an OVA using VMware.

## What to verify after build
- Login works: `nico` / `Nighthax`
- SSH server is not running by default
- Firefox opens with the expected bookmarks
- Wireshark capture requires sudo
- Core tools exist (wireshark, tcpdump, tshark, john, ssdeep, exiftool, binwalk, foremost, gdb+GEF)

See: `docs/VERIFY.md`

## Common problems

### Packer can’t find VMware
- Ensure VMware Workstation Player is installed.
- Close VMware UI during the build.

### Slow builds
- The build downloads packages.
- Close other applications.

### Virtualization disabled
- Enable Intel VT-x/AMD-V in BIOS/UEFI.
