# data "azurerm_client_config" "current" {
# }
# data "azurerm_key_vault" "kv" {
#   name                = var.keyvault_name
#   resource_group_name = var.resource_group_name
# }

# data "azurerm_key_vault_secret" "username" {
#   name         = "sanjaysecret"
#   key_vault_id = data.azurerm_key_vault.kv.id
# }
# data "azurerm_key_vault_secret" "password" {
#   name         = "sanjaysecret1"
#   key_vault_id = data.azurerm_key_vault.kv.id
# }

# data "azurerm_public_ip" "datapip" {
#   name                = "sanjayip"
#   resource_group_name = "sanjayrg"
# }

# data "azurerm_network_interface" "dnic" {
#   name                = "sanjaynic"
#   resource_group_name = var.resource_group_name
# }
