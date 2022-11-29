data "terraform_remote_state" "query_subscriptions" {
  backend = "remote"
  config = {
    organization = "az-terra-lab"
    workspaces = {
      name = "az-meltaier-landing-zone-subscriptions"
    }
  }
}


##### Top Level Management Group

resource "azurerm_management_group" "topLevel_AzureOrg" {
  display_name = var.topLevel_mgmtGroupName1
}

data "azurerm_management_group" "topLevel_AzureOrg" {
  display_name = azurerm_management_group.topLevel_AzureOrg.display_name
}

resource "azurerm_role_assignment" "globalAdminGroupRoleAssignemnt_topLevel_AzureOrg" {
  scope                = azurerm_management_group.topLevel_AzureOrg.id
  role_definition_name = "Owner"
  principal_id         = var.AADglobalAdminGroupObjectid
}

output "topLevel_AzureOrg" {
  value = azurerm_management_group.topLevel_AzureOrg
}

#############################################################
###### Level2 Management Groups
#############################################################

#############################################################
resource "azurerm_management_group" "level2_mgmtgroup1" {
  display_name               = var.level2_mgmtGroupName1
  parent_management_group_id = azurerm_management_group.topLevel_AzureOrg.id
}

output "level2_mgmtgroup1" {
  value = azurerm_management_group.level2_mgmtgroup1
}
##############################################################

#############################################################
resource "azurerm_management_group" "level2_mgmtgroup2" {
  display_name               = var.level2_mgmtGroupName2
  parent_management_group_id = azurerm_management_group.topLevel_AzureOrg.id

}

output "level2_mgmtgroup2" {
  value = azurerm_management_group.level2_mgmtgroup2
}
##############################################################

#############################################################
resource "azurerm_management_group" "level2_mgmtgroup3" {
  display_name               = var.level2_mgmtGroupName3
  parent_management_group_id = azurerm_management_group.topLevel_AzureOrg.id

  subscription_ids = [
    #data.terraform_remote_state.query_subscriptions.outputs.subscriptionLegacySubscription.subscription_id
  ]

}

output "level2_mgmtgroup3" {
  value = azurerm_management_group.level2_mgmtgroup3
}
##############################################################

#############################################################
resource "azurerm_management_group" "level2_mgmtgroup4" {
  display_name               = var.level2_mgmtGroupName4
  parent_management_group_id = azurerm_management_group.topLevel_AzureOrg.id
  subscription_ids = [
    data.terraform_remote_state.query_subscriptions.outputs.subscriptionSandbox1.subscription_id
  ]
}

output "level2_mgmtgroup4" {
  value = azurerm_management_group.level2_mgmtgroup4
}
##############################################################

#############################################################
###### Level3 Management Groups
#############################################################
#############################################################
resource "azurerm_management_group" "level3_mgmtgroup1" {
  display_name               = var.level3_mgmtGroupName1
  parent_management_group_id = azurerm_management_group.level2_mgmtgroup1.id
  subscription_ids = [
    data.terraform_remote_state.query_subscriptions.outputs.subscriptionIdentity.subscription_id
  ]
}

output "level3_mgmtgroup1" {
  value = azurerm_management_group.level3_mgmtgroup1
}
##############################################################

#############################################################
resource "azurerm_management_group" "level3_mgmtgroup2" {
  display_name               = var.level3_mgmtGroupName2
  parent_management_group_id = azurerm_management_group.level2_mgmtgroup1.id
  subscription_ids = [
    data.terraform_remote_state.query_subscriptions.outputs.subscriptionManagement.subscription_id
  ]
}

output "level3_mgmtgroup2" {
  value = azurerm_management_group.level3_mgmtgroup2
}
##############################################################

#############################################################
resource "azurerm_management_group" "level3_mgmtgroup3" {
  display_name               = var.level3_mgmtGroupName3
  parent_management_group_id = azurerm_management_group.level2_mgmtgroup1.id
  subscription_ids = [
    data.terraform_remote_state.query_subscriptions.outputs.subscriptionConnectivity.subscription_id
  ]
}

output "level3_mgmtgroup3" {
  value = azurerm_management_group.level3_mgmtgroup3
}
##############################################################

#############################################################
resource "azurerm_management_group" "level3_mgmtgroup4" {
  display_name               = var.level3_mgmtGroupName4
  parent_management_group_id = azurerm_management_group.level2_mgmtgroup2.id

}

output "level3_mgmtgroup4" {
  value = azurerm_management_group.level3_mgmtgroup4
}
###########################################################

#############################################################
resource "azurerm_management_group" "level3_mgmtgroup5" {
  display_name               = var.level3_mgmtGroupName5
  parent_management_group_id = azurerm_management_group.level2_mgmtgroup2.id
  subscription_ids = [
    data.terraform_remote_state.query_subscriptions.outputs.subscriptionApplicationLandingZone1.subscription_id
  ]
}

output "level3_mgmtgroup5" {
  value = azurerm_management_group.level3_mgmtgroup5
}
###########################################################