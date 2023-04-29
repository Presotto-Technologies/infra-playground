resource "kubernetes_namespace" "storage" {
  metadata {
    name = "storage"
  }
}