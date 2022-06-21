resource "azurerm_policy_definition" "lz-na-lab-required-tag" {
  count = length(var.lz-na-lab_mandatory_tag_keys)

  name                  = "lz-na-lab-required-tag"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "${var.custom_prefix} Require tag(s) for lz-na-lab resources"
  description           = "Requires the mandatory tag key ${var.lz-na-lab_mandatory_tag_keys[count.index]} when any resource missing this tag is created or updated. \nExisting resource can be remediated by triggering a remediation task.\nIf the tag exists with a different value it will not be changed."
  management_group_id = var.mgmt-grp-def
  metadata              = <<METADATA
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
          "field": "[concat('tags[', parameters('tagName'), ']')]",
          "notIn": "[parameters('possibleTagValues')]"
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
        "tagName": {
          "type": "String",
          "metadata": {
            "displayName": "Mandatory Tag ${var.lz-na-lab_mandatory_tag_keys[count.index]}",
            "description": "Name of the tag, such as ${var.lz-na-lab_mandatory_tag_keys[count.index]}"
          },
          "defaultValue": "${var.lz-na-lab_mandatory_tag_keys[count.index]}"
        },
  "possibleTagValues": {
      "type": "Array",
      "metadata": {
        "displayName": "Required Values for Value",
        "description": "All possible allowed values for the tag specified"
      },
      "defaultValue": ${jsonencode(var.lz-na-lab-tag-mandatory-values)}
    }
  }
PARAMETERS
}

