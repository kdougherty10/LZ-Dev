#IT Root Policies
module "it-root-policy-definitions" {
  source       = "./modules/policy/it-root-policy-definitions"
  mgmt-grp-def = module.it-root.id # location where the policies are stored
}

module "it-root-policy_assignments" {
  # policies being assigned

  source       = "./modules/policy/it-root-policy-assignments"
  mgmt-grp-def = module.it-root.id # location where the policies are stored

  #policy IDs

  cms-tagging-policy_id	 = module.policyset_definitions.tag_governance_policyset_id
}

module "policyset_definitions" {
  source = "./modules/policy/policyset-definitions"
  mgmt-grp-def = module.it-root.id # location where the policies are stored
  custom_prefix = "CMS"

 custom_policies_tag_governance = [
   {
      policyID = module.it-root-policy-definitions.it-root-required-tag_policy_id[0]
    },
        {
      policyID = module.it-root-policy-definitions.it-root-required-tag_policy_id[1]
    },
        {
      policyID = module.it-root-policy-definitions.it-root-required-tag_policy_id[2]
    },
        {
      policyID = module.it-root-policy-definitions.it-root-required-tag_policy_id[3]
    },
        {
      policyID = module.it-root-policy-definitions.it-root-required-tag_policy_id[4]
    },
        {
      policyID = module.it-root-policy-definitions.it-root-required-tag_policy_id[5]
    },
        {
      policyID = module.it-root-policy-definitions.it-root-required-tag_policy_id[6]
    },
        {
      policyID = module.it-root-policy-definitions.it-root-required-tag_policy_id[7]
    },
        {
      policyID = module.it-root-policy-definitions.it-root-required-tag_policy_id[8]
    },
        {
      policyID = module.it-root-policy-definitions.it-root-required-tag_policy_id[9]
    },
        {
      policyID = module.it-root-policy-definitions.it-root-required-tag_policy_id[10]
    },
 ]
}

#IT-NA Policies

module "it-na-policy-definitions" {
  source       = "./modules/policy/it-na-policy-definitions"
  mgmt-grp-def = module.it-na.id # location where the policies are stored
}

module "it-na-policy_assignments" {
  # policies being assigned

  source       = "./modules/policy/it-na-policy-assignments"
  mgmt-grp-def = module.it-na.id # location where the policies are stored

  
  it-na-SA_KeyNotExpired_id             = module.it-na-policy-definitions.it-na-SA_KeyNotExpired_id
  it-na-SA_MSAccess_id                  = module.it-na-policy-definitions.it-na-SA_MSAccess_id
  it-na-SA_pubAccess_id                 = module.it-na-policy-definitions.it-na-SA_pubAccess_id
  it-na-SA_SecureTransfer_id            = module.it-na-policy-definitions.it-na-SA_SecureTransfer_id
  it-na-SQL_AuditEnabled_id             = module.it-na-policy-definitions.it-na-SQL_AuditEnabled_id
  it-na-SQL_TransparentData_id          = module.it-na-policy-definitions.it-na-SQL_TransparentData_id
  it-na-vm_sku_policy_id                = module.it-na-policy-definitions.it-na-vm_sku_policy_id
  it-na-VMAudit_ManagedDisk_id          = module.it-na-policy-definitions.it-na-VMAudit_ManagedDisk_id
  it-na-required-tag_policy_id	        = module.it-na-policy-definitions.it-na-required-tag_policy_id[0]
  it-na-SA_KeyAccess_id                 = module.it-na-policy-definitions.it-na-SA_KeyAccess_id
  it-na-allowed_location_policy_id      = module.it-na-policy-definitions.it-na-allowed_location_policy_id
  it-na-AZ_SecurityBenchmark_id         = "/providers/Microsoft.Authorization/policySetDefinitions/1f3afdf9-d0c9-4c3d-847f-89da613e70a8"	

}

#IT-APAC Policies

module "it-apac-policy-definitions" {
  source       = "./modules/policy/it-apac-policy-definitions"
  mgmt-grp-def = module.it-apac.id # location where the policies are stored
}

module "it-apac-policy_assignments" {
  # policies being assigned

  source       = "./modules/policy/it-apac-policy-assignments"
  mgmt-grp-def = module.it-apac.id # location where the policies are stored

  it-apac-required-tag_policy_id = module.it-apac-policy-definitions.it-apac-required-tag_policy_id[0]

}

#IT-NA-PRD Policies

module "it-na-prd-policy-definitions" {
  source       = "./modules/policy/it-na-prd-policy-definitions"
  mgmt-grp-def = module.it-na-prd.id # location where the policies are stored
}

module "it-na-prd-policy_assignments" {
  # policies being assigned

  source       = "./modules/policy/it-na-prd-policy-assignments"
  mgmt-grp-def = module.it-na-prd.id # location where the policies are stored

