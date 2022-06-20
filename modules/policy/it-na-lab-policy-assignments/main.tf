  resource "azurerm_management_group_policy_assignment" "it-na-dev-required-lab" {	
  name = "it-na-dev-required-lab"	
  policy_definition_id = var.it-na-dev-required-lab_policy_id	
  management_group_id = var.mgmt-grp-def
  }