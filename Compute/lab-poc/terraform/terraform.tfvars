
##vSphere Provider Variables
vsphere_user                     = "terraform_user@vsphere.local"
vsphere_password                 = "kvc1DQM_trg_cjt2xjm"
vsphere_server                   = "vcenter.oisterfam.net"
vsphere_datacenter               = "DevLab"
vsphere_datastore                = "esxi02-ds"
vsphere_resource_pool            = "/DevLab/host/devlab-cl01/Resources/lab-rp"
vsphere_network                  = "pdg network"
vsphere_virtual_machine_template = "win-server-22-tmplt"
vsphere_virtual_machine_name     = "lab-dc"
vsphere_compute_cluster          = "devlab-cl01"
vsphere_vm_firmware              = "efi"
vsphere_network_adapter          = "vmxnet3"

# Which Windows administrator password to set during vm customization
winadmin_password = "S3cret!"

//Primary Domain Controller
PDC_name    = "pdg-dc-01"
PDC_IP      = "10.100.40.10"
PDC_cpu_num = 4
PDC_mem     = 8192

//Second Domain Controller
ReplicaDC_name    = "pdg-dc-02"
ReplicaDC_IP      = "10.100.40.11"
ReplicaDC_cpu_num = 4
ReplicaDC_mem     = 8192

# Fileserver settings
Fileserver_name    = "pdg-fs-01"
Fileserver_IP      = "10.100.40.20"
Fileserver_cpu_num = 4
Fileserver_mem     = 8192

# Common network params
netmask    = "24"
def_gw     = "10.100.40.1"
dns_server = "10.100.40.1"
