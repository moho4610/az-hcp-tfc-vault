## Steps
## 1. Go to Terraform Cloud & Create your own Org
## 2. In the Org Creation Wizard, you will be prompted to create your first workspace
## 3. Choose CLI-Driven workflow , Remote-CLI mode is chosen by default
terraform {
  cloud {
    organization = "az-terra-lab"

    workspaces {
      name = "az-meltaier-landing-zone-monitoring"
    }
  }
}




provider "azurerm" {
  features {}

  subscription_id = data.terraform_remote_state.query_subscriptions.outputs.subscriptionManagement.subscription_id
  client_id       = data.vault_generic_secret.azure_spn.data.client_id
  client_secret   = data.vault_generic_secret.azure_spn.data.client_secret
  tenant_id       = var.tenant_id
}


provider "vault" {}

data "vault_generic_secret" "azure_spn" {
  path = "azure-meltaier/creds/meltaier-root"
}
