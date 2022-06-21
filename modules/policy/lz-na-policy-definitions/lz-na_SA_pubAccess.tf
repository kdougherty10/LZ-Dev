resource "azurerm_policy_definition" "SA_pubAccess" {
  name                  = "SA_pubAccess"
  policy_type           = "Custom"
  mode                  = "Indexed"
  display_name          = "${var.custom_prefix} Storage account public access should be disallowed"
  description           = "Storage account public access should be disallowed"
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
            "not": {
              "allOf": [
                {
                  "field": "id",
                  "contains": "/resourceGroups/aro-"
                },
                {
                  "anyOf": [
                    {
                      "field": "name",
                      "like": "cluster*"
                    },
                    {
                      "field": "name",
                      "like": "imageregistry*"
                    }
                  ]
                }
              ]
            }
          },
          {
            "not": {
              "field": "Microsoft.Storage/storageAccounts/allowBlobPublicAccess",
              "equals": "false"
            }
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
        "defaultValue": "Deny"
      }
}

PARAMETERS
}