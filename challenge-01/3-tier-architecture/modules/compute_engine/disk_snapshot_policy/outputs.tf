output "self_link" {
  value       = google_compute_resource_policy.snapshot_policy.self_link
  description = "policy self link"
}

output "policy_name" {
  value       = var.policy_name
  description = "policy self link"
}
