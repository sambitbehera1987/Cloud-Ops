output "fw_id" {
  description = "The URI of the created resource"
  value       = "${google_compute_firewall.new-firewall.id}"
}
