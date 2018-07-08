# load-balancer.tf

resource "google_compute_global_forwarding_rule" "my-gclb" {
  name       = "my-gclb"
  target     = "${google_compute_target_http_proxy.my-gclb.self_link}"
  ip_address = "${google_compute_global_address.my-gclb.address}"
  port_range = "80"
}

resource "google_compute_global_address" "my-gclb" {
  name = "my-gclb"
}

resource "google_compute_target_http_proxy" "my-gclb" {
  name        = "my-gclb"
  url_map     = "${google_compute_url_map.my-gclb.self_link}"
}

resource "google_compute_url_map" "my-gclb" {
  name            = "my-gclb"
  default_service = "${google_compute_backend_service.my-gclb.self_link}"
}

resource "google_compute_backend_service" "my-gclb" {
  name        = "my-backend-service"
  port_name   = "http"
  protocol    = "HTTP"
  timeout_sec = 30
  enable_cdn  = false

  backend {
    group = "${google_compute_region_instance_group_manager.us-east1-mig.instance_group}"

    balancing_mode        = "RATE"
    max_rate_per_instance = 50
  }

  backend {
    group = "${google_compute_region_instance_group_manager.europe-west1-mig.instance_group}"
  }

  health_checks = ["${google_compute_health_check.my-gclb.self_link}"]
}

resource "google_compute_health_check" "my-gclb" {
  name = "my-http-hc"

  http_health_check {
    // defaults
  }
}
