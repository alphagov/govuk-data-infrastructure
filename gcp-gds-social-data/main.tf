terraform {
  cloud {
    organization = "govuk"
    workspaces {
      project = "govuk-data-infrastructure"
      name    = "gcp-gds-social-data"
    }
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 8.8.0"
    }
  }

  required_version = "~> 1.16"
}

provider "google" {
  project = "gds-social-data"
}

module "managed_project" {
  source = "../modules/gcp-project-init"

  project_id   = "gds-social-data"
  project_name = "gds-social-data"

  project_owners = ["group:gcp-data-infrastructure-owners@digital.cabinet-office.gov.uk"]
  project_editors = [
    "group:gcp-data-infrastructure-editors@digital.cabinet-office.gov.uk",
    "group:gcp-gds-social-data-developers@digital.cabinet-office.gov.uk",
    "serviceAccount:1031179907628-compute@developer.gserviceaccount.com",
    "serviceAccount:gds-social-data@appspot.gserviceaccount.com",
  ]
  project_viewers = ["group:gcp-data-infrastructure-viewers@digital.cabinet-office.gov.uk"]
}

module "github_wif" {
  source            = "../modules/github-wif"
  project_id        = module.managed_project.project.project_id
  github_repository = "alphagov/govuk-social-data"
  sa_project_roles = [
    "roles/artifactregistry.writer",
    "roles/storage.objectCreator",
  ]
}
