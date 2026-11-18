output "role_name" {
  description = "Full resource name of the GDS Data Engineer custom role"
  value       = google_project_iam_custom_role.data_engineer.name
}