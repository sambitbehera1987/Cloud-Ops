
/******************************************
  Module for service_account_app
 *****************************************/

module "custom_role_app" {
  source                    = "../../../modules/iam/custom_role/"
  project                   = var.project_id
  role_id                   = var.service_account_app["role_name"]
  permissions               = var.service_account_app["permissions"]
}

module "service_account_app" {
  source                = "../../../modules/iam/service_account"
  project_id            = var.project_id
  service_account_name  = var.service_account_app["service_account"]
}

module "member_roles_app" {
  source                      = "../../../modules/iam/member_iam"
  service_account_address     = module.service_account_app.email
  project_id                  = var.project_id
  project_roles               = ["projects/${var.project_id}/roles/${var.service_account_app["role_name"]}"]
}



/******************************************
  Module service_account_web
 *****************************************/
module "custom_role_web" {
  source                    = "../../../modules/iam/custom_role/"
  project                   = var.project_id
  role_id                   = var.service_account_web["role_name"]
  permissions               = var.service_account_web["permissions"]
}

module "service_account_web" {
  source                = "../../../modules/iam/service_account"
  project_id            = var.project_id
  service_account_name  = var.service_account_web["service_account"]
}

module "member_roles_web" {
  source                      = "../../../modules/iam/member_iam"
  service_account_address     = module.service_account_web.email
  project_id                  = var.project_id
  project_roles               = ["projects/${var.project_id}/roles/${var.service_account_web["role_name"]}"]

}

