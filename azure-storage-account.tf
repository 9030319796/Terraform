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
  client_id = "d9e27a7e-bd3e-4eee-a139-207ee72a7823"
  client_secret = "8cde0532-c77f-4b3f-9879-eff70cf11d6e"
  subscription_id = "82292b43-2c16-42ff-bb0d-45b868e0af31"
  tenant_id = "48ce1086-5a99-4e56-9c4c-d0e7b71bf261"
}

resource "azurerm_storage_account" "storage_account" {
     name                     = "terraform_storage"
     resource_group_name      = "app-grp"
    location                 = "North Europe"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  
}