resource "kubernetes_secret" "openai-token" {
  metadata {
    name = "openai-token"
    namespace = "app"
  }

  data = {
    token = ""
    org = ""
  }

}

resource "kubernetes_secret" "mongodb" {
  metadata {
    name = "mongodb"
    namespace = "app"
  }

  data = {
    username = var.mongodb-username
    password = var.mongodb-password
  }

}
