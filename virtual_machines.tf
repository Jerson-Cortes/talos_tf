resource "proxmox_virtual_environment_vm" "ctrl_plane" {
  for_each = { for node in var.controller_node_config : node.name => node }

  name      = each.value.name
  node_name = "pve"

  machine     = "q35"
  bios        = "ovmf"
  description = "Kubernetes server"

  agent {
    enabled = true
  }

  cpu {
    cores = 2
    type  = "host"
  }

  memory {
    dedicated = 4096
  }

  efi_disk {
    datastore_id = "local-zfs"
    type         = "4m"
  }

  disk {
    datastore_id = "local-zfs"
    import_from  = proxmox_virtual_environment_download_file.talos_image.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 20
  }

  initialization {
    datastore_id = "local-zfs"

    ip_config {
      ipv4 {
        address = each.value.ip_address
        gateway = var.vm_gateway
      }
    }
  }

  network_device {
    bridge = "vmbr0"
  }
}

resource "proxmox_virtual_environment_vm" "wkr" {
  for_each = { for node in var.worker_node_config : node.name => node }

  name      = each.value.name
  node_name = "pve"

  machine     = "q35"
  bios        = "ovmf"
  description = "Kubernetes server"

  agent {
    enabled = true
  }

  cpu {
    cores = 4
  }

  memory {
    dedicated = 16384
  }

  efi_disk {
    datastore_id = "local-zfs"
    type         = "4m"
  }

  disk {
    datastore_id = "local-zfs"
    import_from  = proxmox_virtual_environment_download_file.talos_image.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 20
  }

  initialization {
    datastore_id = "local-zfs"

    ip_config {
      ipv4 {
        address = each.value.ip_address
        gateway = var.vm_gateway
      }
    }
  }

  network_device {
    bridge = "vmbr0"
  }
}
