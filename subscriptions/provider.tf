## Steps
## 1. Go to Terraform Cloud & Create your own Org
## 2. In the Org Creation Wizard, you will be prompted to create your first workspace
## 3. Choose CLI-Driven workflow , Remote-CLI mode is chosen by default
terraform {
  cloud {
    organization = "az-terra-lab"

    workspaces {
      name = "az-meltaier-landing-zone-subscriptions"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.vending_subscription_id
  client_id       = var.adminsvcprincipal_client_id
  client_secret   = var.adminsvcprincipal_client_secret
  tenant_id       = var.adminsvcprincipal_tenant_id
}