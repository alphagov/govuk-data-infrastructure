terraform {
  cloud {
    organization = "govuk"
    workspaces {
      project = "govuk-data-infrastructure"
      name    = "gcp-single-consent-api-dev"
    }
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 8.11.0"
    }
  }

  required_version = "~> 1.17"
}

provider "google" {
  project = "single-consent-api-dev"
}
