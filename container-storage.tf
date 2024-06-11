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
  client_secret = "#
  subscription_id = "#"
  tenant_id = "#"
}

resource "azurerm_resource_group" "group" {
    name = "app-grp"
    location = "North Europe"
  
}
resource "azurerm_storage_account" "storage_account" {
    name = "sampathterraform"
    resource_group_name = azurerm_resource_group.group.name
    location = azurerm_resource_group.group.location
    account_tier =  "Standard"
    account_replication_type = "LRS"
}

resource "azurerm_storage_container" "data" {
    name = "data"
    storage_account_name = "sampathterraform"
    container_access_type = "private"
  
}

