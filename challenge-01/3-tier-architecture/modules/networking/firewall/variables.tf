variable "network" {
  description = "The name or self_link of the network to attach this firewall to."
}

variable "name" {
  description = "Name of the resource."
}

variable "disabled" {
  description = "Name of the resource."
  type        = bool
  default     = false
}

variable "protocol" {
  description = "The IP protocol to which this rule applies."
}

variable "ports" {
  description = "An optional list of ports to which this rule applies."
}

variable "source_ranges" {
  description = "A list of instance tags indicating sets of instances located in the network that may make network connections as specified in allowed[]."
}

variable "source_tags" {
  description = "If source tags are specified, the firewall will apply only to traffic with source IP that belongs to a tag listed in source tags."
}

variable "target_tags" {
  description = "A list of instance tags indicating sets of instances located in the network that may make network connections as specified in allowed[]. "
}
