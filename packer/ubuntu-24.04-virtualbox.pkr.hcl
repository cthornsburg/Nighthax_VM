// Packer template (WIP)
// Builds Ubuntu 24.04.x (live-server autoinstall) then provisions GUI + tools.
// Output: VirtualBox VM (export to OVA after build).

packer {
  required_plugins {
    virtualbox = {
      version = ">= 1.1.3"
      source  = "github.com/hashicorp/virtualbox"
    }
  }
}

variable "vm_name" {
  type    = string
  default = "Nighthax_VM"
}

variable "iso_url" {
  type    = string
  default = "https://releases.ubuntu.com/24.04/ubuntu-24.04.4-live-server-amd64.iso"
}

variable "iso_checksum" {
  type    = string
  // From https://releases.ubuntu.com/24.04/SHA256SUMS
  default = "sha256:e907d92eeec9df64163a7e454cbc8d7755e8ddc7ed42f99dbc80c40f1a138433"
}

source "virtualbox-iso" "ubuntu" {
  vboxmanage = [
    ["modifyvm", "{{.Name}}", "--vram", "64"],
    ["modifyvm", "{{.Name}}", "--graphicscontroller", "vmsvga"],
    ["modifyvm", "{{.Name}}", "--accelerate3d", "off"],
    ["modifyvm", "{{.Name}}", "--nictype1", "82540EM"],
    ["modifyvm", "{{.Name}}", "--uartmode1", "disconnected"],
    ["modifyvm", "{{.Name}}", "--audio", "none"]
  ]

  vm_name              = var.vm_name
  guest_os_type        = "Ubuntu_64"

  iso_url              = var.iso_url
  iso_checksum         = var.iso_checksum

  cpus                 = 2
  memory               = 4096
  disk_size            = 40960

  http_directory       = "packer/http"

  ssh_username         = "nico"
  ssh_password         = "Nighthax"
  ssh_timeout          = "45m"

  shutdown_command     = "echo 'packer' | sudo -S shutdown -P now"

  boot_wait            = "5s"
  boot_command = [
    "<esc><wait>",
    "e<wait>",
    "<down><down><down><end>",
    " autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/<wait>",
    "<f10><wait>"
  ]
}

build {
  sources = ["source.virtualbox-iso.ubuntu"]

  provisioner "shell" {
    scripts = [
      "scripts/provision/base-packages.sh",
      "scripts/provision/install-tools.sh",
      "scripts/provision/configure-desktop.sh",
      "scripts/provision/configure-firefox.sh",
      "scripts/provision/hardening.sh"
    ]
  }
}
