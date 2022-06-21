# variable "location_identifier" {
#   description = "The Azure region shorthand name used for naming resources and location deployment of resources. example is az1"
#   type        = string
#   #default     = "az1"
# }

# variable "environment" {
#   description = "Environment name. example is prd"
#   type        = string
#   #default     = "dev"
# }

# variable "workload_name" {
#   description = "Application or Function name that will be used in naming convention"
#   type        = string
#   #default     = "greendot"
# }

# variable "ea_subscription_info" {
#   description = "EA information required to deploy Azure subscription"
#   type = object({
#     billing_account_name    = string
#     enrollment_account_name = string
#   })
#   default = null
# }

# variable "msa_subscription_info" {
#   description = "MSA information required to deploy Azure subscription"
#   type = object({
#     billing_account_name = string
#     billing_profile_name = string
#     invoice_section_name = string
#   })
#   default = null
# }

variable "rg_name" {
    description = ""
    type = string
}

variable "vnet_name" {
    description = ""
    type = string
}

variable "address_space" {
    description = ""
    type = string
}

# variable "spoke_account_name" {
#     description = ""
#     type = string
# }

# variable "spoke_gateway_name" {
#     description = ""
#     type = string
# }

variable "location" {
    description = ""
    type = string
}

# variable "spoke_gateway_size" {
#     description = ""
#     type = string
# }

# variable "ha_gateway_size" {
#     description = ""
#     type = string
# }

# variable "spoke_subnet" {
#     description = ""
#     type = string
# }

# variable "ha_subnet" {
#     description = ""
#     type = string
# }

# variable "transit_gateway_name" {
#     description = ""
#     type = string
# }

# variable "transit_egress_gateway_name" {
#     description = ""
#     type = string
# }