resource "azurerm_policy_definition" "lz-apac-required-tag" {
  count = length(var.lz-apac_mandatory_tag_keys)

  name                  = "lz-apac-required-tag"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "${var.custom_prefix} Require tag(s) for lz-apac resources"
  description           = "Requires the mandatory tag key ${var.lz-apac_mandatory_tag_keys[count.index]} when any resource missing this tag is created or updated. \nExisting resource can be remediated by triggering a remediation task.\nIf the tag exists with a different value it will not be changed."
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
            "displayName": "Mandatory Tag ${var.lz-apac_mandatory_tag_keys[count.index]}",
            "description": "Name of the tag, such as ${var.lz-apac_mandatory_tag_keys[count.index]}"
          },
          "defaultValue": "${var.lz-apac_mandatory_tag_keys[count.index]}"
        },
  "possibleTagValues": {
      "type": "Array",
      "metadata": {
        "displayName": "Required Values for Value",
        "description": "All possible allowed values for the tag specified"
      },
      "defaultValue": ${jsonencode(var.lz-apac-tag-mandatory-values)}
    }
  }
PARAMETERS
}

