variable "name" {
  type        = string
}

variable "scope" {
  type = string
}

variable "actions" {
  type = list
}

variable "assignable_scopes" {
  type = list
}

variable "subscription_name" {
  type = string 
}

variable "description" {
  type = string
}

variable "not_actions" {
  type = list
}