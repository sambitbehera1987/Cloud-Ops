project_id              = "playground"
vpc_network             = "test-vpc"
region                  = "us-central1"
instance_name           = "mysql-instance"
instance_type           = "db-custom-1-3840"
instance_primary_zone   = "a"
availability_type       = "REGIONAL"


user_labels = {
  purpose = "app"
}

root_user = ""     # Root User
root_password = ""   # Password (removed from tf file, since it is going to be in source control)

additional_users = []