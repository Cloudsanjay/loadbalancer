#NIC details

# data "azurerm_subnet" "frontend_subnet" {
#   name                 = var.subnet_name
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = var.vnet_name
# }

# data "azurerm_public_ip" "datapip" {
#   name                = var.public_ip_name
#   resource_group_name = var.resource_group_name
# }


#NIC association
data "azurerm_network_interface" "nic" {
  name                = var.nic_name
  resource_group_name = var.resource_group_name
}

data "azurerm_lb" "lb" {
  name                = var.lb_name
  resource_group_name = var.resource_group_name
}

data "azurerm_lb_backend_address_pool" "pool" {
  name            = var.bap_name
  loadbalancer_id = data.azurerm_lb.lb.id
}
