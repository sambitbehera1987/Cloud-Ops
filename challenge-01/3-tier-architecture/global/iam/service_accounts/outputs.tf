# /******************************************
#   Outputs of service_account and role binding for app group
#  *****************************************/

output "app_group_email" {
  value = module.service_account_app.email
}

/******************************************
  Outputs of service_account and role binding for web group
 *****************************************/

output "web_group_email" {
  value = module.service_account_web.email
}


