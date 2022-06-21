# terraform {
#   required_version = ">=1.1"
#   required_providers {
#     aviatrix = {
#       source = "AviatrixSystems/aviatrix"
#       version = "=2.20.3"
#     }
#   }
# }

# data "azurerm_billing_mca_account_scope" "billing_mca" {
#   billing_account_name = var.msa_subscription_info["billing_account_name"]
#   billing_profile_name = var.msa_subscription_info["billing_profile_name"]
#   invoice_section_name = var.msa_subscription_info["invoice_section_name"]
# }

# resource "azurerm_subscription" "msa_sub" {
#   subscription_name = "${var.location_identifier}-${var.environment}-${var.workload_name}"
#   billing_scope_id  = data.azurerm_billing_mca_account_scope.billing_mca.id
#   #parent_management_group_id = ""

#   tags = {}
# }


## EA version of creating Subs (enrollment account)
# data "azurerm_billing_enrollment_account_scope" "ea_data" {
#   billing_account_name    = var.ea_subscription_info["billing_account_name"]
#   enrollment_account_name = var.ea_subscription_info["enrollment_account_name"]
# }

# resource "azurerm_subscription" "ea_sub" {
#   subscription_name = "${var.company}-${var.environment}-${var.iteration}"
#   billing_scope_id  = data.azurerm_billing_enrollment_account_scope.ea_data.id
# }

data "azurerm_subscription" "current"{}

resource "azurerm_resource_group" "foundation" {
  name     = var.rg_name
  location = var.location

  tags = {}
}

resource "azurerm_virtual_network" "test" {
  name                = var.vnet_name
  location            = azurerm_resource_group.foundation.location
  resource_group_name = azurerm_resource_group.foundation.name
  address_space       = [var.address_space]

  tags = {}
}

# resource "aviatrix_spoke_gateway" "spoke_gateway" {
#   cloud_type         = 8
#   account_name       = var.spoke_account_name
#   gw_name            = var.spoke_gateway_name
#   vpc_id             = join(":", [azurerm_virtual_network.test.name, azurerm_virtual_network.test.resource_group_name, azurerm_virtual_network.test.guid])
#   vpc_reg            = var.location #this would be tied to whatever region they are going into.
#   gw_size            = var.spoke_gateway_size #set this to as the default starting value
#   #ha_gw_size         = "var.ha_gateway_size 
#   subnet             = var.spoke_subnet #cidr only - we can try to use cidrsubnet()
#   #ha_subnet          = var.ha_subnet
#   single_az_ha       = false
#   enable_active_mesh = true
#   insane_mode        = true
#   manage_transit_gateway_attachment = false
# }

# ## Aviatrix Spoke Transit Attachments
# resource "aviatrix_spoke_transit_attachment" "ew_attachment" {
#   spoke_gw_name   = aviatrix_spoke_gateway.spoke_gateway.gw_name
#   transit_gw_name = var.transit_gateway_name #use "AVX-PRD-CentralUS-Transit-East-West" for prod
# }
# resource "aviatrix_spoke_transit_attachment" "egress_attachment" {
#   spoke_gw_name   = aviatrix_spoke_gateway.spoke_gateway.gw_name
#   transit_gw_name = var.transit_egress_gateway_name
# }