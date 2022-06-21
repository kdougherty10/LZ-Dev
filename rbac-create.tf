#lz-Root RBAC Roles
module "lz-root-readers" {
    source = "./modules/rbac"
    name = "Az_Reader-${module.lz-root.name}"
    description = "View all resources in the ${module.lz-root.name} management group, but does not allow you to make any changes."
    scope = module.lz-root.id
    actions = ["*/read",]
    not_actions = []
    assignable_scopes = [var.subscription,module.lz-root.id]
    subscription_name = var.subscription_name
}

resource "azurerm_role_assignment" "lz-root-readers" {
    scope = module.lz-root.id
    role_definition_name = module.lz-root-readers.role_id
    principal_id = "4218f776-72f7-4a06-889a-07a65efe1f45"
}

module "lz-root-contributors" {
    source = "./modules/rbac"
    name = "Az_Contributor-${module.lz-root.name}"
    description = "Grants full access to manage all resources in the ${module.lz-root.name} management group, but does not allow you to assign roles in Azure RBAC, manage assignments in Azure Blueprints, or share image galleries."
    scope = module.lz-root.id
    actions = ["*",]
    not_actions = [        
        "Microsoft.Authorization/*/Delete",
        "Microsoft.Authorization/*/Write",
        "Microsoft.Authorization/elevateAccess/Action",
        "Microsoft.Blueprint/blueprintAssignments/write",
        "Microsoft.Blueprint/blueprintAssignments/delete",
        "Microsoft.Compute/galleries/share/action"
        ]
    assignable_scopes = [var.subscription,module.lz-root.id]
    subscription_name = var.subscription_name
}

resource "azurerm_role_assignment" "lz-root-contributors" {
    scope = module.lz-root.id
    role_definition_name = module.lz-root-contributors.role_id
    principal_id = "4218f776-72f7-4a06-889a-07a65efe1f45"
}

module "lz-root-cmcontributor" {
    source = "./modules/rbac"
    name = "Az_CostManagementContributor-${module.lz-root.name}"
    description = "Can view costs and manage cost configuration (e.g. budgets, exports) in ${module.lz-root.name}."
    scope = module.lz-root.id
    actions = [        
        "Microsoft.Consumption/*",
        "Microsoft.CostManagement/*",
        "Microsoft.Billing/billingPeriods/read",
        "Microsoft.Resources/subscriptions/read",
        "Microsoft.Resources/subscriptions/resourceGroups/read",
        "Microsoft.Support/*",
        "Microsoft.Advisor/configurations/read",
        "Microsoft.Advisor/recommendations/read",
        "Microsoft.Management/managementGroups/read",
        "Microsoft.Billing/billingProperty/read"
        ]
    not_actions = []
    assignable_scopes = [var.subscription,module.lz-root.id]
    subscription_name = var.subscription_name
}

resource "azurerm_role_assignment" "lz-root-cmcontributor" {
    scope = module.lz-root.id
    role_definition_name = module.lz-root-cmcontributor.role_id
    principal_id = "4218f776-72f7-4a06-889a-07a65efe1f45"
}

module "lz-root-lacontributor" {
    source = "./modules/rbac"
    name = "Az_LogAnalyticsContributor-${module.lz-root.name}"
    description = "Log Analytics Contributor can read all monitoring data and edit monitoring settings. Editing monitoring settings includes adding the VM extension to VMs; reading storage account keys to be able to configure collection of logs from Azure Storage; adding solutions; and configuring Azure diagnostics on all Azure resources in the ${module.lz-root.name} management group."
    scope = module.lz-root.id
    actions = [
        "*/read",
        "Microsoft.ClassicCompute/virtualMachines/extensions/*",
        "Microsoft.ClassicStorage/storageAccounts/listKeys/action",
        "Microsoft.Compute/virtualMachines/extensions/*",
        "Microsoft.HybridCompute/machines/extensions/write",
        "Microsoft.Insights/alertRules/*",
        "Microsoft.Insights/diagnosticSettings/*",
        "Microsoft.OperationalInsights/*",
        "Microsoft.OperationsManagement/*",
        "Microsoft.Resources/deployments/*",
        "Microsoft.Resources/subscriptions/resourcegroups/deployments/*",
        "Microsoft.Storage/storageAccounts/listKeys/action",
        "Microsoft.Support/*"
    ]
    not_actions = []
    assignable_scopes = [var.subscription,module.lz-root.id]
    subscription_name = var.subscription_name
}

resource "azurerm_role_assignment" "lz-root-lacontributor" {
    scope = module.lz-root.id
    role_definition_name = module.lz-root-lacontributor.role_id
    principal_id = "4218f776-72f7-4a06-889a-07a65efe1f45"
}

module "lz-root-owner" {
    source = "./modules/rbac"
    name = "Az_Owner-${module.lz-root.name}"
    description = "Grants full access to manage all ${module.lz-root.name} resources, including the ability to assign roles in Azure RBAC."
    scope = module.lz-root.id
    actions = ["*",]
    not_actions = []
    assignable_scopes = [var.subscription,module.lz-root.id]
    subscription_name = var.subscription_name
}

