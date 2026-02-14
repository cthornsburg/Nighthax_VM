# USB / clipboard / shared folders

## Clipboard
- VirtualBox: requires Guest Additions + setting Shared Clipboard to Bidirectional
- VMware: requires open-vm-tools(-desktop) + enabling clipboard features

## USB
- VirtualBox: Extension Pack + enable USB controller + optional filters
- VMware: attach USB device to the VM via VMware UI

## Shared folders (optional)
Not required for this project.

Preferred delivery method is `git clone` inside the VM.
Shared folders are useful for moving files in/out, but vary between hypervisors.
