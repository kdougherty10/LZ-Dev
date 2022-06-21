

output "lz-na-prd-required-tag_policy_id" {
  value       = azurerm_policy_definition.lz-na-prd-required-tag.*.id
  description = "The policy definition id for tagging"
}

output "lz-na-prd_sa_sku_policy_id" {
  value       = azurerm_policy_definition.sa_sku_policy.id
  description = "The policy definition id for allowed storage account SKUs"
}
