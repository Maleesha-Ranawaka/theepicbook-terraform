variable "location" {
  description = "Region for Azure VM"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group for VM and related resources"
  type        = string
}

variable "vm_size" {
  description = "Size of the VM"
  type        = string
}

variable "vm_password" {
  description = "Password for Azure VM admin"
  type        = string
  sensitive   = true
}

variable "nic_id" {
  description = "Network Interface ID for the VM"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the VM"
  type        = string
}