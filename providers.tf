terraform {
  required_version = ">= 1.3.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.41.0"
    }
    azuread = {
      version = ">= 2.33.0"
    }
    kubernetes = {
      version = ">= 2.17.0"
    }
  }
}

