  resource "azurerm_management_group_policy_assignment" "it-na-vm_sku" {	
  name = "it-na-vm_sku"	
  policy_definition_id = var.it-na-vm_sku_policy_id	
  management_group_id = var.mgmt-grp-def
  }

resource "azurerm_management_group_policy_assignment" "it-na-required-tag" {	
  name = "it-na-required-tag"	
  policy_definition_id = var.it-na-required-tag_policy_id	
  management_group_id = var.mgmt-grp-def
  }

resource "azurerm_management_group_policy_assignment" "it-na-allowed_location" {
  name                 = "it-na-allowed_location"
  policy_definition_id = var.it-na-allowed_location_policy_id
 management_group_id = var.mgmt-grp-def
}

resource "azurerm_management_group_policy_assignment" "it-na-SA_KeyAccess" {	
  name = "it-na-SA_KeyAccess"	
  policy_definition_id = var.it-na-SA_KeyAccess_id	
  management_group_id = var.mgmt-grp-def
  }

resource "azurerm_management_group_policy_assignment" "it-na-SA_KeyNotExpired" {	
  name = "it-na-SA_KeyNotExpired"	
  policy_definition_id = var.it-na-SA_KeyNotExpired_id	
  management_group_id = var.mgmt-grp-def
  }

resource "azurerm_management_group_policy_assignment" "it-na-SA_MSAccess" {	
  name = "it-na-SA_MSAccess"	
  policy_definition_id = var.it-na-SA_MSAccess_id	
  management_group_id = var.mgmt-grp-def
  }

resource "azurerm_management_group_policy_assignment" "it-na-SA_pubAccess" {	
  name = "it-na-SA_pubAccess"	
  policy_definition_id = var.it-na-SA_pubAccess_id	
  management_group_id = var.mgmt-grp-def
  }

resource "azurerm_management_group_policy_assignment" "it-na-SA_SecureTransfer" {	
  name = "it-na-SA_SecureTransfer"	
  policy_definition_id = var.it-na-SA_SecureTransfer_id	
  management_group_id = var.mgmt-grp-def
  }

resource "azurerm_management_group_policy_assignment" "it-na-SQL_AuditEnabled" {	
  name = "it-na-SQL_AuditEnabled"	
  policy_definition_id = var.it-na-SQL_AuditEnabled_id	
  management_group_id = var.mgmt-grp-def
  }

resource "azurerm_management_group_policy_assignment" "it-na-SQL_TransparentData" {	
  name = "SQL_TransparentData"	
  policy_definition_id = var.it-na-SQL_TransparentData_id	
  management_group_id = var.mgmt-grp-def
  }

resource "azurerm_management_group_policy_assignment" "it-na-VMAudit_ManagedDisk" {	
  name = "it-na-VMAudit_MDisk"	
  policy_definition_id = var.it-na-VMAudit_ManagedDisk_id	
  management_group_id = var.mgmt-grp-def
  }


  resource "azurerm_management_group_policy_assignment" "it-na-AZ_SecurityBenchmark" {	
  name = "AZ_SecurityBenchmark"	
  policy_definition_id = "/providers/Microsoft.Authorization/policySetDefinitions/1f3afdf9-d0c9-4c3d-847f-89da613e70a8"	
  management_group_id = var.mgmt-grp-def
    identity {
    type = "SystemAssigned"
  }
   location = "central us"
  }

