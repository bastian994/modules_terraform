resource "google_compute_subnetwork" "vpc_network" {
  name          = "${var.name_subnet}"
  ip_cidr_range = "${var.ip_cidr_range}"
  region        = "${var.zona_subnetwork}"
  network       = "${var.network}"
}