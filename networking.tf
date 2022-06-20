/*
data "azurerm_subscription" "current" {
    subscription_id = module.sub_deployment.subscription_id
}



resource "azurerm_network_security_group" "example" {
  name                = "example-security-group"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}




resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
    security_group = azurerm_network_security_group.example
  }

}


#data calls for existing hub outside of tf?

data "azurerm_virtual_network" "example-1" {
  name                = "production"
  resource_group_name = "networking"
}



resource "azurerm_virtual_network" "example-2" {
  name                = "peternetwork2"
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.2.0/24"]
  location            = azurerm_resource_group.example.location
}

resource "azurerm_virtual_network_peering" "example-1" {
  name                      = "peer1to2"
  resource_group_name       = azurerm_resource_group.example.name
  virtual_network_name      = data.azurerm_virtual_network.example-1.name
  remote_virtual_network_id = azurerm_virtual_network.example-2.id
}

resource "azurerm_virtual_network_peering" "example-2" {
  name                      = "peer2to1"
  resource_group_name       = azurerm_resource_group.example.name
  virtual_network_name      = azurerm_virtual_network.example-2.name
  remote_virtual_network_id = data.azurerm_virtual_network.example-1.id
}

*/