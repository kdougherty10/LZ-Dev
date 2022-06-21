#IT Root Policies
module "lz-root-policy-definitions" {
  source       = "./modules/policy/lz-root-policy-definitions"
  mgmt-grp-def = module.lz-root.id # location where the policies are stored
}

module "lz-root-policy_assignments" {
  # policies being assigned

  source       = "./modules/policy/lz-root-policy-assignments"
  mgmt-grp-def = module.lz-root.id # location where the policies are stored

  #policy IDs

  cms-tagging-policy_id	 = module.policyset_definitions.tag_governance_policyset_id
}

module "policyset_definitions" {
  source = "./modules/policy/policyset-definitions"
  mgmt-grp-def = module.lz-root.id # location where the policies are stored
  custom_prefix = "CMS"

 custom_policies_tag_governance = [
   {
      policyID = module.lz-root-policy-definitions.lz-root-required-tag_policy_id[0]
    },
        {
      policyID = module.lz-root-policy-definitions.lz-root-required-tag_policy_id[1]
    },
        {
      policyID = module.lz-root-policy-definitions.lz-root-required-tag_policy_id[2]
    },
        {
      policyID = module.lz-root-policy-definitions.lz-root-required-tag_policy_id[3]
    },
        {
      policyID = module.lz-root-policy-definitions.lz-root-required-tag_policy_id[4]
    },
        {
      policyID = module.lz-root-policy-definitions.lz-root-required-tag_policy_id[5]
    },
        {
      policyID = module.lz-root-policy-definitions.lz-root-required-tag_policy_id[6]
    },
        {
      policyID = module.lz-root-policy-definitions.lz-root-required-tag_policy_id[7]
    },
        {
      policyID = module.lz-root-policy-definitions.lz-root-required-tag_policy_id[8]
    },
        {
      policyID = module.lz-root-policy-definitions.lz-root-required-tag_policy_id[9]
    },
        {
      policyID = module.lz-root-policy-definitions.lz-root-required-tag_policy_id[10]
    },
 ]
}

#lz-NA Policies

module "lz-na-policy-definitions" {
  source       = "./modules/policy/lz-na-policy-definitions"
  mgmt-grp-def = module.lz-na.id # location where the policies are stored
}

module "lz-na-policy_assignments" {
  # policies being assigned

  source       = "./modules/policy/lz-na-policy-assignments"
  mgmt-grp-def = module.lz-na.id # location where the policies are stored

  
  lz-na-SA_KeyNotExpired_id             = module.lz-na-policy-definitions.lz-na-SA_KeyNotExpired_id
  lz-na-SA_MSAccess_id                  = module.lz-na-policy-definitions.lz-na-SA_MSAccess_id
  lz-na-SA_pubAccess_id                 = module.lz-na-policy-definitions.lz-na-SA_pubAccess_id
  lz-na-SA_SecureTransfer_id            = module.lz-na-policy-definitions.lz-na-SA_SecureTransfer_id
  lz-na-SQL_AuditEnabled_id             = module.lz-na-policy-definitions.lz-na-SQL_AuditEnabled_id
  lz-na-SQL_TransparentData_id          = module.lz-na-policy-definitions.lz-na-SQL_TransparentData_id
  lz-na-vm_sku_policy_id                = module.lz-na-policy-definitions.lz-na-vm_sku_policy_id
  lz-na-VMAudit_ManagedDisk_id          = module.lz-na-policy-definitions.lz-na-VMAudit_ManagedDisk_id
  lz-na-required-tag_policy_id	        = module.lz-na-policy-definitions.lz-na-required-tag_policy_id[0]
  lz-na-SA_KeyAccess_id                 = module.lz-na-policy-definitions.lz-na-SA_KeyAccess_id
  lz-na-allowed_location_policy_id      = module.lz-na-policy-definitions.lz-na-allowed_location_policy_id
  lz-na-AZ_SecurityBenchmark_id         = "/providers/Microsoft.Authorization/policySetDefinitions/1f3afdf9-d0c9-4c3d-847f-89da613e70a8"	

}

#lz-APAC Policies

module "lz-apac-policy-definitions" {
  source       = "./modules/policy/lz-apac-policy-definitions"
  mgmt-grp-def = module.lz-apac.id # location where the policies are stored
}

module "lz-apac-policy_assignments" {
  # policies being assigned

  source       = "./modules/policy/lz-apac-policy-assignments"
  mgmt-grp-def = module.lz-apac.id # location where the policies are stored

  lz-apac-required-tag_policy_id = module.lz-apac-policy-definitions.lz-apac-required-tag_policy_id[0]

}

#lz-NA-PRD Policies

module "lz-na-prd-policy-definitions" {
  source       = "./modules/policy/lz-na-prd-policy-definitions"
  mgmt-grp-def = module.lz-na-prd.id # location where the policies are stored
}

module "lz-na-prd-policy_assignments" {
  # policies being assigned

  source       = "./modules/policy/lz-na-prd-policy-assignments"
  mgmt-grp-def = module.lz-na-prd.id # location where the policies are stored

