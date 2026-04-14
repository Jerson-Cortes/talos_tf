variable "virtual_environment_endpoint" {
  type        = string
  sensitive   = true
  description = "The Proxmox API endpoint"
}

variable "virtual_environment_api_token" {
  type        = string
  sensitive   = true
  description = "The Proxmox API token"
}

variable "virtual_environment_user" {
  type        = string
  sensitive   = true
  description = "The Proxmox user"
}

# ISO variables

variable "talos_linux_iso_image_url" {
  type        = string
  description = "Talos linux download iso image URL"
}

variable "talos_linux_iso_image_filename" {
  type        = string
  description = "Filename of Talos linux image saved in Proxmox"
}

variable "proxmox_target_node" {
  type        = string
  description = "Filename of Talos linux image saved in Proxmox"
}

# VMs configuration

variable "vm_timezone" {
  type        = string
  description = "The VM gateway"
}

variable "vm_gateway" {
  type        = string
  description = "The VM gateway"
}

# TBD

variable "controller_node_config" {
  type = list(ip_address = string)
}

variable "worker_node_config" {
  type = list(ip_address = string)
}
