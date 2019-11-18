# service account: email, name. unique_id
output "email" {
    value       = "${google_service_account.service_account.email}"
    description = "The e-mail address of the service account."
}
output "name" {
    value       = "${google_service_account.service_account.name}"
    description = "The fully-qualified name of the service account."
}
output "unique_id" {
    value       = "${google_service_account.service_account.unique_id}"
    description = "The unique id of the service account."
}
# private key and decoded private key
output "private_key" {
    value = "${google_service_account_key.service_account.private_key}"
}

output "decoded_private_key" {
    value = "${base64decode(google_service_account_key.service_account.private_key)}"
}