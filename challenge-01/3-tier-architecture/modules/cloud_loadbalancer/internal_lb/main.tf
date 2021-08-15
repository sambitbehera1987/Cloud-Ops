/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

# The forwarding rule resource needs the self_link but the firewall rules only need the name.
# Using a data source here to access both self_link and name by looking up the network name.



resource "google_compute_forwarding_rule" "default" {
  project               = var.project
  name                  = "${var.name}-frontend"
  region                = var.region
  network               = var.network
  subnetwork            = var.subnetwork
  allow_global_access   = var.global_access
  load_balancing_scheme = "INTERNAL"
  backend_service       = google_compute_region_backend_service.default.self_link
  ip_address            = google_compute_address.ip_address.address
  ip_protocol           = var.ip_protocol
  ports                 = var.ports
  all_ports             = var.all_ports
  service_label         = var.service_label
}

resource "google_compute_region_backend_service" "default" {
  project          = var.project
  name             = var.name
  region           = var.region
  protocol         = var.ip_protocol
  timeout_sec      = 30
  connection_draining_timeout_sec = 300
  session_affinity = var.session_affinity
  dynamic "backend" {
    for_each = var.backends
    content {
      group       = lookup(backend.value, "group", null)
      description = lookup(backend.value, "description", null)
      balancing_mode = lookup(backend.value, "balancing_mode", null)
    }
  }
  
  health_checks = [var.health_check["type"] == "tcp" ? google_compute_health_check.tcp[0].self_link : google_compute_health_check.http[0].self_link]
}

resource "google_compute_health_check" "tcp" {
  count   = var.health_check["type"] == "tcp" ? 1 : 0
  project = var.project
  name    = "${var.name}-hc"


  timeout_sec         = var.health_check["timeout_sec"]
  check_interval_sec  = var.health_check["check_interval_sec"]
  healthy_threshold   = var.health_check["healthy_threshold"]
  unhealthy_threshold = var.health_check["unhealthy_threshold"]

  tcp_health_check {
    port         = var.health_check["port"]
    request      = var.health_check["request"]
    response     = var.health_check["response"]
    port_name    = var.health_check["port_name"]
    proxy_header = var.health_check["proxy_header"]
  }
}

resource "google_compute_health_check" "http" {
  count   = var.health_check["type"] == "http" ? 1 : 0
  project = var.project
  name    = "${var.name}-hc-http"

  timeout_sec         = var.health_check["timeout_sec"]
  check_interval_sec  = var.health_check["check_interval_sec"]
  healthy_threshold   = var.health_check["healthy_threshold"]
  unhealthy_threshold = var.health_check["unhealthy_threshold"]

  http_health_check {
    port         = var.health_check["port"]
    request_path = var.health_check["request_path"]
    host         = var.health_check["host"]
    response     = var.health_check["response"]
    port_name    = var.health_check["port_name"]
    proxy_header = var.health_check["proxy_header"]
  }
}


resource "google_compute_address" "ip_address" {
  project      = var.project
  name         = "${var.name}-ip"
  region       = var.region
  subnetwork   = var.subnetwork
  address_type = "INTERNAL"
  description  =  "Reserved internal IP"
}