resource "google_storage_bucket" "backend" {
  name                        = "govuk-s3-mirror-tfstate" # Must be globally unique
  force_destroy               = false                     # terraform won't delete the bucket unless it is empty
  location                    = "EUROPE-WEST2"
  storage_class               = "STANDARD" # https://cloud.google.com/storage/docs/storage-classes
  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
}

resource "google_storage_bucket_iam_policy" "backend" {
  bucket      = google_storage_bucket.backend.name
  policy_data = data.google_iam_policy.bucket_backend.policy_data
}

data "google_iam_policy" "bucket_backend" {
  binding {
    role = "roles/storage.legacyBucketOwner"
    members = [
      "projectEditor:govuk-s3-mirror",
      "projectOwner:govuk-s3-mirror",
    ]
  }

  binding {
    role = "roles/storage.legacyBucketReader"
    members = [
      "projectViewer:govuk-s3-mirror",
    ]
  }

  binding {
    role = "roles/storage.legacyObjectOwner"
    members = [
      "projectEditor:govuk-s3-mirror",
      "projectOwner:govuk-s3-mirror",
    ]
  }

  binding {
    role = "roles/storage.legacyObjectReader"
    members = [
      "projectViewer:govuk-s3-mirror",
    ]
  }
}
