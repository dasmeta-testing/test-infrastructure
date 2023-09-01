## This file and its content are generated based on config, pleas check README.md for more details

terraform {
  cloud {
    organization = "dasmeta-testing"

    workspaces {
      name = "2-products_product-1_services_service-1_ecr"
    }
  }
  
  required_providers {
  
  }

  required_version = ">= 1.3.0"
}
