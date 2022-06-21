variable "custom_prefix" {
  type        = string
  description = "Prefix for custom policy definitions"
  default     = "CMS"
}

variable "mgmt-grp-def" {
  type        = string
  description = "Where all policy defs get stored"
}

variable "policy_definition_category" {
  type        = string
  description = "The category to use for all Policy Definitions"
  default     = "Custom"
}


variable "lz-root_mandatory_tag_keys" {
  type        = list(any)
  description = "List of mandatory tag keys used by policies 'addTagToRG','inheritTagFromRG','bulkAddTagsToRG','bulkInheritTagsFromRG'"
  default = [
"appid","bu","bc","rc","techowner","billingowner","datedeployed","environment","billtag","cc","geo"
  ]

}

variable "tag-mandatory-values" {
  type        = list(any)
  description = "List of mandatory tag keys used by policy 'require-tags-multiple-values'"
  default = [
    "Public",
    "Internal Use Only",
    "Restricted",
    "Confidential"
  ]
}

variable "lz-na-tag-mandatory-values" {
  type        = list(any)
  description = "List of mandatory tag keys used by policy 'lz-na-tag-mandatory-values'"
  default = [
    "na",

  ]
}

variable "lz-na-platform-tag-mandatory-values" {
  type        = list(any)
  description = "List of mandatory tag keys used by policy 'lz-na-platform-tag-mandatory-values'"
  default = [
    "platform",

  ]
}

variable "lz-na-prd-tag-mandatory-values" {
  type        = list(any)
  description = "List of mandatory tag keys used by policy 'lz-na-prd-tag-mandatory-values'"
  default = [
    "production",

  ]
}

variable "lz-na-prd-pci-tag-mandatory-values" {
  type        = list(any)
  description = "List of mandatory tag keys used by policy 'lz-na-prd-pci-tag-mandatory-values'"
  default = [
    "pci",

  ]
}

variable "lz-na-dev-tag-mandatory-values" {
  type        = list(any)
  description = "List of mandatory tag keys used by policy 'lz-na-dev-tag-mandatory-values'"
  default = [
    "dev",

  ]
}

variable "lz-na-lab-tag-mandatory-values" {
  type        = list(any)
  description = "List of mandatory tag keys used by policy 'lz-na-lab-tag-mandatory-values'"
  default = [
    "lab",

  ]
}

variable "lz-na-stg-tag-mandatory-values" {
  type        = list(any)
  description = "List of mandatory tag keys used by policy 'lz-na-stg-tag-mandatory-values'"
  default = [
    "staging",

  ]
}

variable "lz-apac-tag-mandatory-values" {
  type        = list(any)
  description = "List of mandatory tag keys used by policy 'lz-apac-tag-mandatory-values'"
  default = [
    "apac",

  ]
}