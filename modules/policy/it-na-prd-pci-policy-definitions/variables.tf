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


variable "it-na-prd-pci_mandatory_tag_keys" {
  type        = list(any)
  description = "List of mandatory tag keys used by policies 'addTagToRG','inheritTagFromRG','bulkAddTagsToRG','bulkInheritTagsFromRG'"
  default = [
"environment"
  ]

}

variable "it-na-prd-pci-tag-mandatory-values" {
  type        = list(any)
  description = "List of mandatory tag keys used by policy 'it-na-prd-pci-tag-mandatory-values'"
  default = [
    "pci",

  ]
}
