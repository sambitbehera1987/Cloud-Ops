/******************************************
  FW Module to access VMs by SSH via IAP tunneling.
 *****************************************/
module "test-vpc-allow-iap-fw-rule" {
  source = "../../../modules/networking/firewall"

  network       = var.vpc_name
  name          = "test-vpc-allow-iap-fw-rule"
  protocol      = "tcp"
  ports         = ["22"]
  source_ranges = ["35.235.240.0/20"] # Google IAP access range
  source_tags   = []
  target_tags   = ["allow-iap"] 
}


# /******************************************
#   FW Module for web server access to app server
#  *****************************************/
module "test-vpc-allow-web-fw-rule" {
  source = "../../../modules/networking/firewall"

  network       = var.vpc_name
  name          = "test-vpc-allow-web-fw-rule"
  protocol      = "tcp"
  ports         = ["80"]
  source_ranges = [""]   //internal loadbalancer ip
  source_tags   = []
  target_tags   = ["allow-web"]
}


/******************************************
  FW Module for Google LB Healthcheck access
 *****************************************/
module "test-vpc-allow-google-hc-fw-rule" {
  source                    = "../../../modules/networking/firewall"
  
  network                   = var.vpc_name
  name                      = "test-vpc-allow-google-hc-fw-rule"
  protocol                  = "tcp"
  ports                     = ["80", "22", "443"]
  source_ranges             = ["35.191.0.0/16","130.211.0.0/22","209.85.152.0/22","209.85.204.0/22", "34.102.252.159/32"] # Google LB healthcheck probe ranges
  source_tags               = []
  target_tags               = ["allow-hc"]
}

