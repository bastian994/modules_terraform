variable "distribution_img_op" {}
variable "project_img_op" {}
variable "name_bastion" {}
variable "type_machine_bastion" {}
variable "zona_bastion" {}
variable "name_cluster" {}
variable "zone_cluster" {}
variable "project" {}
variable "subnetwork" {}
variable "network" {
  type        = "string"
  description = "Direct link to the network"
}