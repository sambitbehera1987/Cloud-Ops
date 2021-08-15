/* GLOBAL */
project_id = "playground"
vpc_name   = "test-vpc"

/* Subnets */
subnets = [
  {
    subnet_name           = "web-subnet"
    subnet_ip             = "192.168.1.0/24"
    subnet_region         = "us-central1"
    subnet_private_access = "true"
    subnet_flow_logs      = "false"
  },
  {
    subnet_name           = "app-subnet"
    subnet_ip             = "192.168.2.0/24"
    subnet_region         = "us-central1"
    subnet_private_access = "true"
    subnet_flow_logs      = "false"
  }
]

