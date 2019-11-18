#### Rule Firewall ### 
resource "google_compute_firewall" "allow-tag-ssh" {
  count         = "${length(var.port_firewall_rule)}"
  name          = "${var.name_firewall_rule}"
  description   = "${var.description_firewall_rule}"
  network       = "${var.vpc}"
  
  allow {
    protocol = "${var.protocol_firewall_rule}"
    ports    = ["${lookup(var.port_firewall_rule[count.index], "ssh")}","${lookup(var.port_firewall_rule[count.index], "kiali")}"]
  }
#  allow {
#    protocol = "udp"
#    ports    = ["139"]
#  }
}
