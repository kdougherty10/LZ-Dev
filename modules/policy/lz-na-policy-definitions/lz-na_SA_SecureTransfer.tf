resource "azurerm_policy_definition" "SA_SecureTransfer" {
  name                  = "SA_SecureTransfer"
  policy_type           = "Custom"
  mode                  = "Indexed"
  display_name          = "${var.custom_prefix} Secure transfer to storage accounts should be enabled"
  description           = "Secure transfer to storage accounts should be enabled"
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
            "anyOf": [
              {
                "allOf": [
                  {
                    "value": "[requestContext().apiVersion]",
                    "less": "2019-04-01"
                  },
                  {
                    "field": "Microsoft.Storage/storageAccounts/supportsHttpsTrafficOnly",
                    "exists": "false"
                  }
                ]
              },
              {
                "field": "Microsoft.Storage/storageAccounts/supportsHttpsTrafficOnly",
                "equals": "false"
              }
            ]
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