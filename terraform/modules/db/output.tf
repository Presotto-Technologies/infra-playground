output "mongodb-password" {
  value = random_password.mongodb.result
}

output "mongodb-username" {
  value = var.username
}