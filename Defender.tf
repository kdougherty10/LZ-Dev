/*

data "azurerm_subscription" "current" {
    subscription_id = module.sub_deployment.subscription_id
}

resource "azurerm_security_center_subscription_pricing" "VM" {
  tier          = "Standard"
  resource_type = "VirtualMachines"
}

resource "azurerm_security_center_subscription_pricing" "SQL" {
  tier          = "Standard"
  resource_type = "SQLServers"
}

resource "azurerm_security_center_subscription_pricing" "SQLVM" {
  tier          = "Standard"
  resource_type = "SqlServerVirtualMachines"
}

resource "azurerm_security_center_subscription_pricing" "StorageAccounts" {
  tier          = "Standard"
  resource_type = "StorageAccounts"
}

resource "azurerm_security_center_subscription_pricing" "AppServices" {
  tier          = "Standard"
  resource_type = "AppServices"
}

*/