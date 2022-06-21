output "lz-na-prd-pci-required-tag_policy_id" {
  value       = azurerm_policy_definition.lz-na-prd-pci-required-tag.*.id
  description = "The policy definition id for tagging"
}
