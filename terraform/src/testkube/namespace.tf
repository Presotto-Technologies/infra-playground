resource "kubernetes_namespace" "testkube" {
  metadata {
    name = "testkube"
  }
}