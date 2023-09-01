## This file and its content are generated based on config, pleas check README.md for more details

provider "aws" {


  region = "eu-central-1"


  default_tags {

    tags = {"Account":"boilerplate","AppliedFrom":"terraform-cloud","ManageLevel":"account","ManagedBy":"terraform","TerraformCloudWorkspace":"0-accounts_root_account","TerraformModuleSource":"dasmeta/account/aws","TerraformModuleVersion":"1.2.2"}
  }
}
provider "aws" {
  alias = "virginia"

  region = "us-east-1"


  default_tags {

    tags = {"Account":"boilerplate","AppliedFrom":"terraform-cloud","Environment":"stage","ManageLevel":"product","ManagedBy":"terraform","Product":"boilerplate","TerraformCloudWorkspace":"0-accounts_root_account","TerraformModuleSource":"dasmeta/account/aws","TerraformModuleVersion":"1.2.2"}
  }
}
