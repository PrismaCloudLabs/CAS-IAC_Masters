provider "aws" {
  region = var.region
}

provider "azurerm" {
  features {}
}

resource "random_string" "this" {
  length  = 16
  special = false
}

locals {
  storage_name = "casmaster${lower(random_string.this.result)}"
}

resource "azurerm_resource_group" "this" {
  name      = var.resource_group_name
  location  = var.location
}

resource "azurerm_storage_account" "this" {
  name                = local.storage_name
  resource_group_name = azurerm_resource_group.this.name
  location            = var.location
  identity {
    type = "SystemAssigned"
  }
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  tags = {
    environnment = "dev"
  }
}