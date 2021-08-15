terraform {
  backend "gcs" {
    bucket = "tfstate-us-gcs"
    prefix = "global/ext_lb"
  }
}