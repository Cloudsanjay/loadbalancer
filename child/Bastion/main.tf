
resource "azurerm_bastion_host" "bastion" {
  name                = var.bastion
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.sbnet.id
    public_ip_address_id = data.azurerm_public_ip.bastiondataip.id
}
}
