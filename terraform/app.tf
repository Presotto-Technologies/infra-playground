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

resource "kubernetes_secret" "elastic-search-password" {
  metadata {
    name = "elastic-search-password"
    namespace = "app"
  }

  data = {
    password = random_password.elastic-search-password.result
  }

  depends_on = [
    helm_release.elasticsearch
  ]

}

# resource "kubernetes_secret" "openai-token" {
#   metadata {
#     name = "openai-token"
#     namespace = "app"
#   }

#   data = {
#     token = ""
#     org = ""
#   }

# }