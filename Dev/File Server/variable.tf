#vCenter Server infrastructure and new VM entity information:- variable.tf
variable "datacenter" {
  description = "Virtual Datacenter name where VM will be placed"
  type        = string
  default     = "DevLab"
}

variable "cluster" {
  description = "Password to connect to vCenter Server"
  type        = string
  default     = "devlab-cl01"
}

variable "network" {
  description = "IP or DNS name to connect to vCenter server"
  type        = string
  default     = "VM Network"
}

variable "datastore" {
  description = "IP or DNS name to connect to vCenter server"
  type        = string
  default     = "esxi02-ds"
}

variable "template" {
  description = "IP or DNS name to connect to vCenter server"
  type        = string
  default     = "win-srv-22-tmpl"
}

variable "vminfo" {
  type = map(object({
    vm     = string
    cpu    = string
    memory = string
    ipv4   = string
    netmask = string
    dns-server = string
    dns-suffix = string
  }))
  default = {
    "dev" = {
      vm     = "galaxy-fs"
      cpu    = "1"
      memory = "1024"
      ipv4   = "10.100.40.30"
      netmask = "255.255.255.0"
      dns-server = "10.100.40.1"
      dns-suffix = "oisterfam.net"
    }
    "prod" = {
      vm     = "gardian-fs"
      cpu    = "2"
      memory = "2048"
      ipv4   = "10.100.40.60"
      netmask = "255.255.255.0"
      dns-server = "10.100.40.1"
      dns-suffix = "oisterfam.net"
    }
  }
}