resource "proxmox_virtual_environment_cluster_firewall_security_group" "isolate" {
  name    = "isolate"
  comment = "Block local IPs"

  rule {
    type    = "out"
    action  = "DROP"
    dest    = "10.0.0.0/8"
    log     = "warning"
  }

  rule {
    type    = "out"
    action  = "DROP"
    dest    = "172.16.0.0/12"
    log     = "warning"
  }

  rule {
    type    = "out"
    action  = "DROP"
    dest    = "192.168.0.0/16"
    log     = "warning"
  }
}