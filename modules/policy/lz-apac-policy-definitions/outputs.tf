output "lz-apac-required-tag_policy_id" {
  value       = azurerm_policy_definition.lz-apac-required-tag.*.id
  description = "The policy definition id for tagging"
}
