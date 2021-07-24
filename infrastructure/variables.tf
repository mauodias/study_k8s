variable "control_nodes" {
  type = number
  default = 1
}

variable "worker_nodes" {
  type = number
  default = 3
}

variable "os_image" {
  type = string
  default = "ubuntu-os-cloud/ubuntu-2104"
}
