resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
    annotations = {
      "linkerd.io/inject" = "enabled"
    }
  }
}