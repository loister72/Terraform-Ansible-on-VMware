# vsphere login account. defaults to admin account
variable "vsphere_user" {
  default = "administrator@vsphere.local"
}

# vsphere account password. empty by default.
variable "vsphere_password" {}

# vsphere server, defaults to localhost
variable "vsphere_server" {
  default = "localhost"
}

# vsphere datacenter the virtual machine will be deployed to. empty by default.
variable "vsphere_datacenter" {}

# vsphere resource pool the virtual machine will be deployed to. empty by default.
variable "vsphere_resource_pool" {}

# vsphere datastore the virtual machine will be deployed to. empty by default.
variable "vsphere_datastore" {}

# vsphere network the virtual machine will be connected to. empty by default.
variable "vsphere_network" {}

# vsphere virtual machine template that the virtual machine will be cloned from. empty by default.
variable "vsphere_virtual_machine_template" {}

# the name of the vsphere virtual machine that is created. empty by default.
variable "vsphere_virtual_machine_name" {}
variable "vsphere_vm_firmware" {
  description = "Firmware set to bios or efi depending on Template"
  default     = "efi"
}

variable "vm_ip" {
  default = ""
  }
variable "vm_netmask" {
  default = ""
  }
variable "vm_dns_server" {
  default = ""
  }
variable "vm_dns_domain" {
  default = ""
  }
  variable "vm_timezone" {
    default = ""
  }

variable "vm_password" {
    default = "P@ssw0rd123"
  }
variable "vm_gateway" {
    default = ""
  }