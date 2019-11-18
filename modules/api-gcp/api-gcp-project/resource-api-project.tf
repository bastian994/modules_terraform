resource "google_project_service" "gcp_api_project" {
    count                       = "${length(var.activate_apis)}"
    project                     = "${var.project}"
    service                     = "${element(var.activate_apis, count.index)}"
    disable_dependent_services  = "${var.disable_dependent_services}"
    disable_on_destroy          = "${var.disable_on_destroy}"
}