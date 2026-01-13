resource "proxmox_vm_qemu" "outside" {
  name        = "outside"
  target_node = "pve"
  vmid        = 151
  memory      = 1024
  start_at_node_boot = true
  agent       = 1
  scsihw      = "virtio-scsi-pci"
  kvm         = true

  clone      = "ubuntu24-template"
  full_clone = true

  cpu {
    cores   = 2
    sockets = 1
    type    = "host"
  }

  disk {
    slot     = "scsi0"
    size     = "8G"
    type     = "disk"
    storage  = "local-zfs"
    iothread = false
    format   = "raw"
  }

  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }

  ciuser     = "ubuntu"
  cipassword = var.LXC_PASS
  sshkeys    = var.SSH_PUB_KEY
  ipconfig0  = "ip=dhcp"

  boot = "order=scsi0"

  startup_shutdown {
    shutdown_timeout = -1
    startup_delay    = -1
    order            = -1
  }
}
