provider "proxmox" {
  endpoint = "https://192.168.1.130:8006"
  username = "root@pam"
  password = var.proxmox_root_password
  insecure = true
}
