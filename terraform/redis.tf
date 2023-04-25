# resource "helm_release" "redis-cluster" {
#   chart = "redis-cluster"
#   name = "redis-cluster"
#   repository = "https://charts.bitnami.com/bitnami"
#   namespace = "db"
#   version = "8.4.3"
  
#   values = [
#     templatefile("${path.module}/values/redis-values.yaml", {
#       certFilename = "${path.module}/values/certificates/ca.crt"
#       certKeyFilename = "${path.module}/values/certificates/ca.key"
#       certCAFilename = "${path.module}/values/certificates/ca.crt"
#       redisPassword = "${random_password.redis-cluster.result}"
#     })
#   ]

#   depends_on = [
#     helm_release.prometheus-crds
#   ]

# }

# resource "random_password" "redis-cluster" {
#   length = 24
# }