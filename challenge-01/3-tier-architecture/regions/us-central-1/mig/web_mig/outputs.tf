/**
 * Copyright 2018 Google LLC
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

# output "self_link_proxy-sql_mig_01" {
#   description = "Self-link of the managed instance group"
#   value       = module.proxy-sql_mig_01.self_link
# }

output "instance_group" {
  description = "The name of the instance group"
  value = module.web_mig.instance_group
}


output "region" {
  description = "The GCP region to create resources in"
  value       = var.region
}