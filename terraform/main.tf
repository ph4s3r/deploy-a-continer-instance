data "azurerm_resource_group" "rg-testapp" {
  name     = var.rgname
}

resource "azurerm_network_profile" "aci-testapp-networkprofile" {
  # azurerm_network_profile is needed when ip_address_type is Private
  name                = "aci-testapp-networkprofile"
  location            = data.azurerm_resource_group.rg-testapp.location
  resource_group_name = data.azurerm_resource_group.rg-testapp.name

  container_network_interface {
    name = "eth0"

    ip_configuration {
      name      = "aci-testapp-ipconfig"
      subnet_id = var.subnet_id
    }
  }
}


resource "azurerm_container_group" "aci-testapp" {
  name                = "aci-testapp"
  location            = data.azurerm_resource_group.rg-testapp.location
  resource_group_name = data.azurerm_resource_group.rg-testapp.name
  ip_address_type     = "Private"
  os_type             = "Linux"       
  network_profile_id  = azurerm_network_profile.aci-testapp-networkprofile.id

  container {
    name   = "hello-world"
    image  = "mcr.microsoft.com/azuredocs/aci-helloworld:latest"
    cpu    = "1"
    memory = "1"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}
