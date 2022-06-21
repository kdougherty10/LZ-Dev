output "lz-na-dev-required-lab_policy_id" {
  value       = azurerm_policy_definition.lz-na-lab-required-tag.*.id
  description = "The policy definition id for tagging"
}