resource "azurerm_policy_definition" "lz-na-SA_KeyAccess" {
  name                  = "lz-na-SA_KeyAccess"
  policy_type           = "Custom"
  mode                  = "Indexed"
  display_name          = "${var.custom_prefix} Storage accounts should prevent shared key access"
  description           = "Storage accounts should prevent shared key access"
  management_group_id = var.mgmt-grp-def

  metadata = <<METADATA
    {
      "category": "Storage"
    }
METADATA

  policy_rule = <<POLICY_RULE
{
      "if": {
        "allOf": [
          {
            "field": "type",
            "equals": "Microsoft.Storage/storageAccounts"
          },
          {
            "field": "Microsoft.Storage/storageAccounts/allowSharedKeyAccess",
            "equals": "true"
          }
        ]
      },
      "then": {
        "effect": "[parameters('effect')]"
      }
    }
POLICY_RULE
parameters  = <<PARAMETERS
{
      "effect": {
        "type": "String",
        "metadata": {
          "description": "The effect determines what happens when the policy rule is evaluated to match",
          "displayName": "effect"
        },
        "allowedValues": [
          "audit",
          "Audit",
          "deny",
          "Deny",
          "disabled",
          "Disabled"
        ],
        "defaultValue": "Audit"
      }
}

PARAMETERS
}