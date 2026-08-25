terraform {
  cloud {
    organization = "govuk"
    workspaces {
      project = "govuk-data-infrastructure"
      name    = "gcp-gds-looker"
    }
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.33.0"
    }
  }

  required_version = "~> 1.15"
}

provider "google" {
  project = "gds-looker"
}

module "managed_project" {
  source = "../modules/gcp-project-init"

  project_id   = "gds-looker"
  project_name = "gds-looker"

  project_owners  = ["group:gcp-gds-looker-owners@digital.cabinet-office.gov.uk"]
  project_editors = []
  project_viewers = []
}
