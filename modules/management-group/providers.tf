provider "azuread" {
  tenant_id =  var.tenant_id
 }

provider "azurerm" {
  subscription_id = var.subscription_id
  features {
  }
 }