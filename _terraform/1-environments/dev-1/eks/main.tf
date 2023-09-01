## This file and its content are generated based on config, pleas check README.md for more details

module "this" {
  source  = "dasmeta/eks/aws"
  version = "2.8.0"

  account_id = "565580475168"
  adot_config = {"default_config":true}
  cluster_enabled_log_types = ["audit"]
  cluster_name = "eks-dev"
  cluster_version = "1.27"
  metrics_exporter = "adot"
  node_groups = {"dev_nodes":{"desired_size":1,"max_capacity":1,"max_size":1,"min_size":1}}
  node_groups_default = {"capacity_type":"SPOT","instance_types":["t3.medium"]}
  send_alb_logs_to_cloudwatch = false
  vpc = {"link":{"id":"${data.tfe_outputs.this["1-environments/dev-1/vpc"].values.results.output.id}","private_subnet_ids":"${data.tfe_outputs.this["1-environments/dev-1/vpc"].values.results.output.private_subnets}"}}
  providers = {"aws":"aws"}
}


data "tfe_outputs" "this" {
  for_each = { for workspace in ["1-environments/dev-1/vpc"] : workspace => workspace }

  organization = "dasmeta-testing"
  workspace    = replace(each.value, "/[^a-zA-Z0-9_-]+/", "_")
}
