resource "azurerm_management_group_policy_assignment" "lz-na-dev-required-tag" {	
  name = "lz-na-dev-required-tag"	
  policy_definition_id = var.lz-na-dev-required-tag_policy_id	
  management_group_id = var.mgmt-grp-def
  }
