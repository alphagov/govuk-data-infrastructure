locals {
  members = [
    "serviceAccount:scheduled-query-runner@gds-bq-reporting.iam.gserviceaccount.com",
  ]
}

resource "google_bigquery_dataset_iam_member" "ga4_reader" {
  for_each   = toset(local.members)
  dataset_id = "ga4"
  role       = "roles/bigquery.dataViewer"
  member     = each.key
}
