variable "location" {
  description = "Region in Azure"
  type        = string
}
variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}
variable "tags" {
  description = "Tags map"
  type        = map(string)
}