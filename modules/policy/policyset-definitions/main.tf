resource "azurerm_policy_set_definition" "tag_governance" {
  name                  = "tag_governance_${random_integer.priority.result}"
  policy_type           = "Custom"
  display_name          = "${var.custom_prefix} Tag Governance"
  description           = "Contains common Tag Governance policies"
  management_group_id = var.mgmt-grp-def

  metadata = <<METADATA
    {
    "category": "${var.policyset_definition_category}"
    }

METADATA

  dynamic "policy_definition_reference" {
    for_each = var.custom_policies_tag_governance
    content {
      policy_definition_id = policy_definition_reference.value["policyID"]
      reference_id         = policy_definition_reference.value["policyID"]
    }
  }
}

resource "random_integer" "priority" {
  min = 1
  max = 50000
  keepers = {
    # Generate a new integer each time we switch to a new listener ARN
    listener_arn = "39"
  }
}