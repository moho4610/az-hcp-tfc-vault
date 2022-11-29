data "terraform_remote_state" "query_mgmtgroups" {
  backend = "remote"
  config = {
    organization = "az-terra-lab"
    workspaces = {
      name = "az-meltaier-landing-zone-mgmtgroups"
    }
  }
}



##  Restrict Allowed Location in Platform Mgmt Group


resource "azurerm_management_group_policy_assignment" "mgmt_group_policy_assign_platform01" {
  name                 = "meltaier-pol-01"
  display_name         = "platformmgmtgroup-allowed-location-assignment"
  management_group_id  = data.terraform_remote_state.query_mgmtgroups.outputs.level2_mgmtgroup1.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e56962a6-4747-49cd-b67b-bf8b01975c4c"

  parameters = jsonencode({
    listOfAllowedLocations = {
      value = var.AllowedLocationsForPlatformAndApplicationsMgmtGroups
    }
  })

}