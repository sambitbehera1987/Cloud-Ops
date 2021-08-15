module "app-int-lb" {
  source       = "../../../modules/cloud_loadbalancer/internal_lb"
  region       = var.region
  name         = "app-internal-lb"
  network               = var.network
  subnetwork            = var.subnetwork
  ports        = ["80"]
  health_check = var.health_check

  backends =  [{
      group = "https://www.googleapis.com/compute/v1/projects/playground/regions/us-central1/instanceGroups/app-mig",
      description = null,
      balancing_mode   = "CONNECTION",
  }
  ]
}


