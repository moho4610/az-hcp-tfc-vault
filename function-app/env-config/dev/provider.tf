terraform {
  cloud {
    organization = "az-terra-lab"

    workspaces {
      name = "az-meltaier-function-dev"
    }
  }
}


provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = data.vault_generic_secret.azure_spn.data.client_id
  client_secret   = data.vault_generic_secret.azure_spn.data.client_secret
  tenant_id       = var.tenant_id
}


provider "vault" {}

data "vault_generic_secret" "azure_spn" {
  path = "azure-meltaier/creds/meltaier-root"
}

output "HelloDev" {
  value = "HelloFromDev"
}
