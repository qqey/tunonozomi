terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "2.9.14"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://192.168.1.5:8006/api2/json"
    resource "proxmox_lxc" "basic" {
        target_node  = "pve5amd"
        hostname     = "lxc-basic"
        ostemplate   = "nas:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
        password     = "BasicLXCContainer"
        unprivileged = true

        rootfs {
            storage = "local-lvm"
            size    = "4G"
        }

        network {
            name   = "eth0"
            bridge = "vmbr0"
            ip     = "dhcp"
        }
    }
}
