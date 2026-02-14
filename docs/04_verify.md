# Verification Checklist (Build + Release)

Use this checklist after building the VM and before publishing an OVA link.

## 1) Boot + login
- [ ] VM boots to XFCE desktop without errors
- [ ] Login works with `nico` / `Nighthax`
- [ ] Desktop shows a clear safety warning (or README) about default password + authorized use

## 2) Security defaults
- [ ] SSH server is not installed OR is disabled and not running
  - Check: `systemctl status ssh` (should be inactive/not found)
- [ ] No hard-coded secrets besides the intentionally documented default password

## 3) Browser + bookmarks
- [ ] Firefox opens
- [ ] Bookmarks toolbar/folders are populated (Start Here, Network analysis, Forensics/IR, etc.)
- [ ] Homepage points to the intended start page (if set)

## 4) Tool presence
Run:
- [ ] `wireshark --version`
- [ ] `tcpdump --version`
- [ ] `tshark --version`
- [ ] `john --version`
- [ ] `ssdeep -V` (or `ssdeep --version` depending on package)
- [ ] `exiftool -ver`
- [ ] `binwalk --version`
- [ ] `foremost -V` (or run `foremost -h`)
- [ ] `gdb --version` and confirm GEF loads in gdb

## 5) Wireshark capture policy
- [ ] Capturing packets requires sudo (student is not in wireshark capture group)

## 6) Offline behavior (basic)
- [ ] Core tools run without needing to download additional dependencies
- [ ] Bookmarks and local docs are present even without internet

## 7) OVA export + integrity
- [ ] Export OVA from VMware
- [ ] Compute SHA256 and publish it alongside download link
- [ ] Test import in VMware Workstation Player (fresh import)
- [ ] (Optional) Test import in VirtualBox

## 8) Versioning
- [ ] Update README with the new OVA link + version
- [ ] Note changes in release notes / changelog
