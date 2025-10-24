output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "public_subnet_id" {
  value = azurerm_subnet.public.id
}

output "mysql_subnet_id" {
  value = azurerm_subnet.mysql.id
}