resource "azurerm_role_assignment" "lz-root-owner" {
    scope = module.lz-root.id
    role_definition_name = module.lz-root-owner.role_id
    principal_id = "4218f776-72f7-4a06-889a-07a65efe1f45"
}

module "lz-root-sqldb-contributor" {
    source = "./modules/rbac"
    name = "Az_SQLDatabaseContributor-${module.lz-root.name}"
    description = "Lets you manage ${module.lz-root.name} management group SQL databases, but not access to them. Also, you can't manage their security-related policies or their parent SQL servers."
    scope = module.lz-root.id
    actions = [
        "Microsoft.Authorization/*/read",
        "Microsoft.Insights/alertRules/*",
        "Microsoft.ResourceHealth/availabilityStatuses/read",
        "Microsoft.Resources/deployments/*",
        "Microsoft.Resources/subscriptions/resourceGroups/read",
        "Microsoft.Sql/locations/*/read",
        "Microsoft.Sql/servers/databases/*",
        "Microsoft.Sql/servers/read",
        "Microsoft.Support/*",
        "Microsoft.Insights/metrics/read",
        "Microsoft.Insights/metricDefinitions/read"
    ]
    not_actions = [
        "Microsoft.Sql/servers/databases/ledgerDigestUploads/write",
        "Microsoft.Sql/servers/databases/ledgerDigestUploads/disable/action",
        "Microsoft.Sql/managedInstances/databases/currentSensitivityLabels/*",
        "Microsoft.Sql/managedInstances/databases/recommendedSensitivityLabels/*",
        "Microsoft.Sql/managedInstances/databases/schemas/tables/columns/sensitivityLabels/*",
        "Microsoft.Sql/managedInstances/databases/securityAlertPolicies/*",
        "Microsoft.Sql/managedInstances/databases/sensitivityLabels/*",
        "Microsoft.Sql/managedInstances/databases/vulnerabilityAssessments/*",
        "Microsoft.Sql/managedInstances/securityAlertPolicies/*",
        "Microsoft.Sql/managedInstances/vulnerabilityAssessments/*",
        "Microsoft.Sql/servers/databases/auditingSettings/*",
        "Microsoft.Sql/servers/databases/auditRecords/read",
        "Microsoft.Sql/servers/databases/currentSensitivityLabels/*",
        "Microsoft.Sql/servers/databases/dataMaskingPolicies/*",
        "Microsoft.Sql/servers/databases/extendedAuditingSettings/*",
        "Microsoft.Sql/servers/databases/recommendedSensitivityLabels/*",
        "Microsoft.Sql/servers/databases/schemas/tables/columns/sensitivityLabels/*",
        "Microsoft.Sql/servers/databases/securityAlertPolicies/*",
        "Microsoft.Sql/servers/databases/securityMetrics/*",
        "Microsoft.Sql/servers/databases/sensitivityLabels/*",
        "Microsoft.Sql/servers/databases/vulnerabilityAssessments/*",
        "Microsoft.Sql/servers/databases/vulnerabilityAssessmentScans/*",
        "Microsoft.Sql/servers/databases/vulnerabilityAssessmentSettings/*",
        "Microsoft.Sql/servers/vulnerabilityAssessments/*"
    ]
    assignable_scopes = [var.subscription,module.lz-root.id]
    subscription_name = var.subscription_name
}

resource "azurerm_role_assignment" "lz-root-sqldb-contributor" {
    scope = module.lz-root.id
    role_definition_name = module.lz-root-sqldb-contributor.role_id
    principal_id = "4218f776-72f7-4a06-889a-07a65efe1f45"
}

module "lz-root-srcontributors" {
    source = "./modules/rbac"
    name = "Az_SupportRequestContributor-${module.lz-root.name}"
    description = "Lets you create and manage Support requests in the ${module.lz-root.name} management group."
    scope = module.lz-root.id
    actions = [
        "Microsoft.Authorization/*/read",
        "Microsoft.Resources/subscriptions/resourceGroups/read",
        "Microsoft.Support/*"
    ]
    not_actions = []
    assignable_scopes = [var.subscription,module.lz-root.id]
    subscription_name = var.subscription_name
}

resource "azurerm_role_assignment" "lz-root-srcontributors" {
    scope = module.lz-root.id
    role_definition_name = module.lz-root-srcontributors.role_id
    principal_id = "4218f776-72f7-4a06-889a-07a65efe1f45"
}

module "lz-root-access-admins" {
    source = "./modules/rbac"
    name = "Az_AccessAdmins-${module.lz-root.name}"
    description = "Lets you manage user access to Azure resources in the ${module.lz-root.name} management group."
    scope = module.lz-root.id
    actions = [
        "*/read",
        "Microsoft.Authorization/*",
        "Microsoft.Support/*"
    ]
    not_actions = []
    assignable_scopes = [var.subscription,module.lz-root.id]
    subscription_name = var.subscription_name
}

resource "azurerm_role_assignment" "lz-root-access-admins" {
    scope = module.lz-root.id
    role_definition_name = module.lz-root-access-admins.role_id
    principal_id = "4218f776-72f7-4a06-889a-07a65efe1f45"
}

