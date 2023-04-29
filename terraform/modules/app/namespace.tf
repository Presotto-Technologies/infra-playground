resource "kubernetes_namespace" "app" {
  metadata {
    name = "app"
    annotations = {
      "linkerd.io/inject" = "enabled"
    }
  }
}