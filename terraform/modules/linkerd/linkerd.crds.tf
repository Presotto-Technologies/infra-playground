resource "helm_release" "linkerd-crds" {
  chart = "linkerd-crds"
  name = "linkerd-crds"
  repository = "https://helm.linkerd.io/stable"
  namespace = "linkerd"
  version = "1.6.0"
}