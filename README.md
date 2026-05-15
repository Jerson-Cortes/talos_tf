# Proxmox Talos TF

A Terraform / OpenTofu configuration for setting up Talos Linux in Proxmox.

## IMPORTANT

[VM Configuration](https://docs.siderolabs.com/talos/v1.12/platform-specific-installations/virtualized-platforms/proxmox) recommended by Talos.

Getting the kubeconfig and talosconfig for this cluster can be done with `terraform output -raw kubeconfig > <desired-path-and-filename>` and `terraform output -raw talosconfig > <desired-path-and-filename>`.

In 'provision.tf' 'config_patches' is commented due to the name hostname being set through CloudInit.
