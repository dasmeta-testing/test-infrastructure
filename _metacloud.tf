terraform {
  cloud {
    organization = "dasmeta-testing"
    workspaces { name = "test-infrastructure" }
  }
}

variable "tfc_token" {}
variable "git_token" {}

module "metacloud" {
  source  = "dasmeta/cloud/tfe"
  version = "v2.0.2"

  org   = "dasmeta-testing"
  token = var.tfc_token

  rootdir   = "${path.module}/_terraform/"
  targetdir = "${path.module}/_terraform"
  yamldir   = "${path.module}/."

  git_provider = "github"
  git_org      = "dasmeta-testing"
  git_repo     = "test-infrastructure"
  git_token    = var.git_token

  aws = {
    access_key_id     = ""
    secret_access_key = ""
    default_region    = ""
  }
}
