terraform {
  
}
  
resource "azurerm_resource_group" "nsgs" {
   name         = "nsgrg"
   location     = "South Central US"
   
}

resource "azurerm_network_security_group" "resource_group_default" {
   name = "Privatensg"
   resource_group_name  = "nsgrg"
   location             = "South Central US"
   
}

resource "azurerm_network_security_rule" "AllowSSH" {
    name = "AllowSSH"
    resource_group_name         = "nsgrg"
    network_security_group_name = "Privatensg"

    priority                    = 1010
    access                      = "Allow"
    direction                   = "Inbound"
    protocol                    = "Tcp"
    destination_port_range      = 22
    destination_address_prefix  = "*"
    source_port_range           = "*"
    source_address_prefix       = "*"
}


