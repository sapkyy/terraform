resource "proxmox_lxc" "plex" {
  target_node  = "pve"
  hostname     = "plex"
  vmid         = "103"
  memory       = "2048"
  cores        = "4"
  ostemplate   = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
  password     = var.LXC_PASS
  unprivileged = true
  start        = true
  onboot       = true
  rootfs {
    storage = "local-zfs"
    size    = "4G"
  }
  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }
}