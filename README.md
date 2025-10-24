You need to add Remote Backend. in main.tf file in root directory change this
  backend "azurerm" {
    resource_group_name  = "tf-backend-rg"
    storage_account_name = "maleeshaterraformbe"
    container_name       = "tfstate"
    key                  = "epicbook.terraform.tfstate"
  }
}

And you need to provide credentials on powershell
$env:ARM_CLIENT_ID=""
$env:ARM_CLIENT_SECRET=""
$env:ARM_TENANT_ID=""
$env:ARM_SUBSCRIPTION_ID=""

Then Run
terraform plan -var-file="prod.tfvars"
terraform apply -var-file="prod.tfvars"

All environment and sites and everything will be created at once. Not a single configuration edit.
