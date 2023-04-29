resource "kubernetes_namespace" "ci-cd" {
  metadata {
    name = "ci-cd"
  }
}