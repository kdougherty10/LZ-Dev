variable "mgmt-grp-def" {
  type        = string
  description = "Where all policy defs get stored"
  default     = "PolicyTesting"
}

variable "sub_location" {
  type        = string
  description = "Location to be used in naming subscription"
  default     = "CUS"
}

variable "workload_name" {
  type        = string
  description = "Workload Name to be used in naming subscription"
  default     = "app"
}

variable "environment" {
  type        = string
  description = "Environment to be used in naming subscription"
  default     = "Test"
}

#Needs to be changed after moving to Cummins
variable "subscription" {
  type = string
  default = "/subscriptions/2b7d48e1-cf39-4fdd-bd70-79cd047eb146"
}

variable "subscription_name" {
 default = "Crashdog"  
}

variable "tenant_id" {
  type    = string
  default = "a7dcd46f-38eb-446c-9d97-3dc7d843f097"
}