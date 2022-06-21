  resource "azurerm_management_group_policy_assignment" "lz-na-stg-required-tag" {	
  name = "lz-na-stg-required-tag"	
  policy_definition_id = var.lz-na-stg-required-tag_policy_id	
  management_group_id = var.mgmt-grp-def
  }
