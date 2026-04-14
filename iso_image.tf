resource "proxmox_storage_iso" "talos_image" {
  content_type = "import"
  storage      = "local"
  pve_node     = var.proxmox_target_node
  url          = var.talos_linux_iso_image_url
  filename     = var.talos_linux_iso_image_filename
}
