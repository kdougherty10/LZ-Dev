resource "azurerm_policy_definition" "SQL_TransparentData" {
  name                  = "SQL_TransparentData"
  policy_type           = "Custom"
  mode                  = "Indexed"
  display_name          = "${var.custom_prefix} Deploy SQL DB transparent data encryption"
  description           = "Deploy SQL DB transparent data encryption"
  management_group_id = var.mgmt-grp-def

  metadata = <<METADATA
    {
      "category": "SQL"
    }

METADATA

  policy_rule = <<POLICY_RULE
{
      "if": {
        "allOf": [
          {
            "field": "type",
            "equals": "Microsoft.Sql/servers/databases"
          },
          {
            "field": "name",
            "notEquals": "master"
          }
        ]
      },
      "then": {
        "effect": "[parameters('effect')]",
        "details": {
          "type": "Microsoft.Sql/servers/databases/transparentDataEncryption",
          "name": "current",
          "existenceCondition": {
            "anyOf": [
              {
                "field": "Microsoft.Sql/transparentDataEncryption.status",
                "equals": "enabled"
              },
              {
                "field": "Microsoft.Sql/servers/databases/transparentDataEncryption/state",
                "equals": "enabled"
              }
            ]
          }
        }
      }
    }
  
  
POLICY_RULE
parameters  = <<PARAMETERS
{
      "effect": {
        "type": "String",
        "metadata": {
          "displayName": "Effect",
          "description": "Enable or disable the execution of the policy"
        },
        "allowedValues": [
          "AuditIfNotExists",
          "Disabled"
        ],
        "defaultValue": "AuditIfNotExists"
      }
    }

PARAMETERS
}