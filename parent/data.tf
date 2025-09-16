data "azurerm_network_interface" "datanic" {
  depends_on          = [module.nic]
  name                = "sanjaynic"
  resource_group_name = "sanjayrg"
}

data "azurerm_network_interface" "datanic2" {
  depends_on          = [module.nic2]
  name                = "sanjaynic2"
  resource_group_name = "sanjayrg"
}

