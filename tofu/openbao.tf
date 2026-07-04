# resource "proxmox_virtual_environment_container" "openbao" {
#     vm_id         = "153"
#     node_name     = "proxima"
#     started       = true
#     unprivileged  = true
#     start_on_boot = true

#     cpu {
#         cores        = 2
#     }

#     disk {
#         datastore_id  = "local"
#         size          = 8
#     }

#     initialization {
#         hostname = "openbao"

#         ip_config {
#             ipv4 {
#               address = "172.16.0.153/24"
#               gateway = "172.16.0.1"
#             }
#         }
#         user_account {
#           keys = [
#             "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEqHRsQleFevrmSKxKfraXgJ5a5HnAFf9EMfl39ab8le root@North"
#           ]
#           password = "openbao"
#         }
#     }

#     memory {
#         dedicated = 2048
#         swap      = 512
#     }

#     network_interface {
#         bridge      = "vmbr1"
#         enabled     = true
#         firewall    = true
#         name        = "eth0"
#     }

#     operating_system {
#         template_file_id = "local-storage:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
#         type = "debian"
#     }
#     features {
#         nesting = true
#     }
# }

# resource "proxmox_virtual_environment_firewall_options" "openbao" {
#   depends_on = [proxmox_virtual_environment_container.openbao]

#   node_name = proxmox_virtual_environment_container.openbao.node_name
#   vm_id     = proxmox_virtual_environment_container.openbao.vm_id

#   dhcp          = false
#   enabled       = true
#   ipfilter      = false
#   log_level_in  = "nolog"
#   log_level_out = "nolog"
#   macfilter     = true
#   ndp           = false
#   input_policy  = "ACCEPT"
#   output_policy = "ACCEPT"
#   radv          = false
# }

# resource "proxmox_virtual_environment_firewall_rules" "openbao" {
#   depends_on = [
#     proxmox_virtual_environment_container.openbao,
#     proxmox_virtual_environment_cluster_firewall_security_group.isolate,
#   ]

#   node_name = proxmox_virtual_environment_container.openbao.node_name
#   vm_id     = proxmox_virtual_environment_container.openbao.vm_id

#   rule {
#     security_group = proxmox_virtual_environment_cluster_firewall_security_group.isolate.name
#   }
# }
