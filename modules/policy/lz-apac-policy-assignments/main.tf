
resource "azurerm_management_group_policy_assignment" "lz-apac-required-tag" {
  name                 = "lz-apac-required-tag"
  policy_definition_id = var.lz-apac-required-tag_policy_id
 management_group_id = var.mgmt-grp-def
}
