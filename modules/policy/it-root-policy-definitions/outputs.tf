output "it-root-required-tag_policy_id" {
  value       = azurerm_policy_definition.it-root-required-tag.*.id
  description = "The policy definition id for tagging"
}