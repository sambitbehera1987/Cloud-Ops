/******************************************
	GCP HTTP LB
 *****************************************/
 module "http_lb" {
  source       = "../../modules/cloud_loadbalancer/https_lb"

  name              = "web-external-lb"
  project           = var.project_id
  target_tags       = []
  ssl = true
  create_address = true
  managed_ssl_certificate_domains = var.managed_ssl_certificate_domains


 backends = {
    default = {
      name = "web-external-lb-backend"
      description                     = null
      protocol                        = "HTTP"
      port                            = var.service_port
      port_name                       = var.service_port_name
      timeout_sec                     = 7200
      enable_cdn                      = false
      custom_request_headers          = []
      security_policy                 = null

      connection_draining_timeout_sec = 300
      session_affinity                = "GENERATED_COOKIE"
      affinity_cookie_ttl_sec         = 0

      health_check = {
        name = "web-external-lb-hc"
        protocol = "TCP"
        check_interval_sec  = 5
        timeout_sec         = 5
        healthy_threshold   = 2
        unhealthy_threshold = 2
        port                = var.service_port
        host                = null
        logging             = null
      }


      log_config = {
        enable = true
        sample_rate = 1.0
      }

      groups = [
        {
          group                        = "https://www.googleapis.com/compute/v1/projects/playground/regions/us-central1/instanceGroups/web-mig"
          balancing_mode               = "UTILIZATION"
          capacity_scaler              = 1
          description                  = null
          max_connections              = 0
          max_connections_per_instance = 0
          max_connections_per_endpoint = 0
          max_rate                     = 0
          max_rate_per_instance        = 0
          max_rate_per_endpoint        = 0
          max_utilization              = 0.8
        },
      ]

      
    }
  }
}
