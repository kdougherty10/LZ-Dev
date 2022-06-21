output "lz-na-required-tag_policy_id" {
  value       = azurerm_policy_definition.lz-na-required-tag.*.id
  description = "The policy definition id for tagging"
}

output "lz-na-allowed_location_policy_id" {
  value       = azurerm_policy_definition.lz-na-allowed_location.id
  description = "The policy definition id for allowed resource locations"
}

output "lz-na-SA_KeyAccess_id" {
  value       = azurerm_policy_definition.lz-na-SA_KeyAccess.id
  description = "The policy definition id for storage account key access"
}

output "lz-na-SA_KeyNotExpired_id" {
  value       = azurerm_policy_definition.SA_KeyNotExpired.id
  description = "The policy definition id for storage account key policy"
}

output "lz-na-SA_MSAccess_id" {
  value       = azurerm_policy_definition.SA_MSAccess.id
  description = "The policy definition id for storage account access"
}

output "lz-na-SA_pubAccess_id" {
  value       = azurerm_policy_definition.SA_pubAccess.id
  description = "The policy definition id for storage account public access"
}

output "lz-na-SA_SecureTransfer_id" {
  value       = azurerm_policy_definition.SA_SecureTransfer.id
  description = "The policy definition id for storage account secure transfer"
}

output "lz-na-SQL_TransparentData_id" {
  value       = azurerm_policy_definition.SQL_TransparentData.id
  description = "The policy definition id for enabling SQL transparent data"
}

output "lz-na-SQL_AuditEnabled_id" {
  value       = azurerm_policy_definition.SQL_AuditEnabled.id
  description = "The policy definition id for enabling audit of SQL servers"
}

output "lz-na-VMAudit_ManagedDisk_id" {
  value       = azurerm_policy_definition.VMAudit_ManagedDisk.id
  description = "The policy definition id for auditing VMs using managed disks"
}

output "lz-na-vm_sku_policy_id" {
  value       = azurerm_policy_definition.vm_sku_policy.id
  description = "The policy definition id for allowed SKUs for VMs"
}