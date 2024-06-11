terraform {
    required_providers {
        azurerm = {
    source = "hashicorp/azurerm"
      }
    }
}

provider "azurerm" {
  client_id = "#"
  client_secret = "#"
  subscription_id = "#"
  tenant_id = "#"
  features {
    
  }
}

resource "azurerm_resource_group" "app_grp" {
    name = "app-grp"
    location = "North Europe"
  
}
