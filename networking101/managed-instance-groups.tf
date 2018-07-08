# managed-instance-groups.tf

#
# us-east1
#
module "us-east1-template" {
  name       = "us-east1-template"
  source     = "modules/instance-template"
  region     = "us-east1"
  subnetwork = "us-east1"
}

resource "google_compute_target_pool" "us-east1-mig-pool" {
  name   = "us-east1-mig-pool"
  region = "us-east1"
}

resource "google_compute_region_instance_group_manager" "us-east1-mig" {
  name   = "us-east1-mig"
  region = "us-east1"

  base_instance_name = "us-east1-mig"
  instance_template  = "${module.us-east1-template.self_link}"
  target_pools       = ["${google_compute_target_pool.us-east1-mig-pool.self_link}"]
}

resource "google_compute_region_autoscaler" "us-east1" {
  name   = "us-east1"
  region = "us-east1"
  target = "${google_compute_region_instance_group_manager.us-east1-mig.self_link}"

  autoscaling_policy = {
    max_replicas    = 4
    min_replicas    = 1
    cooldown_period = 45

    load_balancing_utilization {
      target = 0.8
    }
  }
}

#
# europe-west1
#
module "europe-west1-template" {
  name       = "europe-west1-template"
  source     = "modules/instance-template"
  region     = "europe-west1"
  subnetwork = "europe-west1"
}

resource "google_compute_target_pool" "europe-west1-mig-pool" {
  name   = "europe-west1-mig-pool"
  region = "europe-west1"
}

resource "google_compute_region_instance_group_manager" "europe-west1-mig" {
  name   = "europe-west1-mig"
  region = "europe-west1"

  base_instance_name = "europe-west1-mig"
  instance_template  = "${module.europe-west1-template.self_link}"
  target_pools       = ["${google_compute_target_pool.europe-west1-mig-pool.self_link}"]
  target_size        = 3
}
