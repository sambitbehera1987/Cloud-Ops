
terraform {
  backend "gcs" {
    bucket = "tfstate-us-gcs"
    prefix = "global/networking/firewall_rules"
  }
}
