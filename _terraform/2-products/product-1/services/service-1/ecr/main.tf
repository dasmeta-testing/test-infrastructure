## This file and its content are generated based on config, pleas check README.md for more details

module "this" {
  source  = "dasmeta/modules/aws//modules/ecr"
  version = "2.6.2"

  repos = ["strapi"]

}


data "tfe_outputs" "this" {
  for_each = { for workspace in [] : workspace => workspace }

  organization = "dasmeta-testing"
  workspace    = replace(each.value, "/[^a-zA-Z0-9_-]+/", "_")
}
