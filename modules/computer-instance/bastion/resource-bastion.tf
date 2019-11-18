data "template_file" "startup_script" {
	vars	= {
		cluster_name	= "${var.name_cluster}"
		cluster_zone	= "${var.zone_cluster}"
		project			= "${var.project}"
	}
	template = <<EOF
				sudo apt-get update -y
				sudo apt-get install -y kubectl
				echo "gcloud container clusters get-credentials $${cluster_name} --zone $${cluster_zone} --project $${project}" >> /etc/profile
				gcloud container clusters get-credentials $${cluster_name} --zone $${cluster_zone} --internal-ip
				gcloud container clusters update $${cluster_name} --update-addons=KubernetesDashboard=DISABLED --zone $${cluster_zone}				
				EOF
}

resource "google_compute_instance" "bastion" {
	name         = "${var.name_bastion}"
	machine_type = "${var.type_machine_bastion}"
	zone         = "${var.zona_bastion}"
	boot_disk {
		initialize_params{
			image = "${var.project_img_op}/${var.distribution_img_op}"
		}
	}

    metadata_startup_script = "${data.template_file.startup_script.rendered}"

	network_interface {
		network 	= "${var.network}"
		subnetwork	= "${var.subnetwork}"
		access_config {
             // Include this section to give the VM an external ip address
		}
	}
	// Necessary scopes for administering kubernetes.
	service_account {
		scopes = ["userinfo-email", "compute-ro", "storage-ro", "cloud-platform","https://www.googleapis.com/auth/compute.readonly"]
	}
}












