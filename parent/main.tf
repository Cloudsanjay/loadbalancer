module "resource_group_name" {
  source              = "../child/resource_group_name"
  resource_group_name = "sanjayrg"
  location            = "UAE north"
}

module "virtual_network" {
  depends_on          = [module.resource_group_name]
  source              = "../child/vnet"
  vnet_name           = "sanjayvnet"
  location            = "UAE north"
  resource_group_name = "sanjayrg"
  vnet_address_space  = ["10.0.0.0/16"]
}

module "subnet" {
  depends_on          = [module.virtual_network]
  source              = "../child/subnet"
  subnet_name         = "sanjaysubnet"
  vnet_name           = "sanjayvnet"
  resource_group_name = "sanjayrg"
  address_prefixes    = ["10.0.0.0/24"]
}

module "bsubnet" {
  depends_on          = [module.virtual_network]
  source              = "../child/subnet"
  subnet_name         = "AzureBastionSubnet"
  vnet_name           = "sanjayvnet"
  resource_group_name = "sanjayrg"
  address_prefixes    = ["10.0.1.0/24"]
}

# module "public_ip" {
#   depends_on     = [module.resource_group_name]
#   source         = "../child/public_ip"
#   public_ip_name = "sanjaypip"
#   resource_group_name = "sanjayrg"
#   pip_location   = "UAE north"
# }

module "public_ip_lb" {
  depends_on          = [module.resource_group_name]
  source              = "../child/public_ip"
  public_ip_name      = "sanjaypip1"
  resource_group_name = "sanjayrg"
  location            = "UAE north"
}

# module "public_ip_vm2" {
#   depends_on     = [module.resource_group_name]
#   source         = "../child/public_ip"
#   public_ip_name = "sanjaypip2"
#   resource_group_name = "sanjayrg"
#   pip_location   = "UAE north"
# }

module "public_ip_bastion" {
  depends_on          = [module.resource_group_name]
  source              = "../child/public_ip"
  public_ip_name      = "sanjaypipbastion"
  resource_group_name = "sanjayrg"
  location            = "UAE north"
}

# module "key_vault" {
#   depends_on          = [module.resource_group_name]
#   source              = "../child/key_vault"
#   keyvault_name       = "keyvaultmidday"
#   location            = "UAE north"
#   resource_group_name = "sanjayrg"
# }

# module "key_secret" {
#   depends_on          = [module.key_vault]
#   source              = "../child/key_secret"
#   secret_name         = "sanjaysecret"
#   secret_value        = "frontendvm"
#   keyvault_name       = "keyvaultmidday"
#   resource_group_name = "sanjayrg"
# }

# module "key_secret_password" {
#   depends_on          = [module.key_vault]
#   source              = "../child/key_secret"
#   secret_name         = "sanjaysecret1"
#   secret_value        = "frontend@123"
#   keyvault_name       = "keyvaultmidday"
#   resource_group_name = "sanjayrg"
# }

# module "key_secret1" {
#   depends_on          = [module.key_vault]
#   source              = "../child/key_secret"
#   secret_name         = "manjaysecret"
#   secret_value        = "frontendvm"
#   keyvault_name       = "keyvaultmidday"
#   resource_group_name = "sanjayrg"
# }

# module "key_secret_password1" {
#   depends_on          = [module.key_vault]
#   source              = "../child/key_secret"
#   secret_name         = "manajaysecret1"
#   secret_value        = "frontend@123"
#   keyvault_name       = "keyvaultmidday"
#   resource_group_name = "sanjayrg"
# }



module "nic" {
  depends_on          = [module.resource_group_name, module.subnet]
  source              = "../child/nic"
  nic_name            = "sanjaynic"
  resource_group_name = "sanjayrg"
  location            = "UAE north"
  subnet_name         = "sanjaysubnet"
  vnet_name           = "sanjayvnet"
}

