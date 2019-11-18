#--------------------CONFIGURACIONES DE PROYECTO-----------------#

#ID de Proyecto
variable "project_id" {
  default="test"
}
variable "bucket_terraform" {
  default="bucket-test"
}

# Region principal
variable "region" {
  default = "us-central1-a"
}

# Region
variable "region_zone" {
  default = "us-central1-a"
}

# Credenciales de Conexion a GCP con terraform 
variable "credentials_file" {
  default="./credentials/auth_proyect_gcp.json"
}

variable "node_pools" {
  type = "list"
  default =[ {
      name_node_pool     = "default-pool"
      initial_node_count = "1" 
      min_node_count     = "1" 
      max_node_count     = "3" 
      image_type         = "COS" 
      machine_type       = "n1-standard-1" 
      preemptible        = "true"  
      tags               = "default-pool worker"
    },
  ]
  description = <<EOF
    Attributes of node pool:
      - name
      - initial_node_count [number]
      - min_node_count [number]
      - max_node_count [number]
      - image_type
      - machine_type
      - preemptible [bool]
      - tags [space separated tags]
      - custom_label_keys [space separated tags, must match the number of custom_label_values]
      - custom_label_values [space separated tags, must match the number of custom_label_keys]
  EOF
}

variable "node_pools_scopes" {
  default = [
    "https://www.googleapis.com/auth/compute",
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring",
  ]
  description = "list of OAuth scopes e.g.: https://www.googleapis.com/auth/compute], global per all node pools"
}

variable "cluster_config" {
  type = "list"
  default = [{
    disable_public_endpoint = "false"
    enable_private_nodes    = "true"
    master_ipv4_cidr_block  = "172.16.0.0/28"
  },]  
}

variable "port_firewall_rule" {
  type = "list"
  default = [{
    ssh   = "22"
    kiali = "6443"
  },] 
}

