/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "project_id" {
  type        = string
  description = "The project to setup cloudsql mysql on"
}

variable "vpc_network" {
  description = "Name of the VPC network to peer."
  type        = string
}

variable "region" {
  type        = string
  description = "The region to setup cloudsql mysql in"
}

variable "instance_name" {
  type        = string
  description = "The name of the cloudsql mysql instance"
}

variable "instance_type" {
  type        = string
  description = "The type of the cloudsql mysql instance"
}

variable "instance_primary_zone" {
  type        = string
  description = "The primary zone of the cloudsql mysql instance. (a,b,c)"
}

variable "availability_type" {
  type        = string
  description = "The availability_type of the cloudsql mysql instance. REGIONAL or ZONAL"
}

variable "disk_size" {
  description = "The disk size for the master instance"
  type        = number
  default     = 10
}

variable "disk_type" {
  description = "The disk type for the master instance."
  type        = string
  default     = "PD_SSD"
}

variable "user_labels" {
  type        = map
  description = "The user_labels of the cloudsql mysql instance."
}

variable "root_user" {
  type        = string
  description = "The root user of the cloudsql mysql instance."
  default     = "root"
}

variable "root_password" {
  type        = string
  description = "The root password of the cloudsql mysql instance."
  default     = "password"
}

variable "additional_users" {
  description = "The users apart from root of the cloudsql mysql instance."
}