# Proxmox variables

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
  description = "PVE node"
}

variable "cluster_name" {
  type        = string
  description = "Name of the k8s cluster"
}

variable "vm_gateway" {
  type        = string
  description = "The VM gateway"
}

variable "node_data" {
  type = object({
    controlplanes = map(object({
      install_disk  = string
      install_image = string
      hostname      = optional(string)
    }))
    workers = map(object({
      install_disk  = string
      install_image = string
      hostname      = optional(string)
    }))
  })
}
