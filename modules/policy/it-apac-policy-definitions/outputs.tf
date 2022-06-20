output "it-apac-required-tag_policy_id" {
  value       = azurerm_policy_definition.it-apac-required-tag.*.id
  description = "The policy definition id for tagging"
}
