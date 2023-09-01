## This file and its content are generated based on config, pleas check README.md for more details

module "this" {
  source  = "terraform-module/release/helm"
  version = "2.6.0"

  app = {"chart":"strapi","force_update":true,"name":"truecharts/strapi","version":"2.0.15","wait":false}
  namespace = "dev"
  repository = "https://charts.truecharts.org/"
  set = []
  set_sensitive = []

}


data "tfe_outputs" "this" {
  for_each = { for workspace in [] : workspace => workspace }

  organization = "dasmeta-testing"
  workspace    = replace(each.value, "/[^a-zA-Z0-9_-]+/", "_")
}
