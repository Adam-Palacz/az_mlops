terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.77.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "saapterraformdev"
    container_name       = "conaptfstate"
    key                  = "terraform.tfstate"
    access_key           = var.sa_key
  }
}

provider "azurerm" {
  features {
  }
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}

resource "azurerm_resource_group" "rg-mlops-ap-dev" {
  name     = "rg-mlops-ap-dev"
  location = "West Europe"
}