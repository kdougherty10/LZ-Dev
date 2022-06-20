## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 2.69.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.69.0 |

## Modules

consumption_budget
log-analytics
manamgent groups
azure policies assignments, definitions, and initiatives/policysets

## Resources

| Name | Type |
|------|------|
| [azurerm_subscription.msa_sub](https://registry.terraform.io/providers/hashicorp/azurerm/2.69.0/docs/resources/subscription) | resource |
| [azurerm_billing_mca_account_scope.billing_mca](https://registry.terraform.io/providers/hashicorp/azurerm/2.69.0/docs/data-sources/billing_mca_account_scope) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_company"></a> [company](#input\_company) | Company ABV used in naming concatenation of resources. Possible values should be 'FNF'(Fidelity National Financial) 'SLK' (Service Link) | `string` | n/a | yes |
| <a name="input_ea_subscription_info"></a> [ea\_subscription\_info](#input\_ea\_subscription\_info) | EA information required to deploy Azure subscription | <pre>object({<br>    billing_account_name    = string<br>    enrollment_account_name = string<br>  })</pre> | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment ABV used in naming concatenation of resources. 'prod' (Production) 'test' (Test) 'uat' (User Acceptance Testing) 'loadtest' (Load Test) 'qa' (Quality Assurance) 'dev' (Development) 'dr' (Disaster Recovery) 'sb' (Sandbox) | `string` | n/a | yes |
| <a name="input_iteration"></a> [iteration](#input\_iteration) | Appended to end of resource naming convention. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subscription_id"></a> [subscription\_id](#output\_subscription\_id) | subscription ID |

## Example

```json
module "sub_deployment" {
  source = "../"

  company     = "fnf"
  environment = "dev"
  iteration   = "01"
  ea_subscription_info = {
    billing_account_name    = "1234567890"
    enrollment_account_name = "0123456"
  }

}
```