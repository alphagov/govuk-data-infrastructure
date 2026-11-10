resource "google_project_iam_custom_role" "code_viewer" {
  description = "Permissions to read code but restricted from viewing BigQuery data"
  permissions = [
    // These permissions are equivalent to https://docs.cloud.google.com/iam/docs/roles-permissions/dataform#dataform.codeViewer
    "dataform.commentThreads.get",
    "dataform.commentThreads.list",
    "dataform.comments.get",
    "dataform.comments.list",
    "dataform.compilationResults.get",
    "dataform.compilationResults.create",
    "dataform.compilationResults.list",
    "dataform.compilationResults.query",
    "dataform.config.get",
    "dataform.folders.get",
    "dataform.folders.getIamPolicy",
    "dataform.folders.queryContents",
    "dataform.locations.get",
    "dataform.locations.list",
    "dataform.operations.get",
    "dataform.operations.list",
    "dataform.releaseConfigs.get",
    "dataform.releaseConfigs.list",
    "dataform.repositories.computeAccessTokenStatus",
    "dataform.repositories.fetchHistory",
    "dataform.repositories.fetchRemoteBranches",
    "dataform.repositories.get",
    "dataform.repositories.getIamPolicy",
    "dataform.repositories.list",
    "dataform.repositories.queryDirectoryContents",
    "dataform.repositories.readFile",
    "dataform.teamFolders.get",
    "dataform.teamFolders.getIamPolicy",
    "dataform.workflowConfigs.get",
    "dataform.workflowConfigs.list",
    "dataform.workflowInvocations.get",
    "dataform.workflowInvocations.list",
    "dataform.workflowInvocations.query",
    "dataform.workspaces.fetchFileDiff",
    "dataform.workspaces.fetchFileGitStatuses",
    "dataform.workspaces.fetchGitAheadBehind",
    "dataform.workspaces.get",
    "dataform.workspaces.getIamPolicy",
    "dataform.workspaces.list",
    "dataform.workspaces.queryDirectoryContents",
    "dataform.workspaces.readFile",
    "dataform.workspaces.searchFiles",
  ]
  role_id = "code_viewer"
  title   = "Code Viewer"
}


# Data Engineer custom role
resource "google_project_iam_custom_role" "data_engineer" {
  role_id     = "dataEngineer"
  title       = "Data Engineer"
  description = "Provides Data Engineers with the permissions required to develop, deploy and maintain data pipelines and supporting GCP resources."

  permissions = [
    # BigQuery
    "roles/bigquery.dataEditor",
    "roles/bigquery.jobUser",
    "roles/bigquery.resourceViewer",
    "bigquery.datasets.getIamPolicy",
    "bigquery.datasets.setIamPolicy",

    # Dataform
    "roles/dataform.admin",
    "roles/iam.serviceAccountUser",

    # Cloud Storage
    "storage.buckets.create",
    "storage.buckets.delete",
    "storage.buckets.get",
    "storage.buckets.list",
    "storage.buckets.update",
    "storage.buckets.getIamPolicy",
    "storage.buckets.setIamPolicy",
    "storage.objects.get",
    "storage.objects.list",
    "storage.objects.create",
    "storage.objects.update",
    "storage.objects.delete",

    # Cloud Run
    "roles/run.admin",
    "roles/run.admin",
    "roles/run.admin",
    "roles/run.admin",
    "roles/run.admin",
    "roles/iam.serviceAccountUser",

    # Monitoring
    "roles/monitoring.admin",

    # IAM / Service Accounts
    "roles/iam.serviceAccountAdmin",
    "roles/iam.serviceAccountUser",
    "roles/iam.serviceAccountAdmin",
  ]
}