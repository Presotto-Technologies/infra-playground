resource "kubernetes_secret" "redis-cluster-password" {
  metadata {
    name = "redis-cluster-password"
    namespace = "app"
  }

  data = {
    password = random_password.redis-cluster.result
  }

  depends_on = [
    helm_release.redis-cluster
  ]

}