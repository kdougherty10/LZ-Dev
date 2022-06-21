output "subscription_id" {
  description = "Azure Subscription ID"
  value       = data.azurerm_subscription.current.id
}

output "subscription_object" {
  description = "Azure Subscription Object"
  value       = data.azurerm_subscription.current
}

# output "subscription_id" {
#   description = "subscription ID"
#   value       = azurerm_subscription.ea_sub.id
# }