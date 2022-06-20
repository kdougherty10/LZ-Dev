  resource "azurerm_management_group_policy_assignment" "it-na-stg-required-tag" {	
  name = "it-na-stg-required-tag"	
  policy_definition_id = var.it-na-stg-required-tag_policy_id	
  management_group_id = var.mgmt-grp-def
  }
