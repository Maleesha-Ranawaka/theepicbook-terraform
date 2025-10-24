locals {
  # Detect which workspace you're currently on (dev or prod)
  env = terraform.workspace

  # Map of regions: dev in East US, prod in West Europe
  location_map = {
    dev  = "East US"
    prod = "West Europe"
  }

  # Map of VM sizes: smaller for dev, larger for prod
  vm_size_map = {
    dev  = "Standard_B1ms"
    prod = "Standard_B1ms"
  }

  # Tags: tiny labels that help in maintenance
  tags = {
    dev  = { Environment = "dev", Project = "EpicBook" }
    prod = { Environment = "prod", Project = "EpicBook" }
  }
}