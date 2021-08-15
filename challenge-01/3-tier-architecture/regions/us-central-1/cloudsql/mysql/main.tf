module "private-service-access" {
  source      = "../../../../modules/networking/private_service_access"
  project_id  = var.project_id
  vpc_network = var.vpc_network
}

module "mysql" {
  source           = "../../../../modules/cloudsql/mysql"
  name             = var.instance_name
  project_id       = var.project_id
  database_version = "MYSQL_5_7"
  region           = var.region

  // Master configurations
  tier                            = var.instance_type
  zone                            = var.instance_primary_zone
  availability_type               = var.availability_type
  disk_size                       = var.disk_size
  disk_type                       = var.disk_type
  maintenance_window_day          = 7
  maintenance_window_hour         = 12
  maintenance_window_update_track = "stable"


  user_labels = var.user_labels

  ip_configuration      = {
    ipv4_enabled        = false
    require_ssl         = true
    private_network     = "projects/playground/global/networks/test-vpc"
    authorized_networks = []
  }

  backup_configuration = {
    enabled            = true
    binary_log_enabled = true
    start_time         = "00:00"
  }

  user_name     = var.root_user
  user_password = var.root_password

  additional_users = var.additional_users
}
