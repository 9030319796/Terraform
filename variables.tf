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

variable "azure_resource_name" {
    type = string
    description = "Enter the name of the group"
  
}

variable "azure_resource_location" {
    type = string
    description = "Enter the name of the location"
  
}


resource "azurerm_resource_group" "app_grp" {
    name = var.azure_resource_name
    location = var.azure_resource_location
}