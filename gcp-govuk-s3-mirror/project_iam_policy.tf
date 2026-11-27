resource "google_project_iam_policy" "project" {
  project     = module.managed_project.project.project_id
  policy_data = data.google_iam_policy.project.policy_data
}

data "google_iam_policy" "project" {
  binding {
    role = "roles/compute.serviceAgent"
    members = [
      "serviceAccount:service-384988117066@compute-system.iam.gserviceaccount.com",
    ]
  }

  binding {
    role = "roles/pubsub.serviceAgent"
    members = [
      "serviceAccount:service-384988117066@gcp-sa-pubsub.iam.gserviceaccount.com",
    ]
  }
}