module "lz-root-unix-operators" {
    source = "./modules/rbac"
    name = "Az_UnixVMOperator-${module.lz-root.name}"
    description = "Custom rule to operate VMs in the ${module.lz-root.name} management group."
    scope = module.lz-root.id
    actions = [
        "Microsoft.Compute/*/read",
        "Microsoft.Network/*/read",
        "Microsoft.Storage/*/read",
        "Microsoft.Compute/virtualMachines/read",
        "Microsoft.Compute/virtualMachines/powerOff/action",
        "Microsoft.Compute/virtualMachines/start/action",
        "Microsoft.Compute/virtualMachines/restart/action",
        "Microsoft.Compute/virtualMachines/vmSizes/read",
        "Microsoft.Authorization/*/read",
        "Microsoft.Insights/alertRules/*",
        "Microsoft.Resources/subscriptions/resourceGroups/read",
        "Microsoft.Support/*",
        "Microsoft.Compute/virtualMachines/deallocate/action",
        "Microsoft.Storage/storageaccounts/services/diagnosticSettings/write",
        "Microsoft.Storage/storageaccounts/listaccountSas/action",
        "Microsoft.Storage/storageaccounts/listServiceSas/action",
        "Microsoft.Storage/storageaccounts/listkeys/action",
        "Microsoft.Storage/storageaccounts/regeneratekey/action",
        # "Microsoft.Diagnostics/solutions/Action",
        # "Microsoft.Diagnostics/AzureKB/Invoke/Action",
        # "Microsoft.Diagnostics/InsightDiagnostics/Invoke/Action"
    ]
    not_actions = []
    assignable_scopes = [var.subscription,module.lz-root.id]
    subscription_name = var.subscription_name
}

resource "azurerm_role_assignment" "lz-root-unix-operators" {
    scope = module.lz-root.id
    role_definition_name = module.lz-root-unix-operators.role_id
    principal_id = "4218f776-72f7-4a06-889a-07a65efe1f45"
}

module "lz-root-windows-operators" {
    source = "./modules/rbac"
    name = "Az_WindowsVMOperator-${module.lz-root.name}"
    description = "Custom rule to operate VMs in the ${module.lz-root.name} management group."
    scope = module.lz-root.id
    actions = [
"Microsoft.Compute/*/read",
        "Microsoft.Network/*/read",
        "Microsoft.Storage/*/read",
        "Microsoft.Compute/virtualMachines/read",
        "Microsoft.Compute/virtualMachines/powerOff/action",
        "Microsoft.Compute/virtualMachines/start/action",
        "Microsoft.Compute/virtualMachines/restart/action",
        "Microsoft.Compute/virtualMachines/vmSizes/read",
        "Microsoft.Authorization/*/read",
        "Microsoft.Insights/alertRules/*",
        "Microsoft.Resources/subscriptions/resourceGroups/read",
        "Microsoft.Support/*",
        "Microsoft.Compute/virtualMachines/deallocate/action",
        "Microsoft.Storage/storageaccounts/services/diagnosticSettings/write",
        "*/read",
        "Microsoft.Storage/storageaccounts/listaccountSas/action",
        "Microsoft.Storage/storageaccounts/listServiceSas/action",
        "Microsoft.Storage/storageaccounts/listkeys/action",
        "Microsoft.Storage/storageaccounts/regeneratekey/action"
    ]
    not_actions = []
    assignable_scopes = [var.subscription,module.lz-root.id]
    subscription_name = var.subscription_name
}

resource "azurerm_role_assignment" "lz-root-windows-operators" {
    scope = module.lz-root.id
    role_definition_name = module.lz-root-windows-operators.role_id
    principal_id = "4218f776-72f7-4a06-889a-07a65efe1f45"
}

module "lz-root-prismacloudfunction" {
    source = "./modules/rbac"
    name = "Az_PrismaCloudFunctionReadOnly-${module.lz-root.name}"
    description = "Az_Prisma-Cloud-Function-Read-Only ${module.lz-root.name} management group."
    scope = module.lz-root.id
    actions = [
        "Microsoft.Network/virtualNetworkGateways/read",
        "Microsoft.Web/sites/Read",
        "Microsoft.web/sites/functions/action",
        "Microsoft.web/sites/functions/read",
        "Microsoft.Web/sites/publishxml/Action",
        "Microsoft.Web/sites/config/list/Action"
    ]
    not_actions = []
    assignable_scopes = [var.subscription,module.lz-root.id]
    subscription_name = var.subscription_name
}

resource "azurerm_role_assignment" "lz-root-prismacloudfunction" {
    scope = module.lz-root.id
    role_definition_name = module.lz-root-prismacloudfunction.role_id
    principal_id = "4218f776-72f7-4a06-889a-07a65efe1f45"
}

module "lz-root-prismacloudreadonly" {
    source = "./modules/rbac"
    name = "Az_PrismaCloudReadonly-${module.lz-root.name}"
    description = "Az_Prisma-Cloud-Read-Only ${module.lz-root.name} management group."
    scope = module.lz-root.id
    actions = [
        "Microsoft.Network/virtualNetworkGateways/read",
        "Microsoft.Web/sites/Read",
        "Microsoft.web/sites/functions/action",
        "Microsoft.web/sites/functions/read",
        "Microsoft.Web/sites/publishxml/Action",
        "Microsoft.Web/sites/config/list/Action"
    ]
    not_actions = []
    assignable_scopes = [var.subscription,module.lz-root.id]
    subscription_name = var.subscription_name
}

