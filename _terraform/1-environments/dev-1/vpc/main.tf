## This file and its content are generated based on config, pleas check README.md for more details

module "this" {
  source  = "dasmeta/vpc/aws"
  version = "1.0.1"

  availability_zones = ["eu-central-1a","eu-central-1b","eu-central-1c"]
  cidr = "10.16.0.0/16"
  name = "dev-vpc"
  private_subnet_tags = {"kubernetes.io/cluster/dev":"shared","kubernetes.io/role/internal-elb":"1"}
  private_subnets = ["10.16.1.0/24","10.16.2.0/24","10.16.3.0/24"]
  public_subnet_tags = {"kubernetes.io/cluster/dev":"shared","kubernetes.io/role/elb":"1"}
  public_subnets = ["10.16.4.0/24","10.16.5.0/24","10.16.6.0/24"]
  providers = {"aws":"aws"}
}


data "tfe_outputs" "this" {
  for_each = { for workspace in [] : workspace => workspace }

  organization = "dasmeta-testing"
  workspace    = replace(each.value, "/[^a-zA-Z0-9_-]+/", "_")
}
