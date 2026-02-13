# Quickstart (Download the OVA)

This is the easiest option: download the prebuilt VM image and import it.

## What you need
- A modern Windows PC
- **VMware Workstation Player** (recommended) or VMware Workstation Pro
- Disk space: **40 GB free** (minimum)
- Memory: **8 GB RAM** recommended (VM can run at 2–4 GB depending on workload)

## Download
- OVA download link: **(maintainer will add)**
- SHA256 checksum: **(maintainer will add)**

## Verify the download (recommended)
Open PowerShell in the folder where you downloaded the OVA:

```powershell
Get-FileHash .\Nighthax_VM.ova -Algorithm SHA256
```

Compare the output hash to the published SHA256 checksum.

## Import into VMware
1) Open VMware Workstation Player
2) Click **Open a Virtual Machine**
3) Select the `.ova` file
4) Choose where to store the VM files
5) Finish the import

## First boot
- Username: `nico`
- Password: `Nighthax`

### Important safety notes
- This VM ships with a default password for classroom convenience.
- **Do not use this VM for anything outside the classroom/labs unless you change the password.**
- Only test systems you own or have explicit permission to test.

## Recommended VM settings
- CPU: 2 cores
- RAM: 4096 MB (minimum 2048 MB)
- Network: NAT is usually fine for beginners

## Troubleshooting
- If the VM feels slow: increase RAM to 4096–6144 MB and ensure virtualization is enabled in BIOS/UEFI.
- If networking is broken: try switching between NAT and Bridged.
