/*
module "sub_deployment" {
  source              = "./modules/policy/subscription"
  #the following are used for naming the subscription
  location_identifier = var.sub_location
  workload_name       = var.workload_name
  environment         = var.environment
  ea_subscription_info = {
    billing_account_name    = "1234567890"
    enrollment_account_name = "0123456"
  }
  msa_subscription_info = {
    billing_account_name = "NeedInfo"
    billing_profile_name = "NeedInfo"
    invoice_section_name = "NeedInfo"
  }


}

output "subscription_id" {
  value = module.sub_deployment.subscription_id
}

output "subscription_object" {
  value = module.sub_deployment.subscription_object

}
*/