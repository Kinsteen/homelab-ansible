variable "vm_id" {
    type = string
}
variable "hostname" {
    type = string
}
variable "cores" {
    type = number
    default = 2
}
variable "disk_datastore" {
    type = string
    default = "local"
}
variable "disk" {
    type = number
    default = 8
}
variable "ram" {
    type = number
    default = 1024
}
variable "swap" {
    type = number
    default = 1024
}
variable "template_file_id" {
    type = string
    default = "local-storage:vztmpl/debian-13-standard_13.1-2_amd64.tar.zst"
}
variable "os_type" {
    type = string
    default = "debian"
}
