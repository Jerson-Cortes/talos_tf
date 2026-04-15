# Ansible hosts file generator

# resource "local_file" "ansible_inventory" {
#   filename = "${path.module}/outputs/hosts"
#
#   content = <<-EOT
#       [k8sctrl]
#       ${join("\n", [for controller in var.controller_node_config : split("/", controller.ip_address)[0]])}
#
#       [k8sctrl:vars]
#       ansible_user=ansible
#       ansible_connection=ssh
#
#       [k8swrk]
#       ${join("\n", [for worker in var.worker_node_config : split("/", worker.ip_address)[0]])}
#
#       [k8swrk:vars]
#       ansible_user=ansible
#       ansible_connection=ssh
#     EOT
#
#   file_permission = "0644"
#
# }