resource "azurerm_role_assignment" "lz-root-prismacloudreadonly" {
    scope = module.lz-root.id
    role_definition_name = module.lz-root-prismacloudreadonly.role_id
    principal_id = "4218f776-72f7-4a06-889a-07a65efe1f45"
}

#lz-NA-PRD RBAC Roles

module "lz-na-prd-readers" {
    source = "./modules/rbac"
    name = "Az_Reader-${module.lz-na-prd.name}"
    description = "View all resources in the ${module.lz-na-prd.name} management group, but does not allow you to make any changes."
    scope = module.lz-na-prd.id
    actions = ["*/read",]
    not_actions = []
    assignable_scopes = [var.subscription,module.lz-na-prd.id]
    subscription_name = var.subscription_name
}

resource "azurerm_role_assignment" "lz-na-prd-readers" {
    scope = module.lz-na-prd.id
    role_definition_name = module.lz-na-prd-readers.role_id
    principal_id = "4218f776-72f7-4a06-889a-07a65efe1f45"
}

module "lz-na-prd-contributors" {
    source = "./modules/rbac"
    name = "Az_Contributor-${module.lz-na-prd.name}"
    description = "Grants full access to manage all resources in the ${module.lz-na-prd.name} management group, but does not allow you to assign roles in Azure RBAC, manage assignments in Azure Blueprints, or share image galleries."
    scope = module.lz-na-prd.id
    actions = ["*",]
    not_actions = [        
        "Microsoft.Authorization/*/Delete",
        "Microsoft.Authorization/*/Write",
        "Microsoft.Authorization/elevateAccess/Action",
        "Microsoft.Blueprint/blueprintAssignments/write",
        "Microsoft.Blueprint/blueprintAssignments/delete",
        "Microsoft.Compute/galleries/share/action"
        ]
    assignable_scopes = [var.subscription,module.lz-na-prd.id]
    subscription_name = var.subscription_name
}

resource "azurerm_role_assignment" "lz-na-prd-contributors" {
    scope = module.lz-na-prd.id
    role_definition_name = module.lz-na-prd-contributors.role_id
    principal_id = "4218f776-72f7-4a06-889a-07a65efe1f45"
}

module "lz-na-prd-owner" {
    source = "./modules/rbac"
    name = "Az_Owner-${module.lz-na-prd.name}"
    description = "Grants full access to manage all ${module.lz-na-prd.name} resources, including the ability to assign roles in Azure RBAC."
    scope = module.lz-na-prd.id
    actions = ["*",]
    not_actions = []
    assignable_scopes = [var.subscription,module.lz-na-prd.id]
    subscription_name = var.subscription_name
}

resource "azurerm_role_assignment" "lz-na-prd-owner" {
    scope = module.lz-na-prd.id
    role_definition_name = module.lz-na-prd-owner.role_id
    principal_id = "4218f776-72f7-4a06-889a-07a65efe1f45"
}

module "lz-na-prd-access-admins" {
    source = "./modules/rbac"
    name = "Az_AccessAdmin-${module.lz-na-prd.name}"
    description = "Lets you manage user access to Azure resources in the ${module.lz-na-prd.name} management group."
    scope = module.lz-na-prd.id
    actions = [
        "*/read",
        "Microsoft.Authorization/*",
        "Microsoft.Support/*"
    ]
    not_actions = []
    assignable_scopes = [var.subscription,module.lz-na-prd.id]
    subscription_name = var.subscription_name
}

resource "azurerm_role_assignment" "lz-na-prd-access-admins" {
    scope = module.lz-na-prd.id
    role_definition_name = module.lz-na-prd-access-admins.role_id
    principal_id = "4218f776-72f7-4a06-889a-07a65efe1f45"
}

