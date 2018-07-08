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

#
# europe-west1
#
module "europe-west1-template" {
  name       = "europe-west1-template"
  source     = "modules/instance-template"
  region     = "europe-west1"
  subnetwork = "europe-west1"
}