  it-na-prd-required-tag_policy_id = module.it-na-prd-policy-definitions.it-na-prd-required-tag_policy_id[0]
  it-na-prd_AZ_ISO_policy_id            = "/providers/Microsoft.Authorization/policySetDefinitions/89c6cddc-1c73-4ac1-b19c-54d1a15a42f2"
  it-na-prd_AZ_NIST_800-53_policy_id    = "/providers/Microsoft.Authorization/policySetDefinitions/cf25b9c1-bd23-4eb6-bd2c-f4f3ac644a5f"
  it-na-prd_AZ_ISO_policy               = "/providers/Microsoft.Authorization/policySetDefinitions/89c6cddc-1c73-4ac1-b19c-54d1a15a42f2"
  it-na-prd_sa_sku_policy_id            = module.it-na-prd-policy-definitions.it-na-prd_sa_sku_policy_id

}

#IT-NA-PLATFORM Policies

module "it-na-platform-policy-definitions" {
  source       = "./modules/policy/it-na-platform-policy-definitions"
  mgmt-grp-def = module.it-na-platform.id # location where the policies are stored
}

module "it-na-platform-policy_assignments" {
  # policies being assigned

  source       = "./modules/policy/it-na-platform-policy-assignments"
  mgmt-grp-def = module.it-na-platform.id # location where the policies are stored

  it-na-platform-AZ_ISO_policy_id       = "/providers/Microsoft.Authorization/policySetDefinitions/89c6cddc-1c73-4ac1-b19c-54d1a15a42f2"
  it-na-platform-AZ_NIST_800-53_policy_id  = "/providers/Microsoft.Authorization/policySetDefinitions/cf25b9c1-bd23-4eb6-bd2c-f4f3ac644a5f"
  it-na-platform-required-tag_policy_id = module.it-na-platform-policy-definitions.it-na-platform-required-tag_policy_id[0]

}

#IT-NA-DEV Policies

module "it-na-dev-policy-definitions" {
  source       = "./modules/policy/it-na-dev-policy-definitions"
  mgmt-grp-def = module.it-na-dev.id # location where the policies are stored
}

module "it-na-dev-policy_assignments" {
  # policies being assigned

  source       = "./modules/policy/it-na-dev-policy-assignments"
  mgmt-grp-def = module.it-na-dev.id # location where the policies are stored

  it-na-dev-required-tag_policy_id = module.it-na-dev-policy-definitions.it-na-dev-required-tag_policy_id[0]

}

#IT-NA-LAB Policies

module "it-na-lab-policy-definitions" {
  source       = "./modules/policy/it-na-lab-policy-definitions"
  mgmt-grp-def = module.it-na-lab.id # location where the policies are stored
}

module "it-na-lab-policy_assignments" {
  # policies being assigned

  source       = "./modules/policy/it-na-lab-policy-assignments"
  mgmt-grp-def = module.it-na-lab.id # location where the policies are stored

  it-na-dev-required-lab_policy_id = module.it-na-lab-policy-definitions.it-na-dev-required-lab_policy_id[0]

}

#IT-NA-PRD-PCI Policies

module "it-na-prd-pci-policy-definitions" {
  source       = "./modules/policy/it-na-prd-pci-policy-definitions"
  mgmt-grp-def = module.it-na-prd-pci.id # location where the policies are stored
}

module "it-na-prd-pci-policy-assignments" {
  # policies being assigned

  source       = "./modules/policy/it-na-prd-pci-policy-assignments"
  mgmt-grp-def = module.it-na-prd-pci.id # location where the policies are stored

  it-na-prd-pci-required-tag_policy_id = module.it-na-prd-pci-policy-definitions.it-na-prd-pci-required-tag_policy_id[0]
  it-na-prd-pci_AZ_PCI_id               = "/providers/Microsoft.Authorization/policySetDefinitions/496eeda9-8f2f-4d5e-8dfd-204f0a92ed41"
}

#IT-NA-STG Policies

module "it-na-stg-policy-definitions" {
  source       = "./modules/policy/it-na-stg-policy-definitions"
  mgmt-grp-def = module.it-na-stg.id # location where the policies are stored
}

module "it-na-stg-policy_assignments" {
  # policies being assigned

  source       = "./modules/policy/it-na-stg-policy-assignments"
  mgmt-grp-def = module.it-na-stg.id # location where the policies are stored

  it-na-stg-required-tag_policy_id = module.it-na-stg-policy-definitions.it-na-stg-required-tag_policy_id[0]

}



#Assign Policy to Subscription
/*
resource "azurerm_subscription_policy_assignment" "sub-policy" {
  name                 = "policy1"
  policy_definition_id = module.policy-definitions.it-na-SA_KeyAccess_id
  subscription_id      = module.sub_deployment.subscription_id
}
*/