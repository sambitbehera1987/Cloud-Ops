output "reserved_range_name" {
  description = "The Global Address resource name"
  value       = module.private-service-access.google_compute_global_address_name
}

output "reserved_range_address" {
  description = "The Global Address resource name"
  value       = module.private-service-access.address
}

output "instance_name" {
  description = "The name of CloudSQL instance"
  value = var.instance_name
}
