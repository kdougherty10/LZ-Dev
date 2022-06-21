# Deploying Root Level Management Group "mg-test"
module "mg_test_management_group" {
  source = "./modules/management-group"

  name         = "mg-test"
  display_name = "mg-test"
}

module "lz-root" {
  source = "./modules/management-group"

  name         = "lz-root"
  display_name = "lz-root"
}

module "lz-apac" {
  source = "./modules/management-group"

  name         = "lz-apac"
  display_name = "lz-apac"
}

module "lz-na-dev" {
  source = "./modules/management-group"

  name         = "lz-na-dev"
  display_name = "lz-na-dev"
}

module "lz-na-lab" {
  source = "./modules/management-group"

  name         = "lz-na-lab"
  display_name = "lz-na-lab"
}

module "lz-na-platform" {
  source = "./modules/management-group"

  name         = "lz-na-platform"
  display_name = "lz-na-platform"
}

module "lz-na" {
  source = "./modules/management-group"

  name         = "lz-na"
  display_name = "lz-na"
}

module "lz-na-prd-pci" {
  source = "./modules/management-group"

  name         = "lz-na-prd-pci"
  display_name = "lz-na-prd-pci"
}

module "lz-na-prd" {
  source = "./modules/management-group"

  name         = "lz-na-prd"
  display_name = "lz-na-prd"
}

module "lz-na-stg" {
  source = "./modules/management-group"

  name         = "lz-na-stg"
  display_name = "lz-na-stg"
}


module "apply-sub-to-mg" {
  source = "./modules/apply-to-mg"

  management_group = module.mg_test_management_group.id
  subscription_id  = "/subscriptions/2b7d48e1-cf39-4fdd-bd70-79cd047eb146"
}