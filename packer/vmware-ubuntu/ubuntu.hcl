{
  "builders": [
    {
      "type": "vmware-iso",
      "iso_url": "iso/ubuun.iso",
      "iso_checksum": "md5_checksum_of_iso",
      "iso_checksum_type": "md5",
      "vm_name": "packer-vm",
      "vmx_data": {
        "numvcpus": "2",
        "memsize": "2048",
        "ide0:0.fileName": "disk.vmdk"
      },
      "ssh_username": "your_username",
      "ssh_password": "your_password",
      "shutdown_command": "echo 'packer' | sudo -S shutdown -P now"
    }
  ],
  "provisioners": [
    {
      "type": "shell",
      "script": "scripts/install-software.sh"
    },
    {
      "type": "shell",
      "script": "scripts/cleanup.sh"
    }
  ],
  "post-processors": [
    {
      "type": "vsphere",
      "host": "vcenter_host",
      "username": "vcenter_username",
      "password": "vcenter_password",
      "datacenter": "your_datacenter",
      "cluster": "your_cluster",
      "folder": "Templates",
      "template": true,
      "name": "packer-template",
      "convert_to_template": true
    }
  ]
}
