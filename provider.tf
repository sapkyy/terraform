terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}

provider "proxmox" {
  pm_api_url  = "https://pve.sapkyy.home:8006/api2/json"
  pm_user     = var.PM_USER
  pm_password = var.PM_PASS
}
