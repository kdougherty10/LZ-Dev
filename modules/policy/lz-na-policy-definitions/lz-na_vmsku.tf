resource "azurerm_policy_definition" "vm_sku_policy" {
  name                  = "Allowed virtual machine size SKUs"
  policy_type           = "Custom"
  mode                  = "Indexed"
  display_name          = "${var.custom_prefix} policy enables you to specify a set of virtual machine size SKUs that your organization can deploy."
  description           = "Allows only approved VMs SKUs to be deployed."
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
		"allOf": [{
				"field": "type",
				"equals": "Microsoft.Compute/virtualMachines"
			},
			{
				"not": {
					"field": "Microsoft.Compute/virtualMachines/sku.name",
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
        "description": "The list of size SKUs that can be specified for virtual machines.",
        "strongType": "VMSKUs"
      },
        "defaultValue": ["standard_d16s_v3","standard_d2s_v3","standard_d4s_v3","standard_d8s_v3","standard_ds1_v2","standard_e2s_v3","standard_e32_v3","standard_e4s_v3","standard_e64s_v3","standard_e8s_v3","standard_f16s_v2","standard_f32s_v2","standard_f4s_v2","standard_f64s_v2","standard_f8s_v2","standard_l16s_v2","standard_l32s_v2","standard_l64s_v2","standard_d64s_v3","standard_d32s_v3"]
    }
}

PARAMETERS
}