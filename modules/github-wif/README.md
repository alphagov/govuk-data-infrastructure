# GitHub Workload Identity Federation (WIF) Module

This Terraform module creates and configures resources in Google Cloud Platform (GCP) to enable GitHub Actions to authenticate with GCP using Workload Identity Federation (WIF). This allows GitHub Actions workflows to access GCP resources securely without needing to store long-lived service account keys.

## Resources Created

This module will create the following resources:

*   **Service Account:** A GCP Service Account that GitHub Actions will assume.
*   **Workload Identity Pool:** A pool to manage external identities.
*   **Workload Identity Pool Provider:** An OIDC provider to trust GitHub as an identity provider.
*   **IAM Bindings:** IAM roles are granted to the service account as specified.
* **Project Service Enablement**: The required APIs for the resources are enabled on your project.

## Usage

To use this module, include it in your Terraform configuration:

```terraform
module "github_wif" {
  source = "./modules/github-wif"

  project_id = "your-gcp-project-id"
  github_repository = "your-org/your-repo"
  # Optionally define project roles.
  # sa_project_roles = [
  #   "roles/storage.objectAdmin",
  #   "roles/artifactregistry.writer"
  # ]
  # Optionally define SAs which the GitHub Actions SA is allowed to "act as"
  # sa_permission_to_act_as = []
}