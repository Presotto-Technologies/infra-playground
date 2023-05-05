output "redis-password" {
  value = "${random_password.redis-cluster.result}"
}