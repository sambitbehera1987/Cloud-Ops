terraform {
  backend "gcs" {
    bucket = "tfstate-us-gcs"
    prefix = "global/networking/vpc_subnets"
  }
}
