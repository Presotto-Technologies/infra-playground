resource "helm_release" "linkerd-multi-cluster" {
  chart            = "linkerd-multicluster"
  name            = "linkerd-multicluster"
  repository    = "https://helm.linkerd.io/stable"
  namespace  = "linkerd"
  version         = "30.7.5"

  values = [
    templatefile("${path.module}/values/linkerd-multi-cluster-values.yaml", {
      loadBalancerIP = ""
    })
  ]

  depends_on = [
    helm_release.linkerd-plane
  ]
}