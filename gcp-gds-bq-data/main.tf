terraform {
  cloud {
    organization = "govuk"
    workspaces {
      project = "govuk-data-infrastructure"
      name    = "gcp-gds-bq-data"
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
  project = "gds-bq-data"
}

module "managed_project" {
  source = "../modules/gcp-project-init"

  project_id     = "gds-bq-data"
  project_name   = "gds-bq-data"
  project_owners = ["group:gcp-data-infrastructure-owners@digital.cabinet-office.gov.uk"]
  project_editors = [
    "group:gcp-data-infrastructure-editors@digital.cabinet-office.gov.uk",
    "serviceAccount:422740269226-compute@developer.gserviceaccount.com",
  ]
  project_viewers = ["group:gcp-data-infrastructure-viewers@digital.cabinet-office.gov.uk"]
}
