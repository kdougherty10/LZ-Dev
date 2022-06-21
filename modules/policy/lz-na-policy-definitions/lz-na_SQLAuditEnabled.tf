resource "azurerm_policy_definition" "SQL_AuditEnabled" {
  name                  = "SQL_AuditEnabled"
  policy_type           = "Custom"
  mode                  = "Indexed"
  display_name          = "${var.custom_prefix} Configure SQL servers to have auditing enabled"
  description           = "Configure SQL servers to have auditing enabled"
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
            "equals": "Microsoft.Sql/servers"
          },
          {
            "field": "kind",
            "notContains": "analytics"
          }
        ]
      },
      "then": {
        "effect": "[parameters('effect')]",
        "details": {
          "type": "Microsoft.Sql/servers/auditingSettings",
          "name": "default",
          "existenceCondition": {
            "field": "Microsoft.Sql/auditingSettings.state",
            "equals": "[parameters('setting')]"
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
      },
      "setting": {
        "type": "String",
        "metadata": {
          "displayName": "Desired Auditing setting"
        },
        "allowedValues": [
          "enabled",
          "disabled"
        ],
        "defaultValue": "enabled"
      }
}
PARAMETERS
}