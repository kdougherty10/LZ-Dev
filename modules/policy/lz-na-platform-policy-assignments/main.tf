
resource "azurerm_management_group_policy_assignment" "lz-na-platform-required-tag" {	
  name = "lz-na-platform-tags"	
  policy_definition_id = var.lz-na-platform-required-tag_policy_id	
  management_group_id = var.mgmt-grp-def
  }

resource "azurerm_management_group_policy_assignment" "lz-na-platform-AZ_ISO" {	
  name = "lz-na-platform-AZ_ISO"	
  policy_definition_id = var.lz-na-platform-AZ_ISO_policy_id	
  management_group_id = var.mgmt-grp-def
      identity {
    type = "SystemAssigned"
  }
  location = "central us"
  }

resource "azurerm_management_group_policy_assignment" "lz-na-platform-AZ_NIST_800-53" {	
  name = "AZ_NIST_800-53"	
  policy_definition_id = "/providers/Microsoft.Authorization/policySetDefinitions/cf25b9c1-bd23-4eb6-bd2c-f4f3ac644a5f"
  management_group_id = var.mgmt-grp-def
    identity {
    type = "SystemAssigned"
  }
  location = "central us"
  }

resource "azurerm_management_group_policy_assignment" "lz-na-platform-ISO" {	
  name = "lz-na-platform-ISO"	
  policy_definition_id = "/providers/Microsoft.Authorization/policySetDefinitions/89c6cddc-1c73-4ac1-b19c-54d1a15a42f2"	
  management_group_id = var.mgmt-grp-def
    identity {
    type = "SystemAssigned"
  }
   location = "central us"
  }

  resource "azurerm_management_group_policy_assignment" "lz-na-platform-NIST" {	
  name = "lz-na-platform-NIST"	
  policy_definition_id = "/providers/Microsoft.Authorization/policySetDefinitions/cf25b9c1-bd23-4eb6-bd2c-f4f3ac644a5f"	
  management_group_id = var.mgmt-grp-def
  identity {
    type = "SystemAssigned"
  }
   location = "central us"
  }
