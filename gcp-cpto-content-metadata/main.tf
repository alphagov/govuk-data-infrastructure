terraform {
  cloud {
    organization = "govuk"
    workspaces {
      project = "govuk-data-engineering"
      name    = "gcp-cpto-content-metadata"
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
  project = "cpto-content-metadata"
}

module "managed_project" {
  source = "../modules/gcp-project-init"

  project_id   = "cpto-content-metadata"
  project_name = "cpto-content-metadata"

  project_owners = ["group:gcp-data-infrastructure-owners@digital.cabinet-office.gov.uk"]
  project_editors = [
    "group:gcp-data-infrastructure-editors@digital.cabinet-office.gov.uk",
    "serviceAccount:cpto-content-metadata@appspot.gserviceaccount.com",
    "serviceAccount:673804617052-compute@developer.gserviceaccount.com",
  ]
  project_viewers = [
    "group:gcp-data-infrastructure-viewers@digital.cabinet-office.gov.uk",
    "serviceAccount:wif-ner-model-api-deployment@cpto-content-metadata.iam.gserviceaccount.com",
    "serviceAccount:wif-govner-streamlit-app@cpto-content-metadata.iam.gserviceaccount.com",
  ]
}
