# Google Cloud Storage location https://cloud.google.com/storage/docs/locations
locals {
  services = [
    "storage.googleapis.com",
    "iam.googleapis.com",
    "pubsub.googleapis.com",
    "sourcerepo.googleapis.com",
    "storagetransfer.googleapis.com"
  ]
}

resource "google_project_service" "services" {
  for_each = toset(local.services)

  service                    = each.key
  disable_dependent_services = false
  disable_on_destroy         = false

}
