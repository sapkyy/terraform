terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc07"
    }
  }
}

provider "proxmox" {
  pm_api_url  = "https://pve.sapkyy.home:8006/api2/json"
  pm_user     = var.PM_USER
  pm_password = var.PM_PASS
}
