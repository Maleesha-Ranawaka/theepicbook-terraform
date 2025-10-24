terraform {
  backend "azurerm" {
    resource_group_name  = "tf-backend-rg"
    storage_account_name = "maleeshaterraformbe"
    container_name       = "tfstate"
    key                  = "epicbook.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "network" {
  source              = "./modules/network"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tags                = var.tags
}

module "database" {
  source              = "./modules/database"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  db_admin            = var.db_admin
  db_password         = var.db_password
  mysql_subnet_id     = module.network.mysql_subnet_id
  private_dns_zone_id = module.database.private_dns_zone_id
  vnet_id             = module.network.vnet_id
}

module "compute" {
  source              = "./modules/compute"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  vm_size             = var.vm_size
  vm_password         = var.vm_password
  nic_id              = module.compute.nic_id
  subnet_id           = module.network.public_subnet_id
}