terraform {
    backend "s3" {
        bucket = "tassigny-tf-state"
        key = "terraform.tfstate"
        region = "eu-central-003"
        endpoints = {
            s3 = "https://s3.eu-central-003.backblazeb2.com"
        }
        
        skip_credentials_validation = true
        skip_region_validation      = true
        skip_metadata_api_check     = true
        skip_requesting_account_id  = true
        skip_s3_checksum            = true
    }

    required_providers {
        cloudflare = {
            source = "cloudflare/cloudflare"
            version = "5.8.2"
        }
        proxmox = {
            source = "bpg/proxmox"
            version = "0.86.0"
        }
    }
}

resource "proxmox_virtual_environment_container" "mealie_container" {
  node_name           = "proxima"
  start_on_boot       = true
  started             = false
  tags                = []
  template            = false
  unprivileged        = true
  vm_id               = 183
  cpu {
    cores = 2
  }
  disk {
    datastore_id = "local-storage"
    size = 10
  }
  initialization {
    hostname = "mealie"
    ip_config {
      ipv4 {
        address = "192.168.1.183/24"
        gateway = "192.168.1.1"
      }
    }
  }
  memory {
    dedicated = 1024
    swap      = 512
  }
  network_interface {
    firewall    = true
    name        = "eth0"
  }
  operating_system {
    template_file_id = ""
    type = "debian"
  }
}
