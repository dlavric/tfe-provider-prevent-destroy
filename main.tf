terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.42.0"
    }
  }
}

provider "tfe" {
  hostname = "app.terraform.io"
  #token    = setup an environment variable
}


resource "tfe_workspace" "test" {
  name         = "my-workspace-name"
  organization = "daniela-org"
  tag_names    = ["test", "app"]
  lifecycle {
    prevent_destroy = true
  }
}