


resource "azurerm_role_definition" "customRBAC" {
  name        = var.name
  scope       = var.scope
  description = var.description

  permissions {
    actions     = var.actions #"*"
    not_actions = var.not_actions
  }

  assignable_scopes = var.assignable_scopes # /subscriptions/00000000-0000-0000-0000-000000000000
  
}