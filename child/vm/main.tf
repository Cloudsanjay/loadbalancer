resource "azurerm_linux_virtual_machine" "frontendvm" {
  name                            = var.frontend_vm_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  size                            = var.vm_size_frontend
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false
  network_interface_ids           = var.nic_id


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.os_image_publisher
    offer     = var.os_image_offer
    sku       = var.os_image_sku
    version   = var.os_image_version
  }
}




