terraform {
  cloud {
    organization = "govuk"
    workspaces {
      project = "govuk-data-engineering"
      name    = "gcp-disco-journeys"
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
  project = "disco-journeys"
}

module "managed_project" {
  source = "../modules/gcp-project-init"

  project_id   = "disco-journeys"
  project_name = "disco-journeys"

  project_owners = ["group:gcp-data-infrastructure-owners@digital.cabinet-office.gov.uk"]
  project_editors = [
    "group:gcp-data-infrastructure-editors@digital.cabinet-office.gov.uk",
    "serviceAccount:340667619741-compute@developer.gserviceaccount.com",

  ]
  project_viewers = [
    "group:gcp-data-infrastructure-viewers@digital.cabinet-office.gov.uk",

  ]
}
