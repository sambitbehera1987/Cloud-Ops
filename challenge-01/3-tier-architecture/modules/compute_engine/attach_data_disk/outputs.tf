output "gce_disk_id" {
  value       = google_compute_disk.gce_disk.id
  description = "GCE disk id"
}
output "gce_disk_name" {
  value       = google_compute_disk.gce_disk.name
  description = "GCE disk name"
}