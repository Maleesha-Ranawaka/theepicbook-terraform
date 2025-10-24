resource "azurerm_private_dns_zone" "mysql_private_dns" {
  name                = "privatelink.mysql.database.azure.com"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "mysql_dns_link" {
  name                  = "${terraform.workspace}-mysql-dns-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.mysql_private_dns.name
  virtual_network_id    = var.vnet_id
}
/*
resource "azurerm_mysql_flexible_server" "db" {
  name                   = "${terraform.workspace}-epicbook-db"
  resource_group_name    = var.resource_group_name
  location               = var.location
  administrator_login    = var.db_admin
  administrator_password = var.db_password
  delegated_subnet_id    = var.mysql_subnet_id
  private_dns_zone_id    = azurerm_private_dns_zone.mysql_private_dns.id
  version                = "8.0.21"
  sku_name               = "B_Standard_B1ms"

  depends_on = [azurerm_private_dns_zone_virtual_network_link.mysql_dns_link]
}

resource "azurerm_mysql_flexible_database" "epicbookdb" {
  name                = "epicbook"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.db.name
  charset             = "utf8"
  collation           = "utf8_general_ci"
}
*/