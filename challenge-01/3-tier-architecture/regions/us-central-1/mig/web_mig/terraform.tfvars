project_id = "playground"
region     = "us-central1"
distribution_policy_zones = ["us-central1-a", "us-central1-b"]
network    =  "test-vpc"
subnetwork = "web-subnet"

source_image = 	"custom-image-web-01"

  
disk_size_gb = "30"
disk_type = "pd-standard"


machine_type = "custom-2-8192"

instance_labels = {
  environment = "test"
  purpose = "web"
}

#Access scopes 
service_account = {
  email  = "web-sa@playground.iam.gserviceaccount.com"
  scopes = ["cloud-platform"]
}

autoscaling_enabled = "true"
max_replicas = "3"
min_replicas = "2"


