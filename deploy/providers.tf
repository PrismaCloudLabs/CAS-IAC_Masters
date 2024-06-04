terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.45.0"
    } 
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.85.0"
    }    
  }
}