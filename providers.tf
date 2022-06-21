provider "azuread" {
  tenant_id =  var.tenant_id
 } 

provider "azurerm" {
  subscription_id = "2b7d48e1-cf39-4fdd-bd70-79cd047eb146"
  features {
  }
 }