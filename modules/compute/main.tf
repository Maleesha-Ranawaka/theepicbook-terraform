resource "azurerm_network_interface" "nic" {
  name                = "${terraform.workspace}-epicbook-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     =  var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.nic_public_ip.id
  }
}

resource "azurerm_public_ip" "nic_public_ip" {
  name                = "${terraform.workspace}-epicbook-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "${terraform.workspace}-epicbook-vm"
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = var.vm_size
  admin_username      = "azureuser"
  admin_password      = var.vm_password
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.nic.id]
/*
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
*/
  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # cloud-init script for auto-installing packages
  custom_data = filebase64("${path.module}/../../cloud-init/init-script.yaml")
}