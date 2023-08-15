#Login information for vCenter Server:- credential.tf
variable "vCenter_user" {
  description = "Username to connect to vCenter Server"
  type        = string
  default     = "terraform_user@vsphere.local"
}

variable "vCenter_password" {
  description = "Password to connect to vCenter Server"
  type        = string
  default     = "kvc1DQM_trg_cjt2xjm"
}

variable "vCenter_server" {
  description = "IP or DNS name to connect to vCenter server"
  type        = string
  default     = "vcenter.oisterfam.net"
}