## This file and its content are generated based on config, pleas check README.md for more details

module "this" {
  source  = "dasmeta/rds/aws"
  version = "1.0.0"

  apply_immediately = true
  backup_retention_period = 30
  db_name = "dbdev"
  db_password = "passwordTerraform12!"
  db_username = "userTerraform"
  enabled_cloudwatch_logs_exports = ["mysql"]
  engine = "mysql"
  engine_version = "5.7"
  identifier = "dbdev"
  parameter_group_name = "default.mysql5.7"
  subnet_ids = "${data.tfe_outputs.this["1-environments/dev-1/vpc"].values.results.private_subnets}"
  vpc_id = "${data.tfe_outputs.this["1-environments/dev-1/vpc"].values.results.id}"
  providers = {"aws":"aws"}
}


data "tfe_outputs" "this" {
  for_each = { for workspace in ["1-environments/dev-1/vpc"] : workspace => workspace }

  organization = "dasmeta-testing"
  workspace    = replace(each.value, "/[^a-zA-Z0-9_-]+/", "_")
}
