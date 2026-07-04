resource "proxmox_virtual_environment_container" "stalwart_node_1_container" {
  vm_id               = 190
  node_name           = "proxima"
  start_on_boot       = false
  started = true
  unprivileged        = true
  cpu {
    cores = 2
  }
  disk {
    datastore_id = "local"
    size = 16
  }
  initialization {
    hostname = "stalwart-node-1"
    ip_config {
      ipv4 {
        address = "172.16.0.190/24"
        gateway = "172.16.0.1"
      }
    }
    ip_config {
      ipv4 {
        address = "192.168.1.190/24"
        gateway = "192.168.1.1"
      }
    }
    user_account {
      keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEqHRsQleFevrmSKxKfraXgJ5a5HnAFf9EMfl39ab8le root@North"
      ]
      password = "stalwart"
    }
  }
  memory {
    dedicated = 1024
    swap      = 1024
  }
  network_interface {
    firewall    = true
    name        = "eth0"
    bridge = "vmbr1"
  }
  network_interface {
    firewall    = true
    name        = "eth1"
    bridge = "vmbr0"
  }
  operating_system {
    template_file_id = "local-storage:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
    type = "debian"
  }
  features {
    nesting = true
  }
}

resource "proxmox_virtual_environment_container" "stalwart_node_2_container" {
  vm_id               = 191
  node_name           = "proxima"
  start_on_boot       = false
  started = true
  unprivileged        = true
  cpu {
    cores = 2
  }
  disk {
    datastore_id = "local"
    size = 16
  }
  initialization {
    hostname = "stalwart-node-2"
    ip_config {
      ipv4 {
        address = "172.16.0.191/24"
        gateway = "172.16.0.1"
      }
    }
    ip_config {
      ipv4 {
        address = "192.168.1.191/24"
        gateway = "192.168.1.1"
      }
    }
    user_account {
      keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEqHRsQleFevrmSKxKfraXgJ5a5HnAFf9EMfl39ab8le root@North"
      ]
      password = "stalwart"
    }
  }
  memory {
    dedicated = 1024
    swap      = 1024
  }
  network_interface {
    firewall    = true
    name        = "eth0"
    bridge = "vmbr1"
  }
  network_interface {
    firewall    = true
    name        = "eth1"
    bridge = "vmbr0"
  }
  operating_system {
    template_file_id = "local-storage:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
    type = "debian"
  }
  features {
    nesting = true
  }
}