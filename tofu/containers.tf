resource "proxmox_virtual_environment_container" "servarr_container" {
  vm_id               = 150
  node_name           = "proxima"
  start_on_boot       = true
  unprivileged        = true
  cpu {
    cores = 4
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
    dedicated = 4096
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