## This file and its content are generated based on config, pleas check README.md for more details

module "this" {
  source  = "dasmeta/dns/aws"
  version = "1.0.2"

  create_zone = true
  zone = "test.dasmeta.com"
  providers = {"aws":"aws"}
}


data "tfe_outputs" "this" {
  for_each = { for workspace in [] : workspace => workspace }

  organization = "dasmeta-testing"
  workspace    = replace(each.value, "/[^a-zA-Z0-9_-]+/", "_")
}
