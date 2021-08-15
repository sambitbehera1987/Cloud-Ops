project_id = "playground"
region     = "us-central1"

service_account_app = {
  service_account = "app-sa"
  role_name       = "app_role"
  permissions = [
    "logging.logEntries.create",
    "monitoring.metricDescriptors.create",
    "monitoring.metricDescriptors.get",
    "monitoring.metricDescriptors.list",
    "monitoring.monitoredResourceDescriptors.get",
    "monitoring.monitoredResourceDescriptors.list",
    "monitoring.timeSeries.create"
  ]
}


service_account_web = {
  service_account = "web-sa"
  role_name       = "web_role"
  permissions = [
    "logging.logEntries.create",
    "monitoring.metricDescriptors.create",
    "monitoring.metricDescriptors.get",
    "monitoring.metricDescriptors.list",
    "monitoring.monitoredResourceDescriptors.get",
    "monitoring.monitoredResourceDescriptors.list",
    "monitoring.timeSeries.create"
  ]
}

