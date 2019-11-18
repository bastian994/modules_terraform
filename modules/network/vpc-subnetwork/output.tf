output "gateway_address" {
  value       = "${google_compute_subnetwork.vpc_network.gateway_address}"
  description = "The IP address of the gateway."
}

output "self_link" {
  value       = "${google_compute_subnetwork.vpc_network.self_link}"
  description = "The URL of the created resource"
}
output "name" {
  value       = "${google_compute_subnetwork.vpc_network.name}"
  description = "The unique name of the subnetwork"
}