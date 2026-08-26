terraform {
  cloud {
    organization = "govuk"
    workspaces {
      project = "govuk-data-infrastructure"
      name    = "gcp-cpto-spam-classifier"
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
  project = "cpto-spam-classifier"
}

module "managed_project" {
  source = "../modules/gcp-project-init"

  project_id   = "cpto-spam-classifier"
  project_name = "cpto-spam-classifier"

  project_owners = ["group:gcp-data-infrastructure-owners@digital.cabinet-office.gov.uk"]
  project_editors = [
    "group:gcp-data-infrastructure-editors@digital.cabinet-office.gov.uk",
    "serviceAccount:cpto-spam-classifier-sa@cpto-spam-classifier.iam.gserviceaccount.com",
    "serviceAccount:cpto-spam-classifier@appspot.gserviceaccount.com",

  ]
  project_viewers = [
    "group:gcp-data-infrastructure-viewers@digital.cabinet-office.gov.uk",

  ]
}
