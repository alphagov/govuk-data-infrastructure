terraform {
  cloud {
    organization = "govuk"
    workspaces {
      project = "govuk-data-infrastructure"
      name    = "gcp-govuk-bigquery-analytics"
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
  project = "govuk-bigquery-analytics"
}

module "managed_project" {
  source = "../modules/gcp-project-init"

  project_id   = "govuk-bigquery-analytics"
  project_name = "GOV-UK BigQuery analytics"

  project_owners = ["group:gcp-data-infrastructure-owners@digital.cabinet-office.gov.uk"]
  project_editors = [
    "group:gcp-data-infrastructure-editors@digital.cabinet-office.gov.uk",
    "serviceAccount:1052267805917-compute@developer.gserviceaccount.com",
    "serviceAccount:1052267805917-pibne89cocs3urf43c0621q10un7tgen@developer.gserviceaccount.com",
  ]
  project_viewers = ["group:gcp-data-infrastructure-viewers@digital.cabinet-office.gov.uk"]
}