  lz-na-prd-required-tag_policy_id = module.lz-na-prd-policy-definitions.lz-na-prd-required-tag_policy_id[0]
  lz-na-prd_AZ_ISO_policy_id            = "/providers/Microsoft.Authorization/policySetDefinitions/89c6cddc-1c73-4ac1-b19c-54d1a15a42f2"
  lz-na-prd_AZ_NIST_800-53_policy_id    = "/providers/Microsoft.Authorization/policySetDefinitions/cf25b9c1-bd23-4eb6-bd2c-f4f3ac644a5f"
  lz-na-prd_AZ_ISO_policy               = "/providers/Microsoft.Authorization/policySetDefinitions/89c6cddc-1c73-4ac1-b19c-54d1a15a42f2"
  lz-na-prd_sa_sku_policy_id            = module.lz-na-prd-policy-definitions.lz-na-prd_sa_sku_policy_id

}

#lz-NA-PLATFORM Policies

module "lz-na-platform-policy-definitions" {
  source       = "./modules/policy/lz-na-platform-policy-definitions"
  mgmt-grp-def = module.lz-na-platform.id # location where the policies are stored
}

module "lz-na-platform-policy_assignments" {
  # policies being assigned

  source       = "./modules/policy/lz-na-platform-policy-assignments"
  mgmt-grp-def = module.lz-na-platform.id # location where the policies are stored

  lz-na-platform-AZ_ISO_policy_id       = "/providers/Microsoft.Authorization/policySetDefinitions/89c6cddc-1c73-4ac1-b19c-54d1a15a42f2"
  lz-na-platform-AZ_NIST_800-53_policy_id  = "/providers/Microsoft.Authorization/policySetDefinitions/cf25b9c1-bd23-4eb6-bd2c-f4f3ac644a5f"
  lz-na-platform-required-tag_policy_id = module.lz-na-platform-policy-definitions.lz-na-platform-required-tag_policy_id[0]

}

#lz-NA-DEV Policies

module "lz-na-dev-policy-definitions" {
  source       = "./modules/policy/lz-na-dev-policy-definitions"
  mgmt-grp-def = module.lz-na-dev.id # location where the policies are stored
}

module "lz-na-dev-policy_assignments" {
  # policies being assigned

  source       = "./modules/policy/lz-na-dev-policy-assignments"
  mgmt-grp-def = module.lz-na-dev.id # location where the policies are stored

  lz-na-dev-required-tag_policy_id = module.lz-na-dev-policy-definitions.lz-na-dev-required-tag_policy_id[0]

}

#lz-NA-LAB Policies

module "lz-na-lab-policy-definitions" {
  source       = "./modules/policy/lz-na-lab-policy-definitions"
  mgmt-grp-def = module.lz-na-lab.id # location where the policies are stored
}

module "lz-na-lab-policy_assignments" {
  # policies being assigned

  source       = "./modules/policy/lz-na-lab-policy-assignments"
  mgmt-grp-def = module.lz-na-lab.id # location where the policies are stored

  lz-na-dev-required-lab_policy_id = module.lz-na-lab-policy-definitions.lz-na-dev-required-lab_policy_id[0]

}

#lz-NA-PRD-PCI Policies

module "lz-na-prd-pci-policy-definitions" {
  source       = "./modules/policy/lz-na-prd-pci-policy-definitions"
  mgmt-grp-def = module.lz-na-prd-pci.id # location where the policies are stored
}

module "lz-na-prd-pci-policy-assignments" {
  # policies being assigned

  source       = "./modules/policy/lz-na-prd-pci-policy-assignments"
  mgmt-grp-def = module.lz-na-prd-pci.id # location where the policies are stored

  lz-na-prd-pci-required-tag_policy_id = module.lz-na-prd-pci-policy-definitions.lz-na-prd-pci-required-tag_policy_id[0]
  lz-na-prd-pci_AZ_PCI_id               = "/providers/Microsoft.Authorization/policySetDefinitions/496eeda9-8f2f-4d5e-8dfd-204f0a92ed41"
}

#lz-NA-STG Policies

module "lz-na-stg-policy-definitions" {
  source       = "./modules/policy/lz-na-stg-policy-definitions"
  mgmt-grp-def = module.lz-na-stg.id # location where the policies are stored
}

module "lz-na-stg-policy_assignments" {
  # policies being assigned

  source       = "./modules/policy/lz-na-stg-policy-assignments"
  mgmt-grp-def = module.lz-na-stg.id # location where the policies are stored

  lz-na-stg-required-tag_policy_id = module.lz-na-stg-policy-definitions.lz-na-stg-required-tag_policy_id[0]

}



#Assign Policy to Subscription
/*
resource "azurerm_subscription_policy_assignment" "sub-policy" {
  name                 = "policy1"
  policy_definition_id = module.policy-definitions.lz-na-SA_KeyAccess_id
  subscription_id      = module.sub_deployment.subscription_id
}
*/