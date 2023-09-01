## This file and its content are generated based on config, pleas check README.md for more details

terraform {
  cloud {
    organization = "dasmeta-testing"

    workspaces {
      name = "2-products_product-1_dev-1_dns-records"
    }
  }
  
  required_providers {
  
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
      configuration_aliases = []
    }
  
  }

  required_version = ">= 1.3.0"
}
