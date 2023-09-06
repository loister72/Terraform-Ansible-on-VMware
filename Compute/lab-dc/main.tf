data "vsphere_datacenter" "datacenter" {
  name = var.vsphere_datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = "devlab-cl01"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vsphere_virtual_machine_template
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "vm" {
  name                   = var.vsphere_virtual_machine_name
  resource_pool_id       = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id           = data.vsphere_datastore.datastore.id
  num_cpus               = 4
  memory                 = 8192
  guest_id               = data.vsphere_virtual_machine.template.guest_id
  scsi_type              = data.vsphere_virtual_machine.template.scsi_type
  cpu_hot_add_enabled    = true
  cpu_hot_remove_enabled = true
  memory_hot_add_enabled = true
  firmware               = "efi"

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = "vmxnet3" 
    }
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }
}
