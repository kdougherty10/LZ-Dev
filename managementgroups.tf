# Deploying Root Level Management Group "mg-test"
module "mg_test_management_group" {
  source = "./modules/management-group"

  name         = "mg-test"
  display_name = "mg-test"
}

module "it-root" {
  source = "./modules/management-group"

  name         = "it-root"
  display_name = "it-root"
}

module "it-apac" {
  source = "./modules/management-group"

  name         = "it-apac"
  display_name = "it-apac"
}

module "it-na-dev" {
  source = "./modules/management-group"

  name         = "it-na-dev"
  display_name = "it-na-dev"
}

module "it-na-lab" {
  source = "./modules/management-group"

  name         = "it-na-lab"
  display_name = "it-na-lab"
}

module "it-na-platform" {
  source = "./modules/management-group"

  name         = "it-na-platform"
  display_name = "it-na-platform"
}

module "it-na" {
  source = "./modules/management-group"

  name         = "it-na"
  display_name = "it-na"
}

module "it-na-prd-pci" {
  source = "./modules/management-group"

  name         = "it-na-prd-pci"
  display_name = "it-na-prd-pci"
}

module "it-na-prd" {
  source = "./modules/management-group"

  name         = "it-na-prd"
  display_name = "it-na-prd"
}

module "it-na-stg" {
  source = "./modules/management-group"

  name         = "it-na-stg"
  display_name = "it-na-stg"
}


module "apply-sub-to-mg" {
  source = "./modules/apply-to-mg"

  management_group = module.mg_test_management_group.id
  subscription_id  = "/subscriptions/2b7d48e1-cf39-4fdd-bd70-79cd047eb146"
}