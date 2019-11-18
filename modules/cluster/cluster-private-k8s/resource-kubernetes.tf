resource "google_container_cluster" "cluster" {
    count       = "${length(var.node_pools)}"
    name        = "${var.name_cluster}"
    description = "${var.description}"
    project     = "${var.project}"
    location    = "${var.zone_cluster}"
    network     = "${var.network}"
    subnetwork  = "${var.subnetwork}"
    
#    logging_service    = "${var.logging_service}"
#    monitoring_service = "${var.monitoring_service}"
#    min_master_version = "${local.kubernetes_version}"

    remove_default_node_pool    = "${var.remove_default_node_pool}"
    initial_node_count          = "${lookup(var.node_pools[count.index], "initial_node_count")}"

    ip_allocation_policy {
    // Choose the range, but let GCP pick the IPs within the range
#        cluster_secondary_range_name  = "${var.cluster_secondary_range_name}"
#        services_secondary_range_name = "${var.cluster_secondary_range_name}"
    }

    private_cluster_config {
        enable_private_endpoint = "${lookup(var.cluster_config[count.index], "disable_public_endpoint")}"
        enable_private_nodes    = "${lookup(var.cluster_config[count.index], "enable_private_nodes")}"
        master_ipv4_cidr_block  = "${lookup(var.cluster_config[count.index], "master_ipv4_cidr_block")}"
    }
  // Scopes necessary for the nodes to function correctly
    node_config {
        oauth_scopes = "${var.node_pools_scopes}"
        machine_type = "${lookup(var.node_pools[count.index], "machine_type")}"
        image_type   = "${lookup(var.node_pools[count.index], "image_type")}"
        // (Optional) The list of instance tags applied to all nodes.
        // Tags are used to identify valid sources or targets for network firewalls.
        tags         = "${split(" ", lookup(var.node_pools[count.index], "tags"))}"
        // (Optional) The Kubernetes labels (key/value pairs) to be applied to each node.
        labels = {
            status = "node_pool"
        }
    }
#    autoscaling {
#        min_node_count = "${lookup(var.node_pools[count.index], "min_node_count",1)}"
#        max_node_count = "${lookup(var.node_pools[count.index], "max_node_count",3)}"
#    } 
   master_authorized_networks_config {
       cidr_blocks {
           display_name = "${var.name_bastion}"
           cidr_block   = "${var.bastion_external_ip}"   
    #    cidr_block   = "${var.bastion_external_ip.0}"
       }
   }
    addons_config {
        network_policy_config {
            disabled = false
        }
        http_load_balancing {
            disabled = false
        }
    }
}