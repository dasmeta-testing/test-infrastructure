## This file and its content are generated based on config, pleas check README.md for more details

module "this" {
  source  = "dasmeta/eks/aws"
  version = "2.8.2"

  account_id = "565580475168"
  adot_config = {"accept_namespace_regex":"(default|kube-system)","additional_metrics":[]}
  cluster_enabled_log_types = ["audit"]
  cluster_name = "eks-dev"
  cluster_version = "1.27"
  metrics_exporter = "adot"
  node_groups = {"dev_nodes":{"desired_size":0,"max_capacity":0,"max_size":1,"min_size":0}}
  node_groups_default = {"capacity_type":"SPOT","instance_types":["t3.medium"]}
  send_alb_logs_to_cloudwatch = false
  users = [{"username":"aram.karapetyan"},{"username":"julia.aghamyan"}]
  vpc = {"link":{"id":"${data.tfe_outputs.this["1-environments/dev-1/vpc"].values.results.id}","private_subnet_ids":"${data.tfe_outputs.this["1-environments/dev-1/vpc"].values.results.private_subnets}"}}
  providers = {"aws":"aws"}
}


data "tfe_outputs" "this" {
  for_each = { for workspace in ["1-environments/dev-1/vpc"] : workspace => workspace }

  organization = "dasmeta-testing"
  workspace    = replace(each.value, "/[^a-zA-Z0-9_-]+/", "_")
}
