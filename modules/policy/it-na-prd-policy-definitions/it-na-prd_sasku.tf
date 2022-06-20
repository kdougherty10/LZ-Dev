resource "azurerm_policy_definition" "sa_sku_policy" {
  name                  = "Allowed storage account size SKUs"
  policy_type           = "Custom"
  mode                  = "Indexed"
  display_name          = "${var.custom_prefix} policy enables you to specify a set of storage account size SKUs that your organization can deploy."
  description           = "Allows only approved Storage Account SKUs to be deployed."
  management_group_id = var.mgmt-grp-def

  metadata = <<METADATA
    {
    "category": "${var.policy_definition_category}",
    "version" : "1.0.0"
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
              "field": "Microsoft.Storage/storageAccounts/sku.name",
              "in": "[parameters('listOfAllowedSKUs')]"
            }
          }
        ]
      },
	"then": {
		"effect": "deny"
	}
}
POLICY_RULE


  parameters = <<PARAMETERS
{
    "listOfAllowedSKUs": {
      "type": "Array",
      "metadata": {
        "displayName": "Allowed Size SKUs",
        "description": "The list of size SKUs that can be specified for storage accounts.",
        "strongType": "SASKUs"
      },
        "defaultValue": ["standard_lrs","standard_ragrs","standard_zrs","standard_grs"]
    }
}

PARAMETERS
}