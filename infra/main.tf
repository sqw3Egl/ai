resource "azurerm_resource_group" "rg_1" {
  name     = "${var.prefix}-rg"
  location = var.location
  tags     = var.tags
}

resource "azurerm_storage_account" "sa_1" {
  name                     = lower(replace("${var.prefix}sa", "-", ""))
  resource_group_name      = azurerm_resource_group.rg_1.name
  location                 = azurerm_resource_group.rg_1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}

resource "azurerm_key_vault" "kv_1" {
  name                = "${var.prefix}-kv"
  location            = azurerm_resource_group.rg_1.location
  resource_group_name = azurerm_resource_group.rg_1.name
  sku_name            = "standard"
  tenant_id           = var.tenant_id
  tags                = var.tags
}

resource "azurerm_application_insights" "ai_1" {
  name                = "${var.prefix}-ai"
  location            = azurerm_resource_group.rg_1.location
  resource_group_name = azurerm_resource_group.rg_1.name
  application_type    = "web"
  tags                = var.tags
}

resource "azurerm_machine_learning_workspace" "mlw_1" {
  name                    = "${var.prefix}-mlw"
  location                = azurerm_resource_group.rg_1.location
  resource_group_name     = azurerm_resource_group.rg_1.name
  application_insights_id = azurerm_application_insights.ai_1.id
  key_vault_id            = azurerm_key_vault.kv_1.id
  storage_account_id      = azurerm_storage_account.sa_1.id
  sku_name                = "Basic"

  identity {
    type = "SystemAssigned"
  }

  tags                    = var.tags
}