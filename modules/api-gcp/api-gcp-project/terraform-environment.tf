variable "project" {}
variable "disable_dependent_services" {}
variable "disable_on_destroy" {}
variable "activate_apis" {
    type ="list"
    default= [] 
}
