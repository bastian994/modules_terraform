### Creación de red privada ###
resource "google_compute_network" "vpc_network" {
  name = "${var.name_network}"
  auto_create_subnetworks = "${var.auto_create_subnetworks}"
}

