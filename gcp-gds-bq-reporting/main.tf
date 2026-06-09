terraform {
  cloud {
    organization = "govuk"
    workspaces {
      project = "govuk-data-engineering"
      name    = "gcp-gds-bq-reporting"
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
  project = "gds-bq-reporting"
}

module "managed_project" {
  source = "../modules/gcp-project-init"

  project_id      = "gds-bq-reporting"
  project_name    = "gds-bq-reporting"
  project_owners  = ["group:gcp-gds-bq-reporting-owners@digital.cabinet-office.gov.uk"]
  project_editors = ["group:gcp-gds-bq-reporting-editors@digital.cabinet-office.gov.uk"]
  project_viewers = ["group:gcp-gds-bq-reporting-viewers@digital.cabinet-office.gov.uk"]
}
