variable "vsphere_user" {
  default = "terraform_user@vsphere.local"
}
variable "vsphere_password" {
  default = "kvc1DQM_trg_cjt2xjm"
}
variable "vsphere_datacenter"{
  default = "DevLab"
}
variable "vsphere_datastore"{
  default = "esxi02-ds"
}
variable "vsphere_resource_pool"{
  default = "/DevLab/host/devlab-cl01/Resources/lab-rp"
}
variable "vsphere_host"{
  default = "esxi-02.oisterfam.net"
}
variable "vsphere_network"{
  default = "pdg-servers"
}
variable "vsphere_server" {
  default = "vcenter.oisterfam.net"
}
variable "vm_user"{
  default = "lsroot"
}
variable "vm_password"{
  default = "Passw0rd@123"
}

variable "vsphere_vm_firmware" {
  description = "Firmware set to bios or efi depending on Template"
  default = "efi"
}