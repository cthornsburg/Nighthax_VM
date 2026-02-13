# Release Workflow (Maintainers)

This repo stores the build system and documentation. The OVA should be hosted externally.

## 1) Build
- Build the VM using Packer (see `docs/STUDENT_BUILD_WINDOWS.md`).

## 2) Verify
- Run through `docs/VERIFY.md`.

## 3) Export OVA
- Export to OVA from VMware.

## 4) Hash
On Windows PowerShell:
```powershell
Get-FileHash .\Nighthax_VM.ova -Algorithm SHA256
```

## 5) Publish
- Upload the OVA to the chosen hosting location.
- Update:
  - `docs/QUICKSTART_OVA.md` with the download URL + SHA256
  - `README.md` with the same link for non-builders

## 6) Keep history
- Record what changed (tools added/removed, bookmarks updated, bug fixes).
