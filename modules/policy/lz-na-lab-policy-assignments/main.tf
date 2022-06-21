  resource "azurerm_management_group_policy_assignment" "lz-na-dev-required-lab" {	
  name = "lz-na-dev-required-lab"	
  policy_definition_id = var.lz-na-dev-required-lab_policy_id	
  management_group_id = var.mgmt-grp-def
  }