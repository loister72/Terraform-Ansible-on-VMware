resource "vsphere_virtual_machine" "pdg-dc-01" {
  name                   = var.PDC_name
  num_cpus               = var.PDC_cpu_num
  memory                 = var.PDC_mem
  resource_pool_id       = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id           = data.vsphere_datastore.datastore.id
  guest_id               = data.vsphere_virtual_machine.template.guest_id
  scsi_type              = data.vsphere_virtual_machine.template.scsi_type
  firmware               = var.vsphere_vm_firmware
  cpu_hot_add_enabled    = true
  cpu_hot_remove_enabled = true
  memory_hot_add_enabled = true

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = var.vsphere_network_adapter
  }


  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      windows_options {
        computer_name    = var.PDC_name
        admin_password   = var.winadmin_password
        auto_logon       = true
        auto_logon_count = 1

        # Run these commands after autologon. Configure WinRM access and disable windows firewall.
        run_once_command_list = [
          "winrm quickconfig -force",
          "winrm set winrm/config @{MaxEnvelopeSizekb=\"100000\"}",
          "winrm set winrm/config/Service @{AllowUnencrypted=\"true\"}",
          "winrm set winrm/config/Service/Auth @{Basic=\"true\"}",
          "netsh advfirewall set allprofiles state off",
        ]
      }

      network_interface {
        ipv4_address    = var.PDC_IP
        ipv4_netmask    = var.netmask
        dns_server_list = [var.dns_server]
      }

      ipv4_gateway = var.def_gw
    }
  }
}