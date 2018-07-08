# networking.tf

module "network" {
  source      = "modules/network"
  name        = "${var.network}"
  subnetworks = [
    {
      name          = "us-west1-s1"
      ip_cidr_range = "10.10.0.0/16"
      region        = "us-west1"
    },
    {
      name          = "us-west1-s2"
      ip_cidr_range = "10.11.0.0/16"
      region        = "us-west1"
    },
    {
      name          = "us-east1"
      ip_cidr_range = "10.20.0.0/16"
      region        = "us-east1"
    },
    {
      name          = "europe-west1"
      ip_cidr_range = "10.30.0.0/16"
      region        = "europe-west1"
    },
    {
      name          = "asia-east1"
      ip_cidr_range = "10.40.0.0/16"
      region        = "asia-east1"
    },
  ]
}
