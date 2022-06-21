resource "azurerm_policy_definition" "lz-root-required-tag" {
  count = length(var.lz-root_mandatory_tag_keys)

  name                  = "lz-root-required-tag-${var.lz-root_mandatory_tag_keys[count.index]}"
  policy_type           = "Custom"
  mode                  = "All"
  display_name          = "${var.custom_prefix} Require tag(s) ${var.lz-root_mandatory_tag_keys[count.index]} for lz-root resources"
  description           = "Requires the mandatory tag key ${var.lz-root_mandatory_tag_keys[count.index]} when any resource missing this tag is created or updated. \nExisting resource can be remediated by triggering a remediation task.\nIf the tag exists with a different value it will not be changed."
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
              "exists": "false"
            }
          ]
        },
        "then": {
          "effect": "Audit"
        }
  }
POLICY_RULE

  parameters = <<PARAMETERS
    {
        "tagName": {
          "type": "String",
          "metadata": {
            "displayName": "Mandatory Tag ${var.lz-root_mandatory_tag_keys[count.index]}",
            "description": "Name of the tag, such as ${var.lz-root_mandatory_tag_keys[count.index]}"
          },
          "defaultValue": "${var.lz-root_mandatory_tag_keys[count.index]}"
        }
  }

PARAMETERS
}

