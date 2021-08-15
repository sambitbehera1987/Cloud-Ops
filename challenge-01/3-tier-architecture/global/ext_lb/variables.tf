variable "project_id" {
  description = "The ID of the project where this VPC will be created"
}

variable "service_port" {
  description = "The port for the backends"
}

variable "service_port_name" {
  description = "The name of the service port"
}

variable "managed_ssl_certificate_domains" {
  description = "The Name of the domain for managed SSL certificate"
}
