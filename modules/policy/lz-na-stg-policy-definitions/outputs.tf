output "lz-na-stg-required-tag_policy_id" {
  value       = azurerm_policy_definition.lz-na-stg-required-tag.*.id
  description = "The policy definition id for tagging"
}


