# AzureRM PolicySet Definitions - Terraform child module

Get in touch :octocat:

* Twitter: [@coder_au](https://twitter.com/coder_au)
* LinkedIn: [@JesseLoudon](https://www.linkedin.com/in/jesseloudon/)
* Web: [jloudon.com](https://jloudon.com)
* GitHub: [@JesseLoudon](https://github.com/jesseloudon)

Learning resources :books:

* [https://www.terraform.io/docs/providers/azurerm/r/policy_set_definition.html](https://www.terraform.io/docs/providers/azurerm/r/policy_set_definition.html)
* [https://docs.microsoft.com/en-us/azure/governance/policy/concepts/initiative-definition-structure](https://docs.microsoft.com/en-us/azure/governance/policy/concepts/initiative-definition-structure)

## Module files

* `main.tf`
* `outputs.tf`
* `variables.tf`
* `data.tf`

## Resources (main.tf)

| Resource Type | Resource name | Deployment Count
|:--------------|:--------------|:----------------
| azurerm_policy_set_definition | `tag_governance` | 4


## Input variables (variables.tf)

| Name | Description | Type | Default Value
|:------|:-------------|:------|:---------
| `policyset_definition_category` | The category to use for all PolicySet definitions | `string` | "Custom"
| `custom_policies_tag_governance` | List of custom policy definitions for the tag_governance policyset | `list(map(string))` | null

## Output variables (outputs.tf)

| Name | Description | Value
|:-------|:-----------|:----------
| `enforce_tag_governance_policyset_id` | The policy set definition id for tag_governance | azurerm_policy_set_definition.tag_governance.id
| `tag_governance_policyset_id` | The policy set definition id for tag_governance | azurerm_policy_set_definition.tag_governance.id
