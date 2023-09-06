
terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      version = "2.4.2"
    }
  }
}
provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

#add name DC, name disk, name cluster, name host, name network, name pool
data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = var.vsphere_resource_pool
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_network" "network"{
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_virtual_machine" "win2019" {
  name          = "lab-dc"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = "lab-dc"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = 2
  memory           = 4096
  guest_id         = data.vsphere_virtual_machine.win2019.guest_id
  scsi_type        = data.vsphere_virtual_machine.win2019.scsi_type
  firmware         = "${var.vsphere_vm_firmware}"
  
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = "vmxnet3"
  }
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.win2019.disks.0.size
    thin_provisioned = true
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.win2019.id
    customize {
      windows_options {
        computer_name   = "lab-dc"
        admin_password  = "Passw0rd@123"
        auto_logon = true

      }
      network_interface {
        ipv4_address = "10.100.40.10"
        ipv4_netmask = 24
        dns_server_list = ["10.100.40.1","8.8.8.8"]
  
      }
      ipv4_gateway = "10.100.40.1"
    }
    
  }
   
    
}


 
