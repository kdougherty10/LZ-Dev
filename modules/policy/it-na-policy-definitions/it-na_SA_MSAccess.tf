resource "azurerm_policy_definition" "SA_MSAccess" {
  name                  = "SA_MSAccess"
  policy_type           = "Custom"
  mode                  = "Indexed"
  display_name          = "${var.custom_prefix} Storage accounts should allow access from trusted Microsoft services"
  description           = "Storage accounts should allow access from trusted Microsoft services"
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
            "field": "Microsoft.Storage/storageAccounts/networkAcls.bypass",
            "exists": "true"
          },
          {
            "field": "Microsoft.Storage/storageAccounts/networkAcls.bypass",
            "notContains": "AzureServices"
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