module "lz-na-prd-backup-operator" {
    source = "./modules/rbac"
    name = "Az_BackupOperator-${module.lz-na-prd.name}"
    description = "Lets you manage backup services, except removal of backup, vault creation and giving access to others in the ${module.lz-na-prd.name} management group."
    scope = module.lz-na-prd.id
    actions = [
        "Microsoft.Authorization/*/read",
        "Microsoft.Network/virtualNetworks/read",
        "Microsoft.RecoveryServices/Vaults/backupFabrics/operationResults/read",
        "Microsoft.RecoveryServices/Vaults/backupFabrics/protectionContainers/operationResults/read",
        "Microsoft.RecoveryServices/Vaults/backupFabrics/protectionContainers/protectedItems/backup/action",
        "Microsoft.RecoveryServices/Vaults/backupFabrics/protectionContainers/protectedItems/operationResults/read",
        "Microsoft.RecoveryServices/Vaults/backupFabrics/protectionContainers/protectedItems/operationsStatus/read",
        "Microsoft.RecoveryServices/Vaults/backupFabrics/protectionContainers/protectedItems/read",
        "Microsoft.RecoveryServices/Vaults/backupFabrics/protectionContainers/protectedItems/recoveryPoints/provisionInstantItemRecovery/action",
        "Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems/recoveryPoints/accessToken/action",
        "Microsoft.RecoveryServices/Vaults/backupFabrics/protectionContainers/protectedItems/recoveryPoints/read",
        "Microsoft.RecoveryServices/Vaults/backupFabrics/protectionContainers/protectedItems/recoveryPoints/restore/action",
        "Microsoft.RecoveryServices/Vaults/backupFabrics/protectionContainers/protectedItems/recoveryPoints/revokeInstantItemRecovery/action",
        "Microsoft.RecoveryServices/Vaults/backupFabrics/protectionContainers/protectedItems/write",
        "Microsoft.RecoveryServices/Vaults/backupFabrics/protectionContainers/read",
        "Microsoft.RecoveryServices/Vaults/backupFabrics/refreshContainers/action",
        "Microsoft.RecoveryServices/Vaults/backupJobs/*",
        "Microsoft.RecoveryServices/Vaults/backupJobsExport/action",
        "Microsoft.RecoveryServices/Vaults/backupOperationResults/*",
        "Microsoft.RecoveryServices/Vaults/backupPolicies/operationResults/read",
        "Microsoft.RecoveryServices/Vaults/backupPolicies/read",
        "Microsoft.RecoveryServices/Vaults/backupProtectableItems/*",
        "Microsoft.RecoveryServices/Vaults/backupProtectedItems/read",
        "Microsoft.RecoveryServices/Vaults/backupProtectionContainers/read",
        "Microsoft.RecoveryServices/Vaults/backupUsageSummaries/read",
        "Microsoft.RecoveryServices/Vaults/certificates/write",
        "Microsoft.RecoveryServices/Vaults/extendedInformation/read",
        "Microsoft.RecoveryServices/Vaults/extendedInformation/write",
        "Microsoft.RecoveryServices/Vaults/monitoringAlerts/read",
        "Microsoft.RecoveryServices/Vaults/monitoringConfigurations/*",
        "Microsoft.RecoveryServices/Vaults/read",
        "Microsoft.RecoveryServices/Vaults/registeredIdentities/operationResults/read",
        "Microsoft.RecoveryServices/Vaults/registeredIdentities/read",
        "Microsoft.RecoveryServices/Vaults/registeredIdentities/write",
        "Microsoft.RecoveryServices/Vaults/usages/read",
        "Microsoft.Resources/deployments/*",
        "Microsoft.Resources/subscriptions/resourceGroups/read",
        "Microsoft.Storage/storageAccounts/read",
        "Microsoft.RecoveryServices/Vaults/backupstorageconfig/*",
        "Microsoft.RecoveryServices/Vaults/backupValidateOperation/action",
        "Microsoft.RecoveryServices/Vaults/backupTriggerValidateOperation/action",
        "Microsoft.RecoveryServices/Vaults/backupValidateOperationResults/read",
        "Microsoft.RecoveryServices/Vaults/backupValidateOperationsStatuses/read",
        "Microsoft.RecoveryServices/Vaults/backupOperations/read",
        "Microsoft.RecoveryServices/Vaults/backupPolicies/operations/read",
        "Microsoft.RecoveryServices/Vaults/backupFabrics/protectionContainers/write",
        "Microsoft.RecoveryServices/Vaults/backupFabrics/protectionContainers/inquire/action",
        "Microsoft.RecoveryServices/Vaults/backupEngines/read",
        "Microsoft.RecoveryServices/Vaults/backupFabrics/backupProtectionIntent/write",
        "Microsoft.RecoveryServices/Vaults/backupFabrics/backupProtectionIntent/read",
        "Microsoft.RecoveryServices/Vaults/backupFabrics/protectableContainers/read",
        "Microsoft.RecoveryServices/Vaults/backupFabrics/protectionContainers/items/read",
        "Microsoft.RecoveryServices/locations/backupStatus/action",
        "Microsoft.RecoveryServices/locations/backupPreValidateProtection/action",
        "Microsoft.RecoveryServices/locations/backupValidateFeatures/action",
        "Microsoft.RecoveryServices/locations/backupAadProperties/read",
        "Microsoft.RecoveryServices/locations/backupCrrJobs/action",
        "Microsoft.RecoveryServices/locations/backupCrrJob/action",
        "Microsoft.RecoveryServices/locations/backupCrossRegionRestore/action",
        "Microsoft.RecoveryServices/locations/backupCrrOperationResults/read",
        "Microsoft.RecoveryServices/locations/backupCrrOperationsStatus/read",
        "Microsoft.RecoveryServices/Vaults/monitoringAlerts/write",
        "Microsoft.RecoveryServices/operations/read",
        "Microsoft.RecoveryServices/locations/operationStatus/read",
        "Microsoft.RecoveryServices/Vaults/backupProtectionIntents/read",
        "Microsoft.Support/*",
        "Microsoft.DataProtection/backupVaults/backupInstances/read",
        "Microsoft.DataProtection/backupVaults/backupInstances/read",
        "Microsoft.DataProtection/backupVaults/backupPolicies/read",
        "Microsoft.DataProtection/backupVaults/backupPolicies/read",
        "Microsoft.DataProtection/backupVaults/backupInstances/recoveryPoints/read",
        "Microsoft.DataProtection/backupVaults/backupInstances/recoveryPoints/read",
        "Microsoft.DataProtection/backupVaults/backupInstances/findRestorableTimeRanges/action",
        "Microsoft.DataProtection/backupVaults/read",
        "Microsoft.DataProtection/backupVaults/operationResults/read",
        "Microsoft.DataProtection/backupVaults/read",
        "Microsoft.DataProtection/backupVaults/read",
        "Microsoft.DataProtection/locations/operationStatus/read",
        "Microsoft.DataProtection/locations/operationResults/read",
        # "Microsoft.DataProtection/providers/operations/read"
    ]
    not_actions = []
    assignable_scopes = [var.subscription,module.lz-na-prd.id]
    subscription_name = var.subscription_name
}

