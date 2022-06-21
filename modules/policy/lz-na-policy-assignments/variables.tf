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

variable "lz-na-required-tag_policy_id" {
  type        = string
description = "The policy definition id for tagging"
}

variable "lz-na-allowed_location_policy_id" {
  type        = string
description = "The policy definition id for allowed resource locations"
}

variable "lz-na-AZ_SecurityBenchmark_id" {
  type        = string
description = "The policy definition id for the Azure Security Benchmark Policy"
}

variable "lz-na-SA_KeyAccess_id" {
  type        = string
description = "The policy definition id for storage account key access"
}

variable "lz-na-SA_KeyNotExpired_id" {
  type        = string
description = "The policy definition id for storage account key policy"
}

variable "lz-na-SA_MSAccess_id" {
  type        = string
description = "The policy definition id for storage account access"
}

variable "lz-na-SA_pubAccess_id" {
  type        = string
description = "The policy definition id for storage account public access"
}

variable "lz-na-SA_SecureTransfer_id" {
  type        = string
description = "The policy definition id for storage account secure transfer"
}

variable "lz-na-SQL_TransparentData_id" {
  type        = string
description = "The policy definition id for enabling SQL transparent data"
}

variable "lz-na-SQL_AuditEnabled_id" {
  type        = string
description = "The policy definition id for enabling audit of SQL servers"
}

variable "lz-na-VMAudit_ManagedDisk_id" {
  type        = string
description = "The policy definition id for auditing VMs using managed disks"
}

variable "lz-na-vm_sku_policy_id" {
  type        = string
description = "The policy definition id for allowed SKUs for VMs"
}