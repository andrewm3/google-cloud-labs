# main.tf

resource "google_compute_instance" "default" {
  name         = "${var.name}"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-8"
    }
  }

  network_interface {
    network    = "${var.subnetwork == "" ? var.network : ""}"
    subnetwork = "${var.subnetwork}"

    address = "${var.ip}"

    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = <<EOF
#!/bin/bash
apt-get -y update
apt-get -y install traceroute mtr tcpdump iperf whois host dnsutils siege
EOF
}
