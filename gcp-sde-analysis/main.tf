terraform {
  cloud {
    organization = "govuk"
    workspaces {
      project = "govuk-data-infrastructure"
      name    = "gcp-sde-analysis"
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
  project = "sde-analysis"
}

module "managed_project" {
  source = "../modules/gcp-project-init"

  project_id   = "sde-analysis"
  project_name = "sde-analysis"

  project_owners = ["group:gcp-data-infrastructure-owners@digital.cabinet-office.gov.uk"]
  project_editors = [
    "group:gcp-data-infrastructure-editors@digital.cabinet-office.gov.uk",
    "serviceAccount:731493124468-compute@developer.gserviceaccount.com",
    "serviceAccount:analytics-processing-dev@system.gserviceaccount.com",
    "serviceAccount:sde-analysis@appspot.gserviceaccount.com",
  ]
  project_viewers = ["group:gcp-data-infrastructure-viewers@digital.cabinet-office.gov.uk"]
}
