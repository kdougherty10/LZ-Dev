/*

#data call for existing event hub
data "azurerm_eventhub" "example" {
  name                = "search-eventhub"
  resource_group_name = "search-service"
  namespace_name      = "search-eventhubns"
}



resource "azurerm_monitor_diagnostic_setting" "example" {
    name                           = "example"
    target_resource_id             = "/subscriptions/sub-id-here" # or would module.sub_deployment.subscription_id work?

    eventhub_name = azurerm_eventhub.example.name

    log {
        category = "Administrative"

        retention_policy {
        enabled = false
    }
}

*/