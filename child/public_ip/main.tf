resource "azurerm_public_ip" "pip" {
  name = var.public_ip_name
  resource_group_name = var.resource_group_name
  location = var.location
  allocation_method = "Static"
}

# resource "azurerm_public_ip" "lb_pip" {
#   name                = var.public_lb_ip
#   location            = var.pip_location
#   resource_group_name = var.resource_group
#   allocation_method   = "Static"
# }