resource "azurerm_role_assignment" "lz-na-prd-backup-operator" {
    scope = module.lz-na-prd.id
    role_definition_name = module.lz-na-prd-backup-operator.role_id
    principal_id = "4218f776-72f7-4a06-889a-07a65efe1f45"
}

module "lz-na-prd-billing-reader" {
    source = "./modules/rbac"
    name = "Az_BillingReader-${module.lz-na-prd.name}"
    description = "Allows read access to billing data in the ${module.lz-na-prd.name} management group."
    scope = module.lz-na-prd.id
    actions = [
        "Microsoft.Authorization/*/read",
        "Microsoft.Billing/*/read",
        "Microsoft.Commerce/*/read",
        "Microsoft.Consumption/*/read",
        "Microsoft.Management/managementGroups/read",
        "Microsoft.CostManagement/*/read",
        "Microsoft.Support/*"
    ]
    not_actions = []
    assignable_scopes = [var.subscription,module.lz-na-prd.id]
    subscription_name = var.subscription_name
}

resource "azurerm_role_assignment" "lz-na-prd-billing-reader" {
    scope = module.lz-na-prd.id
    role_definition_name = module.lz-na-prd-billing-reader.role_id
    principal_id = "4218f776-72f7-4a06-889a-07a65efe1f45"
}

module "lz-na-prd-ops-sql-contributor" {
    source = "./modules/rbac"
    name = "Az_OpsSQLContributor-${module.lz-na-prd.name}"
    description = "Customized to allow SQL agent Push and SQL restore to VM which requires write to compute.virtualmachines.  Lets you manage SQL servers and databases, but not access to them, and not their security -related policies in the ${module.lz-na-prd.name} management group."
    scope = module.lz-na-prd.id
    actions = [
        "Microsoft.Authorization/*/read",
        "Microsoft.Insights/alertRules/*",
        "Microsoft.ResourceHealth/availabilityStatuses/read",
        "Microsoft.Resources/deployments/*",
        "Microsoft.Resources/subscriptions/resourceGroups/read",
        "Microsoft.Sql/locations/*/read",
        "Microsoft.Sql/servers/*",
        "Microsoft.Support/*",
        "Microsoft.Insights/metrics/read",
        "Microsoft.Insights/metricDefinitions/read",
        "Microsoft.Compute/virtualMachines/read",
        "Microsoft.Compute/virtualMachines/write"
    ]
    not_actions = [
        "Microsoft.Sql/managedInstances/databases/currentSensitivityLabels/*",
        "Microsoft.Sql/managedInstances/databases/recommendedSensitivityLabels/*",
        "Microsoft.Sql/managedInstances/databases/schemas/tables/columns/sensitivityLabels/*",
        "Microsoft.Sql/managedInstances/databases/securityAlertPolicies/*",
        "Microsoft.Sql/managedInstances/databases/sensitivityLabels/*",
        "Microsoft.Sql/managedInstances/databases/vulnerabilityAssessments/*",
        "Microsoft.Sql/managedInstances/securityAlertPolicies/*",
        "Microsoft.Sql/managedInstances/vulnerabilityAssessments/*",
        # "Microsoft.Sql/servers/auditingPolicies/*",
        "Microsoft.Sql/servers/auditingSettings/*",
        # "Microsoft.Sql/servers/databases/auditingPolicies/*",
        "Microsoft.Sql/servers/databases/auditingSettings/*",
        "Microsoft.Sql/servers/databases/auditRecords/read",
        # "Microsoft.Sql/servers/databases/connectionPolicies/*",
        "Microsoft.Sql/servers/databases/currentSensitivityLabels/*",
        "Microsoft.Sql/servers/databases/dataMaskingPolicies/*",
        "Microsoft.Sql/servers/databases/extendedAuditingSettings/*",
        "Microsoft.Sql/servers/databases/recommendedSensitivityLabels/*",
        "Microsoft.Sql/servers/databases/schemas/tables/columns/sensitivityLabels/*",
        "Microsoft.Sql/servers/databases/securityAlertPolicies/*",
        "Microsoft.Sql/servers/databases/securityMetrics/*",
        "Microsoft.Sql/servers/databases/sensitivityLabels/*",
        "Microsoft.Sql/servers/databases/vulnerabilityAssessments/*",
        "Microsoft.Sql/servers/databases/vulnerabilityAssessmentScans/*",
        "Microsoft.Sql/servers/databases/vulnerabilityAssessmentSettings/*",
        "Microsoft.Sql/servers/extendedAuditingSettings/*",
        "Microsoft.Sql/servers/securityAlertPolicies/*",
        "Microsoft.Sql/servers/vulnerabilityAssessments/*"
    ]
    assignable_scopes = [var.subscription,module.lz-na-prd.id]
    subscription_name = var.subscription_name
}

