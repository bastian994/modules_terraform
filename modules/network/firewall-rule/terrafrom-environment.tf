variable "name_firewall_rule"{}
variable "description_firewall_rule"{}
#variable "target_tags_firewall_rule"{}
variable "protocol_firewall_rule"{}
variable "port_firewall_rule"{
  type = "list"
  default = []
}
#variable "source_range" { }
variable "vpc" {
  type        = "string"
  description = "Direct link to the network"
}
