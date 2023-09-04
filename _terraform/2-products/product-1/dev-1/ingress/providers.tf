## This file and its content are generated based on config, pleas check README.md for more details

provider "aws" {


  region = "eu-central-1"


  default_tags {

    tags = { "Account" : "boilerplate", "AppliedFrom" : "terraform-cloud", "ManageLevel" : "product", "ManagedBy" : "terraform", "TerraformCloudWorkspace" : "2-products_product-1_dev-1_ingress", "TerraformModuleSource" : "dasmeta/modules/aws//modules/ingress", "TerraformModuleVersion" : "1.1.4" }
  }
}
provider "kubernetes" {


  cluster_ca_certificate = data.tfe_outputs.this["1-environments/dev-1/eks"].values.results.cluster_certificate
  host                   = data.tfe_outputs.this["1-environments/dev-1/eks"].values.results.cluster_host
  # token                  = data.tfe_outputs.this["1-environments/dev-1/eks"].values.results.cluster_token

  exec {


    api_version = "client.authentication.k8s.io/v1beta1"

    args = ["eks", "--region", "eu-central-1", "get-token", "--cluster-name", "local.cluster_name"]

    command = "aws"

  }

}
