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


##### Shared Vnet

resource "azurerm_virtual_network" "sharedvnet" {
  name                = var.vnet_name01
  location            = var.location
  resource_group_name = data.terraform_remote_state.query_rg_platform.outputs.resource_group_name02.name
  address_space       = var.vnet_name01_addspace
  dns_servers         = var.dns_servers

  subnet {
    name           = var.vnet_name01_subnet_name01
    address_prefix = var.vnet_name01_subnet_name01_addressprefix
  }

  subnet {
    name           = var.vnet_name01_subnet_name02
    address_prefix = var.vnet_name01_subnet_name02_addressprefix
  }

  subnet {
    name           = var.vnet_name01_subnet_name03
    address_prefix = var.vnet_name01_subnet_name03_addressprefix
  }
  subnet {
    name           = var.vnet_name01_subnet_name04
    address_prefix = var.vnet_name01_subnet_name04_addressprefix
  }
  subnet {
    name           = var.vnet_name01_subnet_name05
    address_prefix = var.vnet_name01_subnet_name05_addressprefix
  }


  tags = {
    environment = "Production"
  }

}
