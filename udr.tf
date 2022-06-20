/*

data "azurerm_subscription" "current" {
    subscription_id = module.sub_deployment.subscription_id
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_route_table" "example" {
  name                          = "example-route-table"
  location                      = azurerm_resource_group.example.location
  resource_group_name           = azurerm_resource_group.example.name
  disable_bgp_route_propagation = false

  route {
    name           = "route1"
    address_prefix = "10.1.0.0/16"
    next_hop_type  = "vnetlocal"
  }

  tags = {
    environment = "Production"
  }
}

*/