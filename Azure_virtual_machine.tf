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


resource "azurerm_virtual_network" "v_net" {
  name = "VPC"
  resource_group_name = azurerm_resource_group.app_grp.name
  location = azurerm_resource_group.app_grp.location
  address_space = [ "10.0.0.0/16" ]
  
}

resource "azurerm_subnet" "SubnetA" {
  name = "SubnetA"
  resource_group_name = azurerm_resource_group.app_grp.name
  virtual_network_name = azurerm_virtual_network.v_net.name
  address_prefixes = ["10.0.0.0/24"]
  
}

resource "azurerm_network_interface" "security_group_windows" {
  name = "windows_group"
  location = azurerm_resource_group.app_grp.location
  resource_group_name = azurerm_resource_group.app_grp.name

  ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.SubnetA.id
    private_ip_address_allocation = "Dynamic"
  }
  
}

resource "azurerm_windows_virtual_machine" "windows_machine" {
  name = "Windows-server"
  resource_group_name = azurerm_resource_group.app_grp.name
  location = azurerm_resource_group.app_grp.location
  size = "Standard_F2"
  admin_username = "sampath"
  admin_password = "sampath1996@A"
  network_interface_ids = [
    azurerm_network_interface.security_group_windows.id
  ]

 os_disk {
  caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
 } 
 source_image_reference {
   publisher = "MicrosoftWindowsServer"
   offer = "WindowsServer"
   sku = "2019-Datacenter"
   version = "latest"
 }
}
