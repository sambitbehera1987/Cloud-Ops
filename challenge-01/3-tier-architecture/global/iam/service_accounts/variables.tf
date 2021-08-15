/******************************************
  service_account variables
 *****************************************/
variable "project_id" {
  description = "The GCP project ID"
}

variable "region" {
  description = "The GCP region of the deployment."
}

variable "service_account_app" {
  description = "service Account to add the IAM policies/bindings for app servers"
}

variable "service_account_web" {
  description = "service Account to add the IAM policies/bindings for web servers"
}



