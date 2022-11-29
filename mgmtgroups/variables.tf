variable "AADglobalAdminGroupObjectid" {
  description = "Global Admin AAD Group"
  type        = string
}

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

## Management Group Name Declarations

variable "topLevel_mgmtGroupName1" {
  description = "Top Level Management Group Name"
  type        = string
}

## Level 2
variable "level2_mgmtGroupName1" {
  description = "Management Group name"
  type        = string
}

variable "level2_mgmtGroupName2" {
  description = "Management Group name"
  type        = string
}

variable "level2_mgmtGroupName3" {
  description = "Management Group name"
  type        = string
}

variable "level2_mgmtGroupName4" {
  description = "Management Group name"
  type        = string
}


## Level 3
variable "level3_mgmtGroupName1" {
  description = "Management Group name"
  type        = string
}


variable "level3_mgmtGroupName2" {
  description = "Management Group name"
  type        = string
}

variable "level3_mgmtGroupName3" {
  description = "Management Group name"
  type        = string
}

variable "level3_mgmtGroupName4" {
  description = "Management Group name"
  type        = string
}

variable "level3_mgmtGroupName5" {
  description = "Management Group name"
  type        = string
}

