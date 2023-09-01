## This file and its content are generated based on config, pleas check README.md for more details

module "this" {
  source  = "dasmeta/rds/aws"
  version = "1.0.0"

  apply_immediately = true
  db_password = "passwordTerraform12!"
  db_username = "userTerraform"
  enabled_cloudwatch_logs_exports = ["postgresql"]
  engine = "postgres"
  engine_version = "14"
  identifier = "dbdev"
  parameter_group_name = "rds-pg-12"
  subnet_ids = "${data.tfe_outputs.this[\"1-environments/dev-1/vpc\"].values.results.output.private_subnets}"
  vpc_id = "${data.tfe_outputs.this[\"1-environments/dev-1/vpc\"].values.results.output.id}"
  providers = {"aws":"aws"}
}


data "tfe_outputs" "this" {
  for_each = { for workspace in ["1-environments/dev-1/vpc"] : workspace => workspace }

  organization = "dasmeta-testing"
  workspace    = replace(each.value, "/[^a-zA-Z0-9_-]+/", "_")
}
