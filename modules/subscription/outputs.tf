output "subscription_id" {
  description = "Azure Subscription ID"
  value       = azurerm_subscription.msa_sub.id

}

output "subscription_object" {
  description = "Azure Subscription Object"
  value       = azurerm_subscription.msa_sub
}
/*
output "subscription_id" {
  description = "subscription ID"
  value       = azurerm_subscription.ea_sub.id

}*/
