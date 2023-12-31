terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.77.0"
    }
  }
}

provider "azurerm" {
    features {
    }
  subscription_id   = var.subscription_id
  tenant_id         = var.tenant_id
  client_id         = var.client_id
  client_secret     = var.client_secret
}

resource "azurerm_resource_group" "rg-mlops-ap-edu" {
  name     = "rg-mlops-ap-edu"
  location = "West Europe"
}