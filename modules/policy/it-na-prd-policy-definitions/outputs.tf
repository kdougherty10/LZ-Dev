

output "it-na-prd-required-tag_policy_id" {
  value       = azurerm_policy_definition.it-na-prd-required-tag.*.id
  description = "The policy definition id for tagging"
}

output "it-na-prd_sa_sku_policy_id" {
  value       = azurerm_policy_definition.sa_sku_policy.id
  description = "The policy definition id for allowed storage account SKUs"
}
