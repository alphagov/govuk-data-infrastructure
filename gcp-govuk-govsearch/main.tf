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
      version = "~> 8.9.0"
    }
  }

  required_version = "~> 1.16"
}

provider "google" {
  project = "govuk-govsearch"
}