module "nic2" {
  depends_on          = [module.resource_group_name, module.subnet]
  source              = "../child/nic"
  nic_name            = "sanjaynic2"
  resource_group_name = "sanjayrg"
  location            = "UAE north"
  subnet_name         = "sanjaysubnet"
  vnet_name           = "sanjayvnet"
}

module "vm" {
  depends_on           = [module.key_vault, module.resource_group_name, module.subnet, module.load_balancer, module.nic]
  source               = "../child/vm"
  resource_group_name  = "sanjayrg"
  frontend_vm_name     = "sanjayvm1"
  location             = "UAE north"
  vm_size_frontend     = "Standard_B1s"
  os_image_publisher   = "Canonical"
  os_image_offer       = "0001-com-ubuntu-server-jammy"
  os_image_sku         = "22_04-lts-gen2"
  frontend_subnet_name = "sanjaysubnet"
  vnet_name            = "sanjayvnet"
  public_ip_name       = "sanjaypip"
  keyvault_name        = "keyvaultmidday"
  nic_id               = [data.azurerm_network_interface.datanic.id]
  admin_username       = "sanjayvm1"
  admin_password       = "password@vm1"
}

module "vm2" {
  depends_on           = [module.key_vault, module.resource_group_name, module.subnet, module.load_balancer, module.nic2]
  source               = "../child/vm"
  resource_group_name  = "sanjayrg"
  frontend_vm_name     = "sanjayvm2"
  location             = "UAE north"
  vm_size_frontend     = "Standard_B1s"
  os_image_publisher   = "Canonical"
  os_image_offer       = "0001-com-ubuntu-server-jammy"
  os_image_sku         = "22_04-lts-gen2"
  frontend_subnet_name = "sanjaysubnet"
  vnet_name            = "sanjayvnet"
  public_ip_name       = "sanjaypip2"
  keyvault_name        = "keyvaultmidday"
  nic_id               = [data.azurerm_network_interface.datanic2.id]
  admin_username       = "sanjayvm2"
  admin_password       = "password@vm2"

}

module "load_balancer" {
  depends_on          = [module.resource_group_name, module.public_ip_lb]
  source              = "../child/load_balancer"
  lb_name             = "sanjaylb"
  lb_location         = "UAE north"
  resource_group_name = "sanjayrg"
  PublicIPAddress     = "Static"
  public_ip_name      = "sanjaypip1"
  bap_name            = "b-BackEndAddressPool1"
}

module "nsg" {
  depends_on          = [module.resource_group_name]
  source              = "../child/nsg"
  nsg_name            = "sanjaynsg"
  loaction            = "UAE north"
  resource_group_name = "sanjayrg"
}

module "pinki2lb_jod_yojna" {
  depends_on            = [module.resource_group_name, module.nic, module.load_balancer, module.vm, module.vm2]
  source                = "../child/nic_lb_association"
  nic_name              = "sanjaynic"
  resource_group_name   = "sanjayrg"
  lb_name               = "sanjaylb"
  bap_name              = "b-BackEndAddressPool1"
  ip_configuration_name = "internal"
  subnet_name           = "sanjaysubnet"
  vnet_name             = "sanjayvnet"
  public_ip_name        = "sanjaypip1"
}

module "chinki2lb_jod_yojna" {
  depends_on            = [module.resource_group_name, module.nic2, module.load_balancer, module.vm, module.vm2]
  source                = "../child/nic_lb_association"
  nic_name              = "sanjaynic2"
  resource_group_name   = "sanjayrg"
  lb_name               = "sanjaylb"
  bap_name              = "b-BackEndAddressPool1"
  ip_configuration_name = "internal"
  subnet_name           = "sanjaysubnet"
  vnet_name             = "sanjayvnet"
  public_ip_name        = "sanjaypip1"
}

module "bastion" {
  depends_on          = [module.bsubnet]
  source              = "../child/Bastion"
  bastion             = "sanjaybastion"
  resource_group_name = "sanjayrg"
  location            = "UAE north"
  subnet_name         = "AzureBastionSubnet"
  vnet_name           = "sanjayvnet"
  public_ip_name      = "sanjaypipbastion"
}
