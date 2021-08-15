
module "instance_template_web" {
  source                  = "../../../../modules/instance_template"
  project_id              = var.project_id
  network                 = var.network
  subnetwork              = var.subnetwork
  subnetwork_project      = var.project_id
  source_image       = var.source_image
  source_image_project = var.project_id
  disk_size_gb            = var.disk_size_gb        //auto_delete boot disk is true
  disk_type               = var.disk_type
  additional_disks        = var.additional_disks    //if additional disk required
  name_prefix             = "web-vm"
  machine_type            = var.machine_type
  labels                  = merge(
                              var.instance_labels,
                              tomap({
                                "group": "web"}
                                 )
                              )
  tags                    = ["allow-iap","allow-hc"]
  region                  = var.region
  service_account         = var.service_account
  preemptible             = false                   
  metadata = {
    
  }
  
}

module "web_mig" {
  source                    = "../../../../modules/mig"
  project_id                = var.project_id
  region                    = var.region
  distribution_policy_zones = var.distribution_policy_zones
  hostname                  = "web"
  instance_template         = module.instance_template_web.self_link
  autoscaling_enabled       = var.autoscaling_enabled
  max_replicas              = var.max_replicas
  min_replicas              = var.min_replicas
  cooldown_period           = 60
  autoscaling_cpu           = var.autoscaling_cpu
  autoscaling_metric        = var.autoscaling_metric
  named_ports               = var.named_ports
  health_check              = var.health_check
}

