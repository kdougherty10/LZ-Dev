
resource "azurerm_management_group_policy_assignment" "it-apac-required-tag" {
  name                 = "it-apac-required-tag"
  policy_definition_id = var.it-apac-required-tag_policy_id
 management_group_id = var.mgmt-grp-def
}
