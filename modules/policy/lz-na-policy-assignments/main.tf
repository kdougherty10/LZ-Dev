  resource "azurerm_management_group_policy_assignment" "lz-na-vm_sku" {	
  name = "lz-na-vm_sku"	
  policy_definition_id = var.lz-na-vm_sku_policy_id	
  management_group_id = var.mgmt-grp-def
  }

resource "azurerm_management_group_policy_assignment" "lz-na-required-tag" {	
  name = "lz-na-required-tag"	
  policy_definition_id = var.lz-na-required-tag_policy_id	
  management_group_id = var.mgmt-grp-def
  }

resource "azurerm_management_group_policy_assignment" "lz-na-allowed_location" {
  name                 = "lz-na-allowed_location"
  policy_definition_id = var.lz-na-allowed_location_policy_id
 management_group_id = var.mgmt-grp-def
}

resource "azurerm_management_group_policy_assignment" "lz-na-SA_KeyAccess" {	
  name = "lz-na-SA_KeyAccess"	
  policy_definition_id = var.lz-na-SA_KeyAccess_id	
  management_group_id = var.mgmt-grp-def
  }

resource "azurerm_management_group_policy_assignment" "lz-na-SA_KeyNotExpired" {	
  name = "lz-na-SA_KeyNotExpired"	
  policy_definition_id = var.lz-na-SA_KeyNotExpired_id	
  management_group_id = var.mgmt-grp-def
  }

resource "azurerm_management_group_policy_assignment" "lz-na-SA_MSAccess" {	
  name = "lz-na-SA_MSAccess"	
  policy_definition_id = var.lz-na-SA_MSAccess_id	
  management_group_id = var.mgmt-grp-def
  }

resource "azurerm_management_group_policy_assignment" "lz-na-SA_pubAccess" {	
  name = "lz-na-SA_pubAccess"	
  policy_definition_id = var.lz-na-SA_pubAccess_id	
  management_group_id = var.mgmt-grp-def
  }

resource "azurerm_management_group_policy_assignment" "lz-na-SA_SecureTransfer" {	
  name = "lz-na-SA_SecureTransfer"	
  policy_definition_id = var.lz-na-SA_SecureTransfer_id	
  management_group_id = var.mgmt-grp-def
  }

resource "azurerm_management_group_policy_assignment" "lz-na-SQL_AuditEnabled" {	
  name = "lz-na-SQL_AuditEnabled"	
  policy_definition_id = var.lz-na-SQL_AuditEnabled_id	
  management_group_id = var.mgmt-grp-def
  }

resource "azurerm_management_group_policy_assignment" "lz-na-SQL_TransparentData" {	
  name = "SQL_TransparentData"	
  policy_definition_id = var.lz-na-SQL_TransparentData_id	
  management_group_id = var.mgmt-grp-def
  }

resource "azurerm_management_group_policy_assignment" "lz-na-VMAudit_ManagedDisk" {	
  name = "lz-na-VMAudit_MDisk"	
  policy_definition_id = var.lz-na-VMAudit_ManagedDisk_id	
  management_group_id = var.mgmt-grp-def
  }


  resource "azurerm_management_group_policy_assignment" "lz-na-AZ_SecurityBenchmark" {	
  name = "AZ_SecurityBenchmark"	
  policy_definition_id = "/providers/Microsoft.Authorization/policySetDefinitions/1f3afdf9-d0c9-4c3d-847f-89da613e70a8"	
  management_group_id = var.mgmt-grp-def
    identity {
    type = "SystemAssigned"
  }
   location = "central us"
  }

