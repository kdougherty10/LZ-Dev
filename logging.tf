/*

#data call for subscription to work in
data "azurerm_subscription" "current" {
    subscription_id = module.sub_deployment.subscription_id
}

#data call for existing event hub
data "azurerm_eventhub" "example" {
  name                = "search-eventhub"
  resource_group_name = "search-service"
  namespace_name      = "search-eventhubns"
}

#data call for sample resources
data "azurerm_storage_account" "example" {
  name                = "examplestoracc"
  resource_group_name = azurerm_resource_group.example.name
}

data "azurerm_key_vault" "example" {
  name                = "example-vault"
  resource_group_name = azurerm_resource_group.example.name
}

#creation of diagnostic setting
resource "azurerm_monitor_diagnostic_setting" "example" {
  name               = "example"
  target_resource_id = data.azurerm_key_vault.example.id
  storage_account_id = data.azurerm_storage_account.example.id
  eventhub_name = data.azurerm_eventhub.example

  log {
    category = "AuditEvent"
    enabled  = false

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}
*/