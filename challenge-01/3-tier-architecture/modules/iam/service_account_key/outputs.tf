output "name" {
  value = google_service_account_key.my_key.name
}

output "file_path" {
  value = local_file.myaccount_json.filename
}
