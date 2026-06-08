terraform {
  cloud {
    organization = "govuk"
    workspaces {
      project = "govuk-data-engineering"
      name    = "gcp-govuk-s3-mirror"
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
  project = "govuk-s3-mirror"
}

module "managed_project" {
  source = "../modules/gcp-project-init"

  project_id   = "govuk-s3-mirror"
  project_name = "govuk-s3-mirror"
  project_owners = [
    "group:govgraph-developers@digital.cabinet-office.gov.uk",
    "group:govuk-gcp-access@digital.cabinet-office.gov.uk",
  ]
  project_editors = ["serviceAccount:384988117066-compute@developer.gserviceaccount.com"]
  project_viewers = []
}
