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

variable "it-na_mandatory_tag_keys" {
  type        = list(any)
  description = "List of mandatory tag keys used by policies 'addTagToRG','inheritTagFromRG','bulkAddTagsToRG','bulkInheritTagsFromRG'"
  default = [
"geo"
  ]

}

variable "it-na-platform_mandatory_tag_keys" {
  type        = list(any)
  description = "List of mandatory tag keys used by policies 'addTagToRG','inheritTagFromRG','bulkAddTagsToRG','bulkInheritTagsFromRG'"
  default = [
"environment"
  ]

}

variable "it-na-prd_mandatory_tag_keys" {
  type        = list(any)
  description = "List of mandatory tag keys used by policies 'addTagToRG','inheritTagFromRG','bulkAddTagsToRG','bulkInheritTagsFromRG'"
  default = [
"environment"
  ]

}

variable "it-na-prd-pci_mandatory_tag_keys" {
  type        = list(any)
  description = "List of mandatory tag keys used by policies 'addTagToRG','inheritTagFromRG','bulkAddTagsToRG','bulkInheritTagsFromRG'"
  default = [
"environment"
  ]

}

variable "it-na-dev_mandatory_tag_keys" {
  type        = list(any)
  description = "List of mandatory tag keys used by policies 'addTagToRG','inheritTagFromRG','bulkAddTagsToRG','bulkInheritTagsFromRG'"
  default = [
"environment"
  ]

}

variable "it-na-lab_mandatory_tag_keys" {
  type        = list(any)
  description = "List of mandatory tag keys used by policies 'addTagToRG','inheritTagFromRG','bulkAddTagsToRG','bulkInheritTagsFromRG'"
  default = [
"environment"
  ]

}

variable "it-apac_mandatory_tag_keys" {
  type        = list(any)
  description = "List of mandatory tag keys used by policies 'addTagToRG','inheritTagFromRG','bulkAddTagsToRG','bulkInheritTagsFromRG'"
  default = [
"geo"
  ]

}

variable "it-na-stg_mandatory_tag_keys" {
  type        = list(any)
  description = "List of mandatory tag keys used by policies 'addTagToRG','inheritTagFromRG','bulkAddTagsToRG','bulkInheritTagsFromRG'"
  default = [
"environment"
  ]

}
/*
variable "it-root_mandatory_tag_keys" {
  type        = list(any)
  description = "List of mandatory tag keys used by policies 'addTagToRG','inheritTagFromRG','bulkAddTagsToRG','bulkInheritTagsFromRG'"
  default = [
"appid","bu","bc","rc","techowner","billingowner","datedeployed","environment","billtag","cc","geo"
  ]

}
*/
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

variable "it-na-tag-mandatory-values" {
  type        = list(any)
  description = "List of mandatory tag keys used by policy 'it-na-tag-mandatory-values'"
  default = [
    "na",

  ]
}

variable "it-na-platform-tag-mandatory-values" {
  type        = list(any)
  description = "List of mandatory tag keys used by policy 'it-na-platform-tag-mandatory-values'"
  default = [
    "platform",

  ]
}

variable "it-na-prd-tag-mandatory-values" {
  type        = list(any)
  description = "List of mandatory tag keys used by policy 'it-na-prd-tag-mandatory-values'"
  default = [
    "production",

  ]
}

variable "it-na-prd-pci-tag-mandatory-values" {
  type        = list(any)
  description = "List of mandatory tag keys used by policy 'it-na-prd-pci-tag-mandatory-values'"
  default = [
    "pci",

  ]
}

variable "it-na-dev-tag-mandatory-values" {
  type        = list(any)
  description = "List of mandatory tag keys used by policy 'it-na-dev-tag-mandatory-values'"
  default = [
    "dev",

  ]
}

variable "it-na-lab-tag-mandatory-values" {
  type        = list(any)
  description = "List of mandatory tag keys used by policy 'it-na-lab-tag-mandatory-values'"
  default = [
    "lab",

  ]
}

variable "it-na-stg-tag-mandatory-values" {
  type        = list(any)
  description = "List of mandatory tag keys used by policy 'it-na-stg-tag-mandatory-values'"
  default = [
    "staging",

  ]
}

variable "it-apac-tag-mandatory-values" {
  type        = list(any)
  description = "List of mandatory tag keys used by policy 'it-apac-tag-mandatory-values'"
  default = [
    "apac",

  ]
}