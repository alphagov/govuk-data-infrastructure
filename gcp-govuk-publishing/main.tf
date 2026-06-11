terraform {
  cloud {
    organization = "govuk"
    workspaces {
      project = "govuk-data-engineering"
      name    = "gcp-govuk-publishing"
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
  project = "govuk-publishing"
}

module "managed_project" {
  source = "../modules/gcp-project-init"

  project_id     = "govuk-publishing"
  project_name   = "govuk-publishing"
  project_owners = ["group:gcp-govuk-publishing-owners@digital.cabinet-office.gov.uk"]
  project_editors = [
    "serviceAccount:govuk-publishing@appspot.gserviceaccount.com",
    "serviceAccount:analytics-processing-dev@system.gserviceaccount.com",
    "serviceAccount:942729121218-compute@developer.gserviceaccount.com",
  ]
  project_viewers = []
}
