

variable "location" {
  description = ""
  type        = string
}
variable "tenant_id" {
  description = "Service principal tenant ID (azure directory)"
  type        = string
}

## Log Analytics Workspace

variable "default_workspace_name" {
  description = ""
  type        = string
}

