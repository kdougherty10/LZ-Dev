resource "azurerm_management_group_policy_assignment" "it-na-dev-required-tag" {	
  name = "it-na-dev-required-tag"	
  policy_definition_id = var.it-na-dev-required-tag_policy_id	
  management_group_id = var.mgmt-grp-def
  }
