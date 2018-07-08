# main.tf

module "w1-vm" {
  name         = "w1-vm"
  source       = "modules/compute"
  machine_type = "n1-standard-1"
  zone         = "us-west1-b"
  network      = "${var.network}"
  subnetwork   = "us-west1-s1"
}

module "w2-vm" {
  name         = "w2-vm"
  source       = "modules/compute"
  machine_type = "n1-standard-1"
  zone         = "us-west1-b"
  network      = "${var.network}"
  subnetwork   = "us-west1-s2"
  ip           = "10.11.0.100"
}

module "e1-vm" {
  name         = "e1-vm"
  source       = "modules/compute"
  machine_type = "n1-standard-1"
  zone         = "us-east1-b"
  network      = "${var.network}"
  subnetwork   = "us-east1"
}

module "eu1-vm" {
  name         = "eu1-vm"
  source       = "modules/compute"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-d"
  network      = "${var.network}"
  subnetwork   = "europe-west1"
}

module "asia1-vm" {
  name         = "asia1-vm"
  source       = "modules/compute"
  machine_type = "n1-standard-1"
  zone         = "asia-east1-b"
  network      = "${var.network}"
  subnetwork   = "asia-east1"
}
