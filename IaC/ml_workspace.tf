data "azurerm_client_config" "current" {}

resource "azurerm_application_insights" "ai-ap-dev" {
  name                = "workspace-mlops-ap-ai-dev"
  location            = azurerm_resource_group.rg-mlops-ap-dev.location
  resource_group_name = azurerm_resource_group.rg-mlops-ap-dev.name
  application_type    = "web"
}

resource "azurerm_key_vault" "kv-ap-dev" {
  name                = "workspaceapkeyvault"
  location            = azurerm_resource_group.rg-mlops-ap-dev.location
  resource_group_name = azurerm_resource_group.rg-mlops-ap-dev.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
}

resource "azurerm_storage_account" "sa-ap-dev" {
  name                     = "workspacestorageaccount"
  location                 = azurerm_resource_group.rg-mlops-ap-dev.location
  resource_group_name      = azurerm_resource_group.rg-mlops-ap-dev.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_machine_learning_workspace" "mlw-ap-dev" {
  name                    = "mlw-ap-dev"
  location                = azurerm_resource_group.rg-mlops-ap-dev.location
  resource_group_name     = azurerm_resource_group.rg-mlops-ap-dev.name
  application_insights_id = azurerm_application_insights.ai-ap-dev.id
  key_vault_id            = azurerm_key_vault.kv-ap-dev.id
  storage_account_id      = azurerm_storage_account.sa-ap-dev.id

  identity {
    type = "SystemAssigned"
  }
}