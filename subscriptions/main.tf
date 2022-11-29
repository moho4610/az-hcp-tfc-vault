
data "azurerm_billing_mca_account_scope" "billingdata" {
  billing_account_name = var.billing_account_name
  billing_profile_name = var.billing_profile_name
  invoice_section_name = var.invoice_section_name
}

###################################################################################################################################
### Create Subscriptions and extract subscription ID without alias( the subscription ID is then used for initial RBAC roleassignment )
###################################################################################################################################



######### Identity Subscription - START ##########
## Create Subscription
resource "azurerm_subscription" "subscriptionIdentity" {
  alias             = "IdentitySubscription"
  subscription_name = "IdentitySubscription"
  billing_scope_id  = data.azurerm_billing_mca_account_scope.billingdata.id

}


## Extract SubscriptionID (without alias)
data "azurerm_subscription" "query_subscriptionIdentity" {
  subscription_id = azurerm_subscription.subscriptionIdentity.subscription_id
}


## Assign global admin AAD group as owners to subscription
resource "azurerm_role_assignment" "globalAdminGroupRoleAssignemnt_subscriptionIdentity" {
  scope                = data.azurerm_subscription.query_subscriptionIdentity.id #data.azurerm_subscription.query_subscriptionIdentity.id
  role_definition_name = "Owner"
  principal_id         = var.AADglobalAdminGroupObjectid
}
output "subscriptionIdentity" {
  value = azurerm_subscription.subscriptionIdentity
}
######### Identity Subscription - END ##########






######### Mgmt subscription - START  ##########
## Create Subscription
resource "azurerm_subscription" "subscriptionManagement" {
  alias             = "ManagementSubscription"
  subscription_name = var.subscriptionManagement
  billing_scope_id  = data.azurerm_billing_mca_account_scope.billingdata.id

}

## Extract SubscriptionID (without alias)
data "azurerm_subscription" "query_subscriptionManagement" {
  subscription_id = azurerm_subscription.subscriptionManagement.subscription_id
}

## Assign global admin AAD group as owners to subscription
resource "azurerm_role_assignment" "globalAdminGroupRoleAssignemnt_subscriptionManagement" {
  scope                = data.azurerm_subscription.query_subscriptionManagement.id
  role_definition_name = "Owner"
  principal_id         = var.AADglobalAdminGroupObjectid
}

output "subscriptionManagement" {
  value = azurerm_subscription.subscriptionManagement
}
######### Mgmt subscription - END  ##########





######### Connectivity subscription - START  ##########
## Create Subscription
resource "azurerm_subscription" "subscriptionConnectivity" {
  alias             = "ConnectivitySubscription"
  subscription_name = var.subscriptionConnectivity
  billing_scope_id  = data.azurerm_billing_mca_account_scope.billingdata.id

}

## Extract SubscriptionID (without alias)
data "azurerm_subscription" "query_subscriptionConnectivity" {
  subscription_id = azurerm_subscription.subscriptionConnectivity.subscription_id
}

## Assign global admin AAD group as owners to subscription
resource "azurerm_role_assignment" "globalAdminGroupRoleAssignemnt_subscriptionConnectivity" {
  scope                = data.azurerm_subscription.query_subscriptionConnectivity.id
  role_definition_name = "Owner"
  principal_id         = var.AADglobalAdminGroupObjectid
}

output "subscriptionConnectivity" {
  value = azurerm_subscription.subscriptionConnectivity
}
######### Connectivity subscription - END  ##########



########## ApplicationLandingZone1-example subscription - START  ##########
## Create Subscription
resource "azurerm_subscription" "subscriptionApplicationLandingZone1" {
  alias             = "ApplicationLandingZoneSubscriptionProd"
  subscription_name = var.subscriptionApplicationLandingZone1
  billing_scope_id  = data.azurerm_billing_mca_account_scope.billingdata.id

}

## Extract SubscriptionID (without alias)
data "azurerm_subscription" "query_subscriptionApplicationLandingZone1" {
  subscription_id = azurerm_subscription.subscriptionApplicationLandingZone1.subscription_id
}

## Assign global admin AAD group as owners to subscription
resource "azurerm_role_assignment" "globalAdminGroupRoleAssignemnt_subscriptionApplicationLandingZone1" {
  scope                = data.azurerm_subscription.query_subscriptionApplicationLandingZone1.id
  role_definition_name = "Owner"
  principal_id         = var.AADglobalAdminGroupObjectid
}

output "subscriptionApplicationLandingZone1" {
  value = azurerm_subscription.subscriptionApplicationLandingZone1
}

