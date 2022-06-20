
data "azurerm_billing_mca_account_scope" "billing_mca" {
  billing_account_name = var.msa_subscription_info["billing_account_name"]
  billing_profile_name = var.msa_subscription_info["billing_profile_name"]
  invoice_section_name = var.msa_subscription_info["invoice_section_name"]
}


resource "azurerm_subscription" "msa_sub" {
  subscription_name = "${var.location_identifier}-${var.environment}-${var.workload_name}"
  billing_scope_id  = data.azurerm_billing_mca_account_scope.billing_mca.id
  #parent_management_group_id = ""
}


/* EA version of creating Subs (enrollment account)
data "azurerm_billing_enrollment_account_scope" "ea_data" {
  billing_account_name    = var.ea_subscription_info["billing_account_name"]
  enrollment_account_name = var.ea_subscription_info["enrollment_account_name"]
}

resource "azurerm_subscription" "ea_sub" {
  subscription_name = "${var.company}-${var.environment}-${var.iteration}"
  billing_scope_id  = data.azurerm_billing_enrollment_account_scope.ea_data.id
}*/


