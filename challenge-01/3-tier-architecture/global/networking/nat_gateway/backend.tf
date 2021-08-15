
terraform {
  backend "gcs" {
    bucket = "tfstate-us-gcs"
    prefix = "global/networking/nat_gateway"
  }
}
