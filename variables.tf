variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Name of Azure Resource Group"
  type        = string
}

variable "vm_size" {
  description = "VM size"
  type        = string
  default     = "Standard_B1ms"
}

variable "db_admin" {
  description = "DB admin login"
  type        = string
}

variable "db_password" {
  description = "DB admin password"
  type        = string
  sensitive   = true
}

variable "vm_password" {
  description = "VM admin password"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags map"
  type        = map(string)
}