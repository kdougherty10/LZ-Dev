resource "azurerm_policy_definition" "it-na-allowed_location" {
  name                  = "it-na-allowed_location"
  policy_type           = "Custom"
  mode                  = "Indexed"
  display_name          = "${var.custom_prefix} Allowed Resource Locations for Deployments"
  description           = "Allowed Resource Locations for Deployments"
  management_group_id = var.mgmt-grp-def

  metadata = <<METADATA
    {
    "category": "General"
    }

METADATA

  policy_rule = <<POLICY_RULE
{
      "if": {
        "allOf": [
          {
            "field": "location",
            "notIn": "[parameters('allowed-resource-locations')]"
          },
          {
            "field": "location",
            "notEquals": "global"
          },
          {
            "field": "type",
            "notEquals": "Microsoft.AzureActiveDirectory/b2cDirectories"
          }
        ]
      },
      "then": {
        "effect": "deny"
      }
    }
POLICY_RULE
  parameters  = <<PARAMETERS
{
      "allowed-resource-locations": {
        "type": "Array",
        "metadata": {
          "description": "The list of locations that can be deployed.",
          "displayName": "Allowed locations",
          "strongType": "resourceTypes"
        },
        "defaultValue": ["eastus 2", "central us"]
      }
}

PARAMETERS
}
