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

variable "lz-na-platform-required-tag_policy_id" {
  type        = string
description = "The policy definition id for tagging"
}

variable "lz-na-platform-AZ_ISO_policy_id" {
  type        = string
description = "The policy definition id for ISO 27001"
}

variable "lz-na-platform-AZ_NIST_800-53_policy_id" {
  type        = string
description = "The policy definition id for NIST SP 800-53 Rev. 4"
}
