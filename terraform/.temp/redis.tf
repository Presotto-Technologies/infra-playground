# resource "helm_release" "redis-cluster" {
#   chart = "redis-cluster"
#   name = "redis-cluster"
#   repository = "https://charts.bitnami.com/bitnami"
#   namespace = "db"
#   version = "8.4.4"
  
#   values = [
#     templatefile("${path.module}/values/redis-values.yaml", {
#       password = var.redis-pass
#     })
#   ]

#   # depends_on = [
#   #   helm_release.prometheus-crds
#   # ]

# }
