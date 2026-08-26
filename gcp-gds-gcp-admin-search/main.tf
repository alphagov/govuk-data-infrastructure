terraform {
  cloud {
    organization = "govuk"
    workspaces {
      project = "govuk-data-infrastructure"
      name    = "gcp-gds-gcp-admin-search"
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
  project = "gds-gcp-admin-search"
}

module "managed_project" {
  source = "../modules/gcp-project-init"

  project_id   = "gds-gcp-admin-search"
  project_name = "GDS-GCP-Admin-Search"

  billing_account = "0108BC-8A2FAF-28474C"

  project_owners = ["group:gcp-data-infrastructure-owners@digital.cabinet-office.gov.uk"]
  project_editors = [
    "group:gcp-data-infrastructure-editors@digital.cabinet-office.gov.uk",
    "serviceAccount:73231474837-compute@developer.gserviceaccount.com",
  ]
  project_viewers = ["group:gcp-data-infrastructure-viewers@digital.cabinet-office.gov.uk"]
}
