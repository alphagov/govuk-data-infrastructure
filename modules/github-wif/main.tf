terraform {
  required_version = ">= 1.16.6"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 8.8"
    }
  }
}

locals {
  required_apis = [
    "iam.googleapis.com",            # IAM API
    "iamcredentials.googleapis.com", # Service Account Credentials API (for impersonation)
    "sts.googleapis.com",            # Security Token Service API (for token exchange)
  ]
}

resource "google_project_service" "apis" {
  count   = length(local.required_apis)
  project = var.project_id
  service = local.required_apis[count.index]

  # Don't disable APIs when the module is destroyed
  disable_on_destroy = false
}

resource "google_service_account" "github_actions_sa" {
  project      = var.project_id
  account_id   = var.sa_id
  display_name = var.sa_display_name

  depends_on = [google_project_service.apis]
}

resource "google_project_iam_member" "sa_project_roles" {
  for_each = toset(var.sa_project_roles)

  project = var.project_id
  role    = each.key
  member  = "serviceAccount:${google_service_account.github_actions_sa.email}"

  depends_on = [google_service_account.github_actions_sa]
}

resource "google_service_account_iam_member" "allow_github_actions_sa_to_act_as" {
  for_each           = toset(var.sa_permission_to_act_as)
  service_account_id = "projects/${var.project_id}/serviceAccounts/${each.key}"

  role = "roles/iam.serviceAccountUser"

  member = "serviceAccount:${google_service_account.github_actions_sa.email}"
}

resource "google_iam_workload_identity_pool" "github_pool" {
  project                   = var.project_id
  workload_identity_pool_id = var.pool_id
  display_name              = var.pool_display_name
  description               = "Workload Identity Pool for GitHub Actions OIDC (Managed by Terraform)"

  depends_on = [google_project_service.apis]
}

resource "google_iam_workload_identity_pool_provider" "github_provider" {
  project                            = var.project_id
  workload_identity_pool_id          = google_iam_workload_identity_pool.github_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = var.provider_id
  display_name                       = var.provider_display_name
  description                        = "OIDC Provider for GitHub Actions (Managed by Terraform)"

  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.aud"        = "assertion.aud"
    "attribute.repository" = "assertion.repository"
  }

  attribute_condition = "assertion.repository_owner_id == '596977'" # This is the numberic immutable ID of the 'alphagov' GitHub org.

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }

  depends_on = [google_iam_workload_identity_pool.github_pool]
}

resource "google_service_account_iam_member" "allow_impersonation" {
  service_account_id = google_service_account.github_actions_sa.name
  role               = "roles/iam.workloadIdentityUser"

  member = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github_pool.name}/attribute.repository/${var.github_repository}"

  depends_on = [
    google_service_account.github_actions_sa,
    google_iam_workload_identity_pool_provider.github_provider
  ]
}
