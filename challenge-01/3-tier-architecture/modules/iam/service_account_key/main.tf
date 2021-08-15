
resource "google_service_account_key" "my_key" {
  service_account_id = var.service_account
}

resource "local_file" "myaccount_json" {
    content     = base64decode(google_service_account_key.my_key.private_key)
    filename    = var.file_path
}