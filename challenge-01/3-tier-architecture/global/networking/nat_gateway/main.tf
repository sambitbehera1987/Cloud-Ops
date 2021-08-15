/******************************************
  Resource for External Static IPs
 *****************************************/

resource "google_compute_address" "address" {
  count  = 1
  name   = "cloud-nat-ext-ip-${count.index}"
  region = var.region
}

/******************************************
  Resource for Cloud Router for NAT GW
 *****************************************/

resource "google_compute_router" "router" {
  name    = "${var.vpc_name}-us-ct1-cloud-router"
  region  = var.region
  network = var.vpc_name
}


/******************************************
  Module for NAT Gateway
 *****************************************/

module "cloud_nat" {
  source                             = "../../../modules/networking/nat_gateway"
  
  project_id                         = var.project_id
  region                             = var.region
  router                             = google_compute_router.router.name
  name                               = "${var.vpc_name}-us-ct1-nat"
  nat_ips                            = google_compute_address.address.*.self_link
  min_ports_per_vm                   = "128"
  icmp_idle_timeout_sec              = "15"
  tcp_established_idle_timeout_sec   = "600"
  tcp_transitory_idle_timeout_sec    = "15"
  udp_idle_timeout_sec               = "15"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

