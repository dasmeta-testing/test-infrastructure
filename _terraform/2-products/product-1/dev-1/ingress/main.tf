## This file and its content are generated based on config, pleas check README.md for more details

module "this" {
  source  = "dasmeta/modules/aws//modules/ingress"
  version = "1.1.4"

  certificate_arn           = data.tfe_outputs.this["2-products/product-1/certificate"].values.results.arn
  healthcheck_path          = "/health"
  healthcheck_success_codes = "200-399"
  hostname                  = "test.dasmeta.com"
  name                      = "test"
  # namespace                 = "dev"
  # scheme                    = "internal"
  tls_hosts = ["test.dasmeta.com"]
  providers = { "aws" : "aws", "kubernetes" : "kubernetes" }
}


data "tfe_outputs" "this" {
  for_each = { for workspace in ["1-environments/dev-1/eks", "2-products/product-1/certificate"] : workspace => workspace }

  organization = "dasmeta-testing"
  workspace    = replace(each.value, "/[^a-zA-Z0-9_-]+/", "_")
}
