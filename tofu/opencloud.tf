resource "proxmox_virtual_environment_container" "opencloud_test_container" {
  vm_id               = 160
  node_name           = "proxima"
  start_on_boot       = false
  started = true
  unprivileged        = true
  cpu {
    cores = 4
  }
  disk {
    datastore_id = "local"
    size = 50
  }
  initialization {
    hostname = "opencloud-test"
    ip_config {
      ipv4 {
        address = "172.16.0.160/24"
        gateway = "172.16.0.1"
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
    dedicated = 8192
    swap      = 16384
  }
  network_interface {
    firewall    = true
    name        = "eth0"
    bridge = "vmbr1"
  }
  operating_system {
    template_file_id = "local-storage:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
    type = "debian"
  }
  features {
    nesting = true
  }
}