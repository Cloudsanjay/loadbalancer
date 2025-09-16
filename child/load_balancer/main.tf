resource "azurerm_lb" "lb" {
  name                = var.lb_name
  location            = var.lb_location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = var.PublicIPAddress
    public_ip_address_id = data.azurerm_public_ip.lb_pip.id
  }

}

resource "azurerm_lb_backend_address_pool" "pool1" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = var.bap_name
}

resource "azurerm_lb_probe" "probe" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "netflix-probe"
  port            = 80
}

# IP and Port based Routing
resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = "NetflixRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = var.PublicIPAddress
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.pool1.id]
  probe_id                       = azurerm_lb_probe.probe.id
}







