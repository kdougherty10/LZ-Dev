output "it-na-dev-required-tag_policy_id" {
  value       = azurerm_policy_definition.it-na-dev-required-tag.*.id
  description = "The policy definition id for tagging"
}

