data "terraform_remote_state" "query_subscriptions" {
  backend = "remote"
  config = {
    organization = "az-terra-lab"
    workspaces = {
      name = "az-meltaier-landing-zone-subscriptions"
    }
  }
}


data "terraform_remote_state" "query_rg_platform" {
  backend = "remote"
  config = {
    organization = "az-terra-lab"
    workspaces = {
      name = "az-meltaier-landing-zone-rgroups-platform"
    }
  }
}


##### Resource Groups

resource "azurerm_log_analytics_workspace" "default_workspace" {
  name                = var.default_workspace_name
  resource_group_name = data.terraform_remote_state.query_rg_platform.outputs.resource_group_name01.name
  sku                 = "PerGB2018"
  retention_in_days   = 31
  location            = var.location
}