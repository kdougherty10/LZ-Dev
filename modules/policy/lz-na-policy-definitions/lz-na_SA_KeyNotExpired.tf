resource "azurerm_policy_definition" "SA_KeyNotExpired" {
  name                  = "SA_KeyNotExpired"
  policy_type           = "Custom"
  mode                  = "Indexed"
  display_name          = "${var.custom_prefix} Storage account keys should not be expired"
  description           = "Storage account keys should not be expired"
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
                "value": "[utcNow()]",
                "greater": "[if(and(not(empty(coalesce(field('Microsoft.Storage/storageAccounts/keyCreationTime.key1'), ''))), not(empty(string(coalesce(field('Microsoft.Storage/storageAccounts/keyPolicy.keyExpirationPeriodInDays'), ''))))), addDays(field('Microsoft.Storage/storageAccounts/keyCreationTime.key1'), field('Microsoft.Storage/storageAccounts/keyPolicy.keyExpirationPeriodInDays')), utcNow())]"
              },
              {
                "value": "[utcNow()]",
                "greater": "[if(and(not(empty(coalesce(field('Microsoft.Storage/storageAccounts/keyCreationTime.key2'), ''))), not(empty(string(coalesce(field('Microsoft.Storage/storageAccounts/keyPolicy.keyExpirationPeriodInDays'), ''))))), addDays(field('Microsoft.Storage/storageAccounts/keyCreationTime.key2'), field('Microsoft.Storage/storageAccounts/keyPolicy.keyExpirationPeriodInDays')), utcNow())]"
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