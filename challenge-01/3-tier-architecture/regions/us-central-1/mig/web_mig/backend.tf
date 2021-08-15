terraform {
  backend "gcs" {
    bucket = "tfstate-us-gcs"
    prefix = "regions/us-central1/mig/web_mig"
  }
}
