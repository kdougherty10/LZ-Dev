variable "name" {
  type    = string
  default = null
}

variable "display_name" {
  type    = string
  default = null
}

variable "parent_management_group_id" {
  type    = string
  default = null
}


variable "role_assignments" {
  type = list(object({
    aad_group_name = string
    role_name      = string
  }))
  default = []
}

variable "subscription_id" {
  type    = string
  #default = null

}

variable "management_group" {
  type    = string
 # default = null
}
