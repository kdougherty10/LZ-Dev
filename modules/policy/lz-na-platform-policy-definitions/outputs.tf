output "lz-na-platform-required-tag_policy_id" {
  value       = azurerm_policy_definition.lz-na-platform-required-tag.*.id
  description = "The policy definition id for tagging"
}

