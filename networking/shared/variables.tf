

variable "location" {
  description = ""
  type        = string
}
variable "tenant_id" {
  description = "Service principal tenant ID (azure directory)"
  type        = string
}

## Networking Vars Workspace
variable "dns_servers" {
  description = ""
  type        = list(string)
}

variable "vnet_name01" {
  description = ""
  type        = string
}

variable "vnet_name01_addspace" {
  description = ""
  type        = list(string)
}

#########
variable "vnet_name01_subnet_name01" {
  description = ""
  type        = string
}
variable "vnet_name01_subnet_name01_addressprefix" {
  description = ""
  type        = string
}

#############
variable "vnet_name01_subnet_name02" {
  description = ""
  type        = string
}
variable "vnet_name01_subnet_name02_addressprefix" {
  description = ""
  type        = string
}

##########
variable "vnet_name01_subnet_name03" {
  description = ""
  type        = string
}
variable "vnet_name01_subnet_name03_addressprefix" {
  description = ""
  type        = string
}

#########
variable "vnet_name01_subnet_name04" {
  description = ""
  type        = string
}
variable "vnet_name01_subnet_name04_addressprefix" {
  description = ""
  type        = string
}
#########
variable "vnet_name01_subnet_name05" {
  description = ""
  type        = string
}
variable "vnet_name01_subnet_name05_addressprefix" {
  description = ""
  type        = string
}


