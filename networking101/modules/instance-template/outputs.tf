# outputs.tf

output "self_link" {
  value = "${google_compute_instance_template.default.self_link}"
}
