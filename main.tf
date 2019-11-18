## MODULE TERRAFORM

# module "Api_service_project" {
#   source                     = "./modules/api-gcp/api-gcp-project/"
#   project                    = "${var.project_id}"
#   disable_dependent_services = "true"
#   disable_on_destroy         = "true"
#   activate_apis              = ["sqladmin.googleapis.com","containerregistry.googleapis.com"]
# }


module "Service_Account_gitlab" {
  source        = "./modules/service-accounts/service-accounts-project/"
  id_account    = "gitlab-pipeline-ci-cd"
  display_name  = "gitlab pipeline CI/CD"
  roles         = ["roles/storage.admin", "roles/compute.storageAdmin"]  
  project       = "${var.project_id}"
  sufix         = "gitlab"
}

module "TEST-Service_Account_gitlab" {
  source        = "./modules/service-accounts/service-accounts-project/"
  id_account    = "test-gitlab-pipeline-ci-cd"
  display_name  = "test-gitlab pipeline CI/CD"
  roles         = ["roles/storage.admin", "roles/compute.storageAdmin"]  
  project       = "${var.project_id}"
  sufix         = "test-gitlab"
}
module "Service_Account_proxsql" {
  source        = "./modules/service-accounts/service-accounts-project/"
  id_account    = "proxysql-cloudsls-postgresql"
  display_name  = "access cloudsql proxy to micro-service"
  roles         = ["roles/cloudsql.client", "roles/cloudsql.editor"]  
  project       = "${var.project_id}"
  sufix         = "proxysql"
}

# module "VPC_Network" { 
#   source                  = "./modules/network/vpc-network/" 
#   name_network            = "oms-network"
#   auto_create_subnetworks = "false"
# }

# module "VPC_Subnetwork" {
#   source = "./modules/network/vpc-subnetwork/"
#   name_subnet             = "subnet-oms-us-central-1"
#   ip_cidr_range           = "192.168.1.0/24"
#   zona_subnetwork         = "us-central1" 
#   network                 = "${module.VPC_Network.name}" 
# }

# module "Firewall_rule" { 
#   source                    = "./modules/network/firewall-rule/" 
#   vpc                       = "${module.VPC_Network.name}" 
#   name_firewall_rule        = "allow-ssh-k8s-oms"
#   description_firewall_rule = "Allow SSH to machines with the 'ssh' tag"
#   protocol_firewall_rule    = "tcp"
#   port_firewall_rule        = "${var.port_firewall_rule}"
# }

# module "BD_Postgresql" { 
#   source             = "./modules/cloud-sql/postgresql/" 
#   name_postgre       = "oms-1"
#   instance_type      = "db-f1-micro"
#   database_version   = "POSTGRES_9_6"
#   region_postgres    = "us-central1"
#   master_user        = "proxyuser"
#   master_pass        = "hitesoms2019"
#   name_bd            = "OMS-BD"
#   ecoding            = "UTF8"
#   collation          = "en_US.UTF8"
# }

# module "Bastion" { 
#   source                    = "./modules/computer-instance/bastion/" 
#   network                   = "${module.VPC_Network.name}"
#   subnetwork                = "${module.VPC_Subnetwork.name}" 
#   name_bastion              = "bastion-oms"
#   type_machine_bastion      = "f1-micro"
#   zona_bastion              = "us-central1-a"
#   distribution_img_op       = "debian-9"
#   project_img_op            = "debian-cloud"
#   name_cluster              = "oms-core-cluster"
#   zone_cluster	            = "${var.region_zone}"
#   project			              = "${var.project_id}"
# }

# module "Cluster-gke-private" {
#    source                       = "./modules/cluster/cluster-private-k8s"
#    node_pools                   = "${var.node_pools}"
#    name_cluster                 = "oms-core-cluster"
#    description                  = "Cluster privado proyecto oms"
#    project                      = "${var.project_id}"
#    zone_cluster                 = "${var.region_zone}"
#    network                      = "${module.VPC_Network.name}"
#    subnetwork                   = "${module.VPC_Subnetwork.name}"
#    remove_default_node_pool     = "false"
#    cluster_config               = "${var.cluster_config}"
#    node_pools_scopes            = "${var.node_pools_scopes}"
#    bastion_external_ip          = "192.168.1.0/24"
#    node_count                   = "1" 
#    name_bastion                 = "bastion-oms"
# }
