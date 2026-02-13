// Packer template (DRAFT)
// Builds Ubuntu 24.04 LTS + XFCE for VMware.
//
// NOTE: This is scaffolding. We will finalize once we confirm:
// - Ubuntu ISO URL + checksum
// - VMware builder expectations on Windows
// - Autoinstall seed method (http) and credentials

packer {
  required_plugins {
    vmware = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/vmware"
    }
  }
}

variable "vm_name" {
  type    = string
  default = "NighHax_VM"
}

variable "iso_url" {
  type    = string
  default = ""
}

variable "iso_checksum" {
  type    = string
  default = ""
}

source "vmware-iso" "ubuntu" {
  vm_name          = var.vm_name
  guest_os_type    = "ubuntu-64"

  iso_url          = var.iso_url
  iso_checksum     = var.iso_checksum

  communicator     = "ssh"
  ssh_username     = "nico"
  ssh_password     = "Nighthax"

  // We'll implement autoinstall + SSH provisioning during the build.
  // For now, placeholders only.
}

build {
  sources = ["source.vmware-iso.ubuntu"]

  provisioner "shell" {
    scripts = [
      "../scripts/provision/base-packages.sh",
      "../scripts/provision/install-tools.sh",
      "../scripts/provision/configure-desktop.sh",
      "../scripts/provision/configure-firefox.sh",
      "../scripts/provision/hardening.sh"
    ]
  }
}
