resource "helm_release" "redis-cluster" {
  chart = "redis-cluster"
  name = "redis-cluster"
  repository = "https://charts.bitnami.com/bitnami"
  namespace = "db"
  version = "8.4.4"
  
  values = [
    templatefile("${path.module}/values/redis-values.yaml", {
      password = "${random_password.redis-cluster.result}"
    })
  ]

  # depends_on = [
  #   helm_release.prometheus-crds
  # ]

}

resource "random_password" "redis-cluster" {
  length = 12
}