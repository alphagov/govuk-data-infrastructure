# Data Engineer custom role
module "data_engineer_custom_role" {
  source = "../modules/gds-data-eng-role"

  project_id = module.managed_project.project.project_id
}
