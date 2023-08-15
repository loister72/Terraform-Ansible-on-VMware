#vSphere Provider and login to vCenter server:- provider.tf
terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      version = ">= 2.4.1"
    }
  }
  #required_version = ">= 0.13"
}

provider "vsphere" {
  user                 = var.vCenter_user
  password             = var.vCenter_password
  vsphere_server       = var.vCenter_server
  allow_unverified_ssl = true
}