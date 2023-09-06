terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      version = "2.4.1"
    }
  }
}
provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server}"
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "${var.vsphere_datacenter}"
}

data "vsphere_datastore" "datastore" {
  name          = "${var.vsphere_datastore}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "${var.vsphere_resource_pool}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "${var.vsphere_network}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "win2022" {
  name          = "${var.vsphere_virtual_machine_template}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "cloned_virtual_machine" {
  name             = "${var.vsphere_virtual_machine_name}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = "${data.vsphere_virtual_machine.template.num_cpus}"
  memory   = "${data.vsphere_virtual_machine.template.memory}"
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"
  firmware  = "${data.vpshere_virtual_machine.template.vsphere_vm_firmware}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label = "disk0"
    size = "${data.vsphere_virtual_machine.template.disks.0.size}"
    thin_provisioned = true
  }
}

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"
     customize {
      windows_options {
        computer_name   = "thinhwin2019"
        admin_password  = "Terabox@@123"
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