######### ApplicationLandingZone1 subscription - END  ##########

########## ApplicationLandingZone2-example subscription - START  ##########
## Create Subscription
resource "azurerm_subscription" "subscriptionApplicationLandingZone2" {
  alias             = "ApplicationLandingZoneSubscriptionUAT"
  subscription_name = var.subscriptionApplicationLandingZone2
  billing_scope_id  = data.azurerm_billing_mca_account_scope.billingdata.id

}

## Extract SubscriptionID (without alias)
data "azurerm_subscription" "query_subscriptionApplicationLandingZone2" {
  subscription_id = azurerm_subscription.subscriptionApplicationLandingZone2.subscription_id
}

## Assign global admin AAD group as owners to subscription
resource "azurerm_role_assignment" "globalAdminGroupRoleAssignemnt_subscriptionApplicationLandingZone2" {
  scope                = data.azurerm_subscription.query_subscriptionApplicationLandingZone2.id
  role_definition_name = "Owner"
  principal_id         = var.AADglobalAdminGroupObjectid
}

output "subscriptionApplicationLandingZone2" {
  value = azurerm_subscription.subscriptionApplicationLandingZone2
}

######### ApplicationLandingZone2 subscription - END  ##########

########## ApplicationLandingZone3-example subscription - START  ##########
## Create Subscription
resource "azurerm_subscription" "subscriptionApplicationLandingZone3" {
  alias             = "ApplicationLandingZoneSubscriptionDev"
  subscription_name = var.subscriptionApplicationLandingZone3
  billing_scope_id  = data.azurerm_billing_mca_account_scope.billingdata.id

}

## Extract SubscriptionID (without alias)
data "azurerm_subscription" "query_subscriptionApplicationLandingZone3" {
  subscription_id = azurerm_subscription.subscriptionApplicationLandingZone3.subscription_id
}

## Assign global admin AAD group as owners to subscription
resource "azurerm_role_assignment" "globalAdminGroupRoleAssignemnt_subscriptionApplicationLandingZone3" {
  scope                = data.azurerm_subscription.query_subscriptionApplicationLandingZone3.id
  role_definition_name = "Owner"
  principal_id         = var.AADglobalAdminGroupObjectid
}

output "subscriptionApplicationLandingZone3" {
  value = azurerm_subscription.subscriptionApplicationLandingZone3
}

######### ApplicationLandingZone1 subscription - END  ##########

/*
########## LegacySubscription-example subscription - START #############
## Create Subscription
resource "azurerm_subscription" "subscriptionLegacySubscription" {
  alias             = "LegacySubscriptionDecom"
  subscription_name = var.subscriptionLegacySubscription
  billing_scope_id  = data.azurerm_billing_mca_account_scope.billingdata.id

}

## Extract SubscriptionID (without alias)
data "azurerm_subscription" "query_subscriptionLegacySubscription" {
  subscription_id = azurerm_subscription.subscriptionLegacySubscription.subscription_id
}


## Assign global admin AAD group as owners to subscription
resource "azurerm_role_assignment" "globalAdminGroupRoleAssignemnt_subscriptionLegacySubscription" {
  scope                = data.azurerm_subscription.query_subscriptionLegacySubscription.id
  role_definition_name = "Owner"
  principal_id         = var.AADglobalAdminGroupObjectid
}
output "subscriptionLegacySubscription" {
  value = azurerm_subscription.subscriptionLegacySubscription
}


######### LegacySubscription subscription - END  ##########
*/




########## SandboxSubscription-example subscription - START #############
## Create Subscription
resource "azurerm_subscription" "subscriptionSandbox1" {
  alias             = "SandboxSubscriptionZone1"
  subscription_name = var.subscriptionSandbox1
  billing_scope_id  = data.azurerm_billing_mca_account_scope.billingdata.id

}

## Extract SubscriptionID (without alias)
data "azurerm_subscription" "query_subscriptionSandbox1" {
  subscription_id = azurerm_subscription.subscriptionSandbox1.subscription_id
}

## Assign global admin AAD group as owners to subscription
resource "azurerm_role_assignment" "globalAdminGroupRoleAssignemnt_subscriptionSandbox1" {
  scope                = data.azurerm_subscription.query_subscriptionSandbox1.id
  role_definition_name = "Owner"
  principal_id         = var.AADglobalAdminGroupObjectid
}
output "subscriptionSandbox1" {
  value = azurerm_subscription.subscriptionSandbox1
}

######### SandboxSubscription subscription - END  ##########



