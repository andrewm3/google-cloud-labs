# main.tf

resource "google_compute_instance_template" "default" {
  name         = "${var.name}"
  machine_type = "n1-standard-1"
  region       = "${var.region}"

  tags = ["http-server"]

  disk {
    source_image = "debian-cloud/debian-9"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network    = "${var.subnetwork == "" ? var.network : "" }"
    subnetwork = "${var.subnetwork}"
  }

  metadata {
    startup-script-url = "gs://networking101-lab/startup.sh"
  }
}
