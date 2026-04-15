resource "proxmox_virtual_environment_vm" "ctrl_plane" {
  for_each = var.node_data.controlplanes

  name      = format("%s-kubernetes-control-plane-%s", var.cluster_name, index(keys(var.node_data.controlplanes), each.key))
  node_name = var.proxmox_target_node

  machine     = "q35"
  bios        = "ovmf"
  description = "Talos ctrl plane node"

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
    file_id      = proxmox_download_file.talos_image.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 20
  }

  initialization {
    datastore_id = "local-zfs"

    ip_config {
      ipv4 {
        address = each.key
        gateway = var.vm_gateway
      }
    }
  }

  network_device {
    bridge = "vmbr0"
  }
}

resource "proxmox_virtual_environment_vm" "wkr" {
  for_each = var.node_data.workers

  name      = format("%s-kubernetes-worker-node-%s", var.cluster_name, index(keys(var.node_data.workers), each.key))
  node_name = var.proxmox_target_node

  machine     = "q35"
  bios        = "ovmf"
  description = "Talos wkr node"

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
    file_id      = proxmox_download_file.talos_image.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 20
  }

  initialization {
    datastore_id = "local-zfs"

    ip_config {
      ipv4 {
        address = each.key
        gateway = var.vm_gateway
      }
    }
  }

  network_device {
    bridge = "vmbr0"
  }
}
