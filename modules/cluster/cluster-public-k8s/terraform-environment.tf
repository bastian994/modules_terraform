variable "name_cluster" {}
variable "vpc"{}
variable "zone_cluster"{}
variable "node_count"{}
variable "subnetwork" {}
variable "node_pools" {
  type = "list"
  default =[]
}
variable "node_pools_scopes" {
  default = []
  description = "list of OAuth scopes e.g.: https://www.googleapis.com/auth/compute], global per all node pools"
}