terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "3.107.0"
    }
  }
}

provider "azurerm" {
    features {
    }
  client_id = "#"
  client_secret = "#"
  subscription_id = "#"
  tenant_id = "#"
}

locals {
  resorce_group = "app-grp"
  location = "North Europe"

}

resource "azurerm_resource_group" "app_grp" {
    name = local.resorce_group
    location = local.location
  
}
resource "azurerm_virtual_network" "example" {
  name                = "app-network"
  location            = azurerm_resource_group.app_grp.location
  resource_group_name = azurerm_resource_group.app_grp.name
  address_space       = ["10.0.0.0/16"]
  

  subnet {
    name           = "SubnetA"
    address_prefix = "10.0.1.0/24"
  }

}