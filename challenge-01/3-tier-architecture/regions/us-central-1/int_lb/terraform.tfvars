region = "us-central1"
project_id = "playground"
network = "test-vpc"
subnetwork = "app-subnet"


 health_check = ({
    type                = "tcp"
    check_interval_sec  = 10
    healthy_threshold   = 2
    timeout_sec         = 5
    unhealthy_threshold = 3
    response            = ""
    proxy_header        = "NONE"
    port                = 80
    port_name           = ""
    request             = ""
    request_path        = ""
    host                = ""
  })