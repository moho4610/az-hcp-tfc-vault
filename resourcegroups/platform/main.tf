data "terraform_remote_state" "query_subscriptions" {
  backend = "remote"
  config = {
    organization = "az-terra-lab"
    workspaces = {
      name = "az-meltaier-landing-zone-subscriptions"
    }
  }
}


##### Resource Groups

### Management Resource Group


resource "azurerm_resource_group" "resource_group_name01" {
  provider = azurerm.managementsub
  name     = var.resource_group_name01
  location = var.location
}

output "resource_group_name01" {

  value = azurerm_resource_group.resource_group_name01
}

### Conenctivity Resource Group


resource "azurerm_resource_group" "resource_group_name02" {
  provider = azurerm.connectivitysub
  name     = var.resource_group_name02
  location = var.location
}

output "resource_group_name02" {
  value = azurerm_resource_group.resource_group_name02
}