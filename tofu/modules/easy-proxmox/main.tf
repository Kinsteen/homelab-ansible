terraform {
    required_providers {
        proxmox = {
            source = "bpg/proxmox"
            version = "0.86.0"
        }
    }
}

resource "proxmox_virtual_environment_container" "container" {
    vm_id        = var.vm_id
    node_name    = "proxima"
    started      = true
    unprivileged = true
    start_on_boot  = true

    cpu {
        cores = var.cores
    }

    disk {
        datastore_id  = var.disk_datastore
        size          = var.disk
    }

    initialization {
        hostname = var.hostname

        ip_config {
            ipv4 {
                address = "192.168.1.${var.vm_id}/24"
                gateway = "192.168.1.1"
            }
        }
    }

    memory {
        dedicated = var.ram
        swap      = var.swap
    }

    network_interface {
        bridge      = "vmbr0"
        enabled     = true
        firewall    = true
        name        = "eth0"
    }

    operating_system {
        template_file_id = var.template_file_id
        type = var.os_type
    }
}
