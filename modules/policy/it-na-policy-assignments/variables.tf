data "azurerm_subscription" "current" {
}

variable "custom_prefix" {
  type        = string
  description = "Prefix for custom policy assignments"
  default     = "CMS"
}

variable "mgmt-grp-def" {
  type        = string
  description = "Where all policy defs get stored"
}

variable "it-na-required-tag_policy_id" {
  type        = string
description = "The policy definition id for tagging"
}

variable "it-na-allowed_location_policy_id" {
  type        = string
description = "The policy definition id for allowed resource locations"
}

variable "it-na-AZ_SecurityBenchmark_id" {
  type        = string
description = "The policy definition id for the Azure Security Benchmark Policy"
}

variable "it-na-SA_KeyAccess_id" {
  type        = string
description = "The policy definition id for storage account key access"
}

variable "it-na-SA_KeyNotExpired_id" {
  type        = string
description = "The policy definition id for storage account key policy"
}

variable "it-na-SA_MSAccess_id" {
  type        = string
description = "The policy definition id for storage account access"
}

variable "it-na-SA_pubAccess_id" {
  type        = string
description = "The policy definition id for storage account public access"
}

variable "it-na-SA_SecureTransfer_id" {
  type        = string
description = "The policy definition id for storage account secure transfer"
}

variable "it-na-SQL_TransparentData_id" {
  type        = string
description = "The policy definition id for enabling SQL transparent data"
}

variable "it-na-SQL_AuditEnabled_id" {
  type        = string
description = "The policy definition id for enabling audit of SQL servers"
}

variable "it-na-VMAudit_ManagedDisk_id" {
  type        = string
description = "The policy definition id for auditing VMs using managed disks"
}

variable "it-na-vm_sku_policy_id" {
  type        = string
description = "The policy definition id for allowed SKUs for VMs"
}