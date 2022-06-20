resource "azurerm_management_group_policy_assignment" "it-na-prd-required-tag" {	
  name = "it-na-prd-required-tag"	
  policy_definition_id = var.it-na-prd-required-tag_policy_id	
  management_group_id = var.mgmt-grp-def
  }

resource "azurerm_management_group_policy_assignment" "it-na-prd_AZ_ISO" {	
  name = "it-na-prd_AZ_ISO"	
  policy_definition_id = var.it-na-prd_AZ_ISO_policy_id	
  management_group_id = var.mgmt-grp-def
      identity {
    type = "SystemAssigned"
  }
  location = "central us"
  }

resource "azurerm_management_group_policy_assignment" "it-na-prd_AZ_NIST_800-53" {	
  name = "it-na-prd_AZ_NIST_800-53"	
  policy_definition_id = var.it-na-prd_AZ_NIST_800-53_policy_id	
  management_group_id = var.mgmt-grp-def
      identity {
    type = "SystemAssigned"
  }
   location = "central us"
  }


resource "azurerm_management_group_policy_assignment" "it-na-prd_sa_sku" {	
  name = "it-na-prd_sa_sku"	
  policy_definition_id = var.it-na-prd_sa_sku_policy_id	
  management_group_id = var.mgmt-grp-def
  }
