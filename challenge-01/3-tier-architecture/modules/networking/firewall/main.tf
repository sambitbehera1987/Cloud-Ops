
/******************************************
	Firewall Rules
 *****************************************/
resource "google_compute_firewall" "new-firewall" {

  name     = var.name
  network  = var.network
  disabled = var.disabled

  allow {
    protocol = var.protocol
    ports    = var.ports
  }

  target_tags   = var.target_tags
  source_ranges = var.source_ranges
  source_tags   = var.source_tags

}
