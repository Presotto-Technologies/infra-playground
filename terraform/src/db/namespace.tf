resource "kubernetes_namespace" "db" {
  metadata {
    name = "db"
  }
}