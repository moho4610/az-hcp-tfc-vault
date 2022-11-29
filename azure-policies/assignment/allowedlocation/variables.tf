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










variable "AllowedLocationsForPlatformAndApplicationsMgmtGroups" {
  type    = list(string)
  default = ["australiaeast", "australiasoutheast"]
}

