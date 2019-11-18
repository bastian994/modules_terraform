variable "name_cluster" { }
variable "description" { }
variable "project" { }
variable "zone_cluster"{}
variable "network"{ }
variable "subnetwork" { }
variable "name_bastion" {}
variable "remove_default_node_pool" { }
variable "bastion_external_ip" {
#  type = "list"
#  default =[]
 }
variable "cluster_config" {
    type = "list"
    default = []
 }
variable "node_count"{ }
variable "node_pools" {
  type = "list"
  default =[]
}
variable "node_pools_scopes" {
  default = []
  description = "list of OAuth scopes e.g.: https://www.googleapis.com/auth/compute], global per all node pools"
}