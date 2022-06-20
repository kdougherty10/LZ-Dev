output "it-na-prd-pci-required-tag_policy_id" {
  value       = azurerm_policy_definition.it-na-prd-pci-required-tag.*.id
  description = "The policy definition id for tagging"
}
