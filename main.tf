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

terraform {
  cloud {
    organization = "daniela-org"
    hostname = "app.terraform.io" # Optional; defaults to app.terraform.io

    workspaces {
      name = "tfe-provider-prevent-destroy"
    }
  }
}


resource "tfe_workspace" "test" {
  name         = "my-workspace-name"
  organization = "daniela-org"
  lifecycle {
    prevent_destroy = true
  }
}