resource "azurerm_role_assignment" "lz-na-prd-ops-sql-contributor" {
    scope = module.lz-na-prd.id
    role_definition_name = module.lz-na-prd-ops-sql-contributor.role_id
    principal_id = "4218f776-72f7-4a06-889a-07a65efe1f45"
}


module "lz-na-prd-VM-Admin" {
    source = "./modules/rbac"
    name = "Az_VMAdmin-${module.lz-na-prd.name}"
    description = "Lets you admin virtual machines, with storage account in the ${module.lz-na-prd.name} management group."
    scope = module.lz-na-prd.id
    actions = [
        "Microsoft.Authorization/*/read",
        "Microsoft.Compute/availabilitySets/*",
        "Microsoft.Compute/locations/*",
        "Microsoft.Compute/virtualMachines/*",
        "Microsoft.Compute/virtualMachineScaleSets/*",
        "Microsoft.DevTestLab/schedules/*",
        "Microsoft.Insights/alertRules/*",
        "Microsoft.Network/applicationGateways/backendAddressPools/join/action",
        "Microsoft.Network/loadBalancers/backendAddressPools/join/action",
        "Microsoft.Network/loadBalancers/inboundNatPools/join/action",
        "Microsoft.Network/loadBalancers/inboundNatRules/join/action",
        "Microsoft.Network/loadBalancers/read",
        "Microsoft.Network/locations/*",
        "Microsoft.Network/networkInterfaces/*",
        "Microsoft.Network/networkSecurityGroups/join/action",
        "Microsoft.Network/networkSecurityGroups/read",
        "Microsoft.Network/publicIPAddresses/join/action",
        "Microsoft.Network/publicIPAddresses/read",
        "Microsoft.Network/virtualNetworks/read",
        "Microsoft.Network/virtualNetworks/subnets/join/action",
        "Microsoft.RecoveryServices/locations/*",
        "Microsoft.RecoveryServices/Vaults/backupFabrics/protectionContainers/protectedItems/*/read",
        "Microsoft.RecoveryServices/Vaults/backupFabrics/protectionContainers/protectedItems/read",
        "Microsoft.RecoveryServices/Vaults/backupFabrics/protectionContainers/protectedItems/write",
        "Microsoft.RecoveryServices/Vaults/backupPolicies/read",
        "Microsoft.RecoveryServices/Vaults/backupPolicies/write",
        "Microsoft.RecoveryServices/Vaults/read",
        "Microsoft.RecoveryServices/Vaults/usages/read",
        "Microsoft.RecoveryServices/Vaults/write",
        "Microsoft.ResourceHealth/availabilityStatuses/read",
        "Microsoft.Resources/deployments/*",
        "Microsoft.Resources/subscriptions/resourceGroups/read",
        "Microsoft.Storage/storageAccounts/listAccountSas/action",
        "Microsoft.Storage/storageAccounts/listkeys/action",
        "Microsoft.Storage/storageAccounts/listServiceSas/action",
        "Microsoft.Storage/storageAccounts/read",
        "Microsoft.Storage/storageAccounts/regeneratekey/action",
        "Microsoft.Storage/storageAccounts/services/diagnosticSettings/write",
        "Microsoft.Storage/storageAccounts/write",
        "Microsoft.Support/*",
        "Microsoft.Compute/disks/*",
        "Microsoft.Network/virtualNetworks/write",
        "Microsoft.Network/publicIpAddresses/write",
        "Microsoft.Network/networkSecurityGroups/write",
        "Microsoft.Insights/AlertRules/Read",
        "Microsoft.Insights/LogProfiles/Read",
        "Microsoft.Insights/eventtypes/values/Read",
        "Microsoft.Insights/LogDefinitions/Read",
        "Microsoft.Insights/ExtendedDiagnosticSettings/Read",
        "Microsoft.Insights/eventtypes/digestevents/Read",
        "*/read"
    ]
    not_actions = []
    assignable_scopes = [var.subscription,module.lz-na-prd.id]
    subscription_name = var.subscription_name
}

resource "azurerm_role_assignment" "lz-na-prd-VM-Admin" {
    scope = module.lz-na-prd.id
    role_definition_name = module.lz-na-prd-VM-Admin.role_id
    principal_id = "4218f776-72f7-4a06-889a-07a65efe1f45"
}

