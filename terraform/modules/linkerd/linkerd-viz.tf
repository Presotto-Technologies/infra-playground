resource "helm_release" "linkerd-viz" {
  name = "linkerd-viz"
  chart = "linkerd-viz"
  repository = "https://helm.linkerd.io/stable"
  namespace = "linkerd"
  version = "30.8.1"

  values = [
    templatefile("${path.module}/values/linkerd-viz-values.yaml", {
      debugLevel = "debug"
    })
  ]

  depends_on = [
    helm_release.linkerd-plane
  ]
}