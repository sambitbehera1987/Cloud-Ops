############################
# Create compute engine disk
############################
resource "google_compute_disk" "gce_disk" {
  name = var.data_disk_info["disk_name"]
  size = var.data_disk_info["disk_size_gb"]
  type = var.data_disk_info["disk_type"]
  zone = var.machine_zone

  labels = merge(
    var.disk_labels,
    map(
      "type", "data",
    )
  )
  physical_block_size_bytes = 4096
  lifecycle {
    prevent_destroy = false
  }
}
#####################################
# Google Compute VM & Data Disk Attachment
#####################################
resource "google_compute_attached_disk" "gce_disk_attach" {
  disk     = google_compute_disk.gce_disk.id
  instance = var.compute_instance_id
}

###############################################
# Snapshot Policy Attachment for Attached Disks
###############################################
resource "google_compute_disk_resource_policy_attachment" "data_disk_policy_attach" {
  name = var.snapshot_policy_name
  disk = google_compute_disk.gce_disk.name
  zone = var.machine_zone
}
