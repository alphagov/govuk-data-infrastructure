terraform {
  cloud {
    organization = "govuk"
    workspaces {
      project = "govuk-data-infrastructure"
      name    = "gcp-sde-prototype-service"
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
  project = "sde-prototype-service"
}

module "managed_project" {
  source = "../modules/gcp-project-init"

  project_id   = "sde-prototype-service"
  project_name = "sde-prototype-service"

  project_owners = ["group:gcp-data-infrastructure-owners@digital.cabinet-office.gov.uk"]
  project_editors = [
    "group:gcp-data-infrastructure-editors@digital.cabinet-office.gov.uk",
    "serviceAccount:503350198460-compute@developer.gserviceaccount.com",
    "serviceAccount:firebase-measurement@system.gserviceaccount.com",
    "serviceAccount:sde-prototype-service@appspot.gserviceaccount.com",
  ]
  project_viewers = ["group:gcp-data-infrastructure-viewers@digital.cabinet-office.gov.uk"]
}
