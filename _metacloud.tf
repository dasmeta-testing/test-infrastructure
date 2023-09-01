terraform {
  cloud {
    organization = "dasmeta-testing"
    workspaces { name = "test-infrastructure" }
  }
}

variable "tfc_token" {}
variable "git_token" {}

module "metacloud" {
  source = "github.com/dasmeta/terraform-tfe-cloud.git?ref=DMVP-2598-simplify-tfe-use"

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
