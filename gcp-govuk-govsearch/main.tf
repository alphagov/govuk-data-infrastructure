terraform {
  cloud {
    organization = "govuk"
    workspaces {
      project = "govuk-data-infrastructure"
      name    = "gcp-govuk-govsearch"
    }
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 8.8.0"
    }
  }

  required_version = "~> 1.17"
}

provider "google" {
  project = "govuk-govsearch"
}
