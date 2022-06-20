variable "custom_prefix" {
  type        = string
  description = "Prefix for custom policy set definitions"
  #default     = "CMS"
}

variable "policyset_definition_category" {
  type        = string
  description = "The category to use for all PolicySet definitions"
  default     = "Custom"
}

variable "custom_policies_tag_governance" {
  type        = list(map(string))
  description = "List of custom policy definitions for the tag_governance policyset"
  default     = []
}

variable "mgmt-grp-def" {
  type        = string
  description = "Where all policy defs get stored"
}