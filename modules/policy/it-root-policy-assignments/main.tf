resource "azurerm_management_group_policy_assignment" "cms-tagging" {	
  name = "CMS Tag Governance"	
  policy_definition_id = var.cms-tagging-policy_id	
  management_group_id = var.mgmt-grp-def
  }
