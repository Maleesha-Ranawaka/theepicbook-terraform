variable "location" {
  description = "Region for Azure resources"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group for database"
  type        = string
}

variable "db_admin" {
  description = "Database admin username"
  type        = string
}

variable "db_password" {
  description = "Database admin password"
  type        = string
  sensitive   = true
}

variable "mysql_subnet_id" {
  description = "Subnet ID for MySQL Flexible Server"
  type        = string
}

variable "private_dns_zone_id" {
  description = "Private DNS Zone ID"
  type        = string
}

variable "vnet_id" {
  type = string
}