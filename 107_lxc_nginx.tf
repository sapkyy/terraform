resource "proxmox_lxc" "nginx" {
  target_node  = "pve"
  hostname     = "nginx"
  vmid         = "107"
  memory       = "512"
  cores        = "1"
  ostemplate   = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  password     = var.LXC_PASS
  unprivileged = true
  start        = true
  onboot       = true
  nameserver   = "192.168.31.1"
  searchdomain = "sapkyy.home"

  rootfs {
    storage = "local-zfs"
    size    = "4G"
  }

  features {
    nesting = true
    keyctl  = true
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }

  ssh_public_keys = var.SSH_PUB_KEY

  lifecycle {
    ignore_changes = [
      password
    ]
  }
}
