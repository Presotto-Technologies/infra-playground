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
