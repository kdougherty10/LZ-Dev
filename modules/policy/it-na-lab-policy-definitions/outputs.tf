output "it-na-dev-required-lab_policy_id" {
  value       = azurerm_policy_definition.it-na-lab-required-tag.*.id
  description = "The policy definition id for tagging"
}