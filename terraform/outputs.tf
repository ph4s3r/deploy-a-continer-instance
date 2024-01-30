output "aci-ip" {
  value = azurerm_container_group.aci-testapp.ip_address
}

output "aci-port" {
  value = azurerm_container_group.aci-testapp.exposed_port
}