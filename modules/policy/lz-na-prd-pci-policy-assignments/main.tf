resource "azurerm_management_group_policy_assignment" "lz-na-prd-pci-required-tag" {	
  name = "lz-na-prd-pci-tag"	
  policy_definition_id = var.lz-na-prd-pci-required-tag_policy_id	
  management_group_id = var.mgmt-grp-def
  }


resource "azurerm_management_group_policy_assignment" "lz-na-prd-pci_AZ_PCI" {	
  name = "lz-na-prd-pci_AZ_PCI"	
  policy_definition_id = "/providers/Microsoft.Authorization/policySetDefinitions/496eeda9-8f2f-4d5e-8dfd-204f0a92ed41"	
  management_group_id = var.mgmt-grp-def
    identity {
    type = "SystemAssigned"
  }
   location = "central us"
  }
