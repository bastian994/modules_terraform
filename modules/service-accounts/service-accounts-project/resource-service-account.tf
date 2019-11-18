resource "google_service_account" "service_account" {
    account_id   = "${var.id_account}"
    display_name = "${var.display_name}"
}

resource "google_project_iam_member" "service_account" {
    count   =  "${length(var.roles)}"
    role    =  "${element(var.roles, count.index)}"
    member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_service_account_key" "service_account" {
    depends_on          = ["google_service_account.service_account"]
    service_account_id  = "${google_service_account.service_account.name}"
}

resource "local_file" "service_account" {
   content      =  "${base64decode( google_service_account_key.service_account.private_key)}"
   filename  =  "./credentials/${var.project}-${var.sufix}.json" 
}
