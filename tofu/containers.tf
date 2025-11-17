resource "proxmox_virtual_environment_container" "servarr_container" {
  vm_id               = 150
  node_name           = "proxima"
  start_on_boot       = true
  unprivileged        = true
  cpu {
    cores = 2
  }
  disk {
    datastore_id = "local"
    size = 10
  }
  initialization {
    hostname = "servarr"
    ip_config {
      ipv4 {
        address = "192.168.1.150/24"
        gateway = "192.168.1.1"
      }
    }
  }
  memory {
    dedicated = 1024
    swap      = 1024
  }
  network_interface {
    firewall    = true
    name        = "eth0"
  }
  operating_system {
    template_file_id = ""
    type = "debian"
  }
  mount_point {
    volume = "/mnt/NAS"
    path = "/nas"
  }
}

resource "proxmox_virtual_environment_container" "status_container" {
  vm_id               = 158
  node_name           = "proxima"
  started = false
  start_on_boot       = true
  unprivileged        = true
  cpu {
    cores = 2
  }
  disk {
    datastore_id = "local"
    size = 8
  }
  initialization {
    hostname = "status"
    ip_config {
      ipv4 {
        address = "192.168.1.158/24"
        gateway = "192.168.1.1"
      }
    }
    user_account {
      keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEqHRsQleFevrmSKxKfraXgJ5a5HnAFf9EMfl39ab8le root@North"
      ]
      password = "status"
    }
  }
  memory {
    dedicated = 1024
    swap      = 1024
  }
  network_interface {
    firewall    = true
    name        = "eth0"
  }
  operating_system {
    template_file_id = "local-storage:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
    type = "debian"
  }
  features {
    nesting = true
  }
}

resource "proxmox_virtual_environment_container" "book_container" {
  vm_id               = 159
  node_name           = "proxima"
  start_on_boot       = true
  unprivileged        = true
  cpu {
    cores = 1
  }
  disk {
    datastore_id = "local"
    size = 16
  }
  initialization {
    hostname = "book"
    ip_config {
      ipv4 {
        address = "192.168.1.159/24"
        gateway = "192.168.1.1"
      }
    }
    user_account {
      keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEqHRsQleFevrmSKxKfraXgJ5a5HnAFf9EMfl39ab8le root@North"
      ]
      password = "booklore"
    }
  }
  memory {
    dedicated = 1024
    swap      = 1024
  }
  network_interface {
    firewall    = true
    name        = "eth0"
  }
  operating_system {
    template_file_id = "local-storage:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
    type = "debian"
  }
  features {
    nesting = true
  }
}

resource "proxmox_virtual_environment_container" "opencloud_test_container" {
  vm_id               = 160
  node_name           = "proxima"
  start_on_boot       = false
  unprivileged        = true
  cpu {
    cores = 2
  }
  disk {
    datastore_id = "local"
    size = 8
  }
  initialization {
    hostname = "opencloud-test"
    ip_config {
      ipv4 {
        address = "192.168.1.160/24"
        gateway = "192.168.1.1"
      }
    }
    user_account {
      keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEqHRsQleFevrmSKxKfraXgJ5a5HnAFf9EMfl39ab8le root@North"
      ]
      password = "opencloud"
    }
  }
  memory {
    dedicated = 1024
    swap      = 1024
  }
  network_interface {
    firewall    = true
    name        = "eth0"
  }
  operating_system {
    template_file_id = "local-storage:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
    type = "debian"
  }
  features {
    nesting = true
  }
}

// new template: debian-13-standard_13.1-2_amd64.tar.zst

resource "proxmox_virtual_environment_container" "pelican" {
    vm_id           = "184"
    node_name    = "proxima"
    started      = true
    unprivileged = true
    start_on_boot  = true

    cpu {
        cores        = 8
    }

    disk {
        datastore_id  = "local"
        size          = 8
    }

    initialization {
        hostname = "pelican"

        ip_config {
            ipv4 {
                address = "192.168.1.184/24"
                gateway = "192.168.1.1"
            }
        }
    }

    memory {
        dedicated = 8196
        swap      = 512
    }

    network_interface {
        bridge      = "vmbr0"
        enabled     = true
        firewall    = true
        name        = "eth0"
    }

    operating_system {
        template_file_id = ""
        type = "debian"
    }
}