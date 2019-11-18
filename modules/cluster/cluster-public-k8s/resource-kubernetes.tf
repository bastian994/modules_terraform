#data "google_container_registry_repository" "registry" {
#    region = ${var.region_container_registry}
#}

resource "google_container_cluster" "gke-cluster" {
  name                      = "${var.name_cluster}"
  network                   = "${var.vpc}"
  zone                      = "${var.zone_cluster}"
  initial_node_count        = "${var.node_count}"
  remove_default_node_pool  = true
  subnetwork                = "${var.subnetwork}"
}

resource "google_container_node_pool" "node_pool_regional" {
  count              = "${length(var.node_pools)}"
  name               = "${lookup(var.node_pools[count.index], "name_node_pool")}"
  location           = "${var.zone_cluster}"
  cluster            = "${var.name_cluster}"
  initial_node_count = "${lookup(var.node_pools[count.index], "initial_node_count")}"
  
  autoscaling {
    min_node_count = "${lookup(var.node_pools[count.index], "min_node_count",1)}"
    max_node_count = "${lookup(var.node_pools[count.index], "max_node_count",3)}"
  }

  node_config {
    oauth_scopes = "${var.node_pools_scopes}"
    preemptible  = "${lookup(var.node_pools[count.index], "preemptible")}"
    machine_type = "${lookup(var.node_pools[count.index], "machine_type")}"
    image_type   = "${lookup(var.node_pools[count.index], "image_type")}"
    tags = "${split(" ", lookup(var.node_pools[count.index], "tags"))}"
  }
}