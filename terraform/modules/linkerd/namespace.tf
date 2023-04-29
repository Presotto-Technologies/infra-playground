resource "kubernetes_namespace" "linkerd" {
  metadata {
    name = "linkerd"
  }
}