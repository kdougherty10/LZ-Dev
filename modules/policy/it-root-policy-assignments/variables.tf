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


variable "cms-tagging-policy_id" {
  type = string
  description = "Policyset Definition for CMS Tag Governance"
  
}