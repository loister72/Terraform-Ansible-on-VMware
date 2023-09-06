vsphere_datacenter                  = "DevLab"
vsphere_datastore                   = "esxi02-ds"
vsphere_resource_pool               = "/DevLab/host/devlab-cl01/Resources/lab-rp"  // If no Resource Pool is present, use vSphere Cluster
network_cards                       = ["pdg-servers"] // vSwitch/DVS Port Group
vsphere_vm_template_name            = "win-server-22-tmplt"
vsphere_virtual_machine_name        = "lab-dc"
vsphere_virtual_machine_count       = 1
vsphere_virtual_machine_cpu_count   = "2"
vsphere_virtual_machine_memory_size = "8192" //Megabytes
cpu_hot_add_enabled                 = true
cpu_hot_remove_enabled              = true
memory_hot_add_enabled              = true
domain                              = "pdglab.local"
vm_gateway                          = "10.100.40.1" // Your gateway address
vm_dns = [                                       // Your DNS server address
  "10.100.40.1",
]