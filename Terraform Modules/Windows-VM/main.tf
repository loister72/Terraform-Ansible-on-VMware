# Terraform module to provision a virtual machine on VMware

# Import the VMware provider
provider "vsphere" {
    user     = "myuser"
    password = "mypassword"
    vsphere_server = "vcenter.example.com"
}

# Create a virtual machine
resource "vsphere_virtual_machine" "example" {
    name             = "example-vm"
    resource_pool_id = "resource-pool-id"
    datastore_id     = "datastore-id"
    folder           = "vm-folder"
    num_cpus         = 2
    memory           = 4096
    guest_id         = "ubuntu64Guest"
    network_interface {
        network_id = "network-id"
    }
}