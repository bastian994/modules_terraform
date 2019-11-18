terraform {
  backend "gcs" {
    bucket  = "terraform_gcp"
    prefix  = "Terraform-desarollo/capacitacion/terraform-state/proyecto-capasitacion-terraform.tfstate"
    credentials = "./credentials/znt-gitlab-lab001-534a06943ea3.json"
  }
}