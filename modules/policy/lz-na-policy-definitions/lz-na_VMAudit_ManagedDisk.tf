resource "azurerm_policy_definition" "VMAudit_ManagedDisk" {
  name                  = "VMAudit_ManagedDisk"
  policy_type           = "Custom"
  mode                  = "Indexed"
  display_name          = "${var.custom_prefix} Audit VMs that do not use managed disks"
  description           = "Audit VMs that do not use managed disks"
  management_group_id = var.mgmt-grp-def

  metadata = <<METADATA
    {
      "category": "Compute"
    }

METADATA

  policy_rule = <<POLICY_RULE
{
     "if": {
        "anyOf": [
          {
            "allOf": [
              {
                "field": "type",
                "equals": "Microsoft.Compute/virtualMachines"
              },
              {
                "field": "Microsoft.Compute/virtualMachines/osDisk.uri",
                "exists": "True"
              }
            ]
          },
          {
            "allOf": [
              {
                "field": "type",
                "equals": "Microsoft.Compute/VirtualMachineScaleSets"
              },
              {
                "anyOf": [
                  {
                    "field": "Microsoft.Compute/VirtualMachineScaleSets/osDisk.vhdContainers",
                    "exists": "True"
                  },
                  {
                    "field": "Microsoft.Compute/VirtualMachineScaleSets/osdisk.imageUrl",
                    "exists": "True"
                  }
                ]
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
          "displayName": "Effect",
          "description": "Enable or disable the execution of the policy"
        },
        "allowedValues": [
          "Audit",
          "Disabled"
        ],
        "defaultValue": "Audit"
      }
}
PARAMETERS
}
