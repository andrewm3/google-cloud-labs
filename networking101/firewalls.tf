# firewalls.tf

resource "google_compute_firewall" "internal" {
  name    = "${var.network}-firewall-allow-internal"
  network = "${var.network}"

  source_ranges = ["10.0.0.0/8"]

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"],
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"],
  }
}

resource "google_compute_firewall" "ssh" {
  name    = "${var.network}-firewall-allow-ssh"
  network = "${var.network}"

  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["22"],
  }
}

resource "google_compute_firewall" "icmp" {
  name    = "${var.network}-firewall-allow-icmp"
  network = "${var.network}"

  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "icmp"
  }
}