module "lz-na-prd-VM-Operator" {
    source = "./modules/rbac"
    name = "Az_VMOperator-${module.lz-na-prd.name}"
    description = "Custom Role to operate VMs in the ${module.lz-na-prd.name} management group."
    scope = module.lz-na-prd.id
    actions = [
        "Microsoft.Compute/*/read",
        "Microsoft.Network/*/read",
        "Microsoft.Storage/*/read",
        "Microsoft.Compute/virtualMachines/read",
        "Microsoft.Compute/virtualMachines/powerOff/action",
        "Microsoft.Compute/virtualMachines/start/action",
        "Microsoft.Compute/virtualMachines/restart/action",
        "Microsoft.Compute/virtualMachines/vmSizes/read",
        "Microsoft.Authorization/*/read",
        "Microsoft.Insights/alertRules/*",
        "Microsoft.Resources/subscriptions/resourceGroups/read",
        "Microsoft.Support/*",
        "Microsoft.Compute/virtualMachines/deallocate/action",
        "Microsoft.Storage/storageaccounts/services/diagnosticSettings/write",
        "*/read",
        "Microsoft.Storage/storageaccounts/listaccountSas/action",
        "Microsoft.Storage/storageaccounts/listServiceSas/action",
        "Microsoft.Storage/storageaccounts/listkeys/action",
        "Microsoft.Storage/storageaccounts/regeneratekey/action"
    ]
    not_actions = []
    assignable_scopes = [var.subscription,module.lz-na-prd.id]
    subscription_name = var.subscription_name
}

resource "azurerm_role_assignment" "lz-na-prd-VM-Operator" {
    scope = module.lz-na-prd.id
    role_definition_name = module.lz-na-prd-VM-Operator.role_id
    principal_id = "4218f776-72f7-4a06-889a-07a65efe1f45"
}

#Production-Subscription RBAC Roles

module "Prod-readers" {
    source = "./modules/rbac"
    name = "Az_Reader"
    description = "View all resources in the production subscription, but does not allow you to make any changes."
    scope = module.lz-na-prd.id #this will need to be replaced with the Cummins Prod subscription information
    actions = ["*/read",]
    not_actions = []
    assignable_scopes = [var.subscription,module.lz-na-prd.id]
    subscription_name = var.subscription_name
}

resource "azurerm_role_assignment" "Prod-readers" {
    scope = module.lz-na-prd.id #this will need to be replaced with the Cummins Prod subscription information
    role_definition_name = module.Prod-readers.role_id
    principal_id = "4218f776-72f7-4a06-889a-07a65efe1f45"
}

module "Prod-contributors" {
    source = "./modules/rbac"
    name = "Az_Contributor"
    description = "Grants full access to manage all resources in the production subscription, but does not allow you to assign roles in Azure RBAC, manage assignments in Azure Blueprints, or share image galleries."
    scope = module.lz-na-prd.id #this will need to be replaced with the Cummins Prod subscription information
    actions = ["*",]
    not_actions = [        
        "Microsoft.Authorization/*/Delete",
        "Microsoft.Authorization/*/Write",
        "Microsoft.Authorization/elevateAccess/Action",
        "Microsoft.Blueprint/blueprintAssignments/write",
        "Microsoft.Blueprint/blueprintAssignments/delete",
        "Microsoft.Compute/galleries/share/action"
        ]
    assignable_scopes = [var.subscription,module.lz-na-prd.id]
    subscription_name = var.subscription_name
}

resource "azurerm_role_assignment" "Prod-contributors" {
    scope = module.lz-na-prd.id #this will need to be replaced with the Cummins Prod subscription information
    role_definition_name = module.Prod-contributors.role_id
    principal_id = "4218f776-72f7-4a06-889a-07a65efe1f45"
}

module "Prod-owner" {
    source = "./modules/rbac"
    name = "Az_Owner"
    description = "Grants full access to manage all production-sub resources, including the ability to assign roles in Azure RBAC."
    scope = module.lz-na-prd.id #this will need to be replaced with the Cummins Prod subscription information
    actions = ["*",]
    not_actions = []
    assignable_scopes = [var.subscription,module.lz-na-prd.id]
    subscription_name = var.subscription_name
}

resource "azurerm_role_assignment" "Prod-owner" {
    scope = module.lz-na-prd.id #this will need to be replaced with the Cummins Prod subscription information
    role_definition_name = module.Prod-owner.role_id
    principal_id = "4218f776-72f7-4a06-889a-07a65efe1f45"
}

module "Prod-access-admins" {
    source = "./modules/rbac"
    name = "Az_AccessAdmin"
    description = "Lets you manage user access to Azure resources in the production subscription."
    scope = module.lz-na-prd.id #this will need to be replaced with the Cummins Prod subscription information
    actions = [
        "*/read",
        "Microsoft.Authorization/*",
        "Microsoft.Support/*"
    ]
    not_actions = []
    assignable_scopes = [var.subscription,module.lz-na-prd.id]
    subscription_name = var.subscription_name
}

resource "azurerm_role_assignment" "Prod-access-admins" {
    scope = module.lz-na-prd.id #this will need to be replaced with the Cummins Prod subscription information
    role_definition_name = module.Prod-access-admins.role_id
    principal_id = "4218f776-72f7-4a06-889a-07a65efe1f45"
}