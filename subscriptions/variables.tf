variable "vending_subscription_id" {
  description = "Scope in which downstream subscriptions and/or management groups would be created"
  type        = string
}

variable "adminsvcprincipal_client_id" {
  description = "Service principal application id(or ClientID), must have admin permissions to use billing account "
  type        = string
}

variable "adminsvcprincipal_client_secret" {
  description = "Service principal application id(or ClientID), must have admin permissions to use billing account"
  type        = string
}

variable "adminsvcprincipal_tenant_id" {
  description = "Service principal tenant ID (azure directory)"
  type        = string
}


## BIlling Info

variable "billing_account_name" {
  description = ""
  type        = string
}

variable "billing_profile_name" {
  description = ""
  type        = string
}

variable "invoice_section_name" {
  description = ""
  type        = string
}


## AD Group for Tenant Admins
variable "AADglobalAdminGroupObjectid" {
  description = ""
  type        = string
}

## 

variable "subscriptionIdentity" {
  description = ""
  type        = string
}
variable "subscriptionManagement" {
  description = ""
  type        = string
}
variable "subscriptionConnectivity" {
  description = ""
  type        = string
}
variable "subscriptionApplicationLandingZone1" {
  description = ""
  type        = string
}

variable "subscriptionApplicationLandingZone2" {
  description = ""
  type        = string
}
variable "subscriptionApplicationLandingZone3" {
  description = ""
  type        = string
}
variable "subscriptionLegacySubscription" {
  description = ""
  type        = string
}
variable "subscriptionSandbox1" {
  description = ""
  type        = string
}

