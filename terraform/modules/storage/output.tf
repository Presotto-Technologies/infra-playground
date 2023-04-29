output "garage_endpoint" {
  value = "${helm_release.garage.name}.${helm_release.garage.namespace}:3901"
}

output "garage_secret" {
  value = "${random_password.garage.result}"
}

output "garage_accessKey" {
  value = "garage"
}