# main.tf

locals {
  subnetwork_count = "${length(var.subnetworks)}"
}

resource "google_compute_network" "default" {
  name                    = "${var.name}"
  auto_create_subnetworks = "${local.subnetwork_count > 0 ? false : true}"
}

resource "google_compute_subnetwork" "default" {
  count         = "${local.subnetwork_count}"
  name          = "${lookup(var.subnetworks[count.index], "name")}"
  ip_cidr_range = "${lookup(var.subnetworks[count.index], "ip_cidr_range")}"
  region        = "${lookup(var.subnetworks[count.index], "region")}"
  network       = "${google_compute_network.default.self_link}"
}
