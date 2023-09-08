## This file and its content are generated based on config, pleas check README.md for more details

module "this" {
  source  = "dasmeta/elasticache/aws"
  version = "1.2.1"

  name = "dev-1-redis"
  subnet_ids = "${data.tfe_outputs.this["1-environments/dev-1/vpc"].values.results.private_subnets}"
  vpc_id = "${data.tfe_outputs.this["1-environments/dev-1/vpc"].values.results.id}"

}


data "tfe_outputs" "this" {
  for_each = { for workspace in ["1-environments/dev-1/vpc"] : workspace => workspace }

  organization = "dasmeta-testing"
  workspace    = replace(each.value, "/[^a-zA-Z0-9_-]+/", "_")
}
