resource "helm_release" "prometheus-crds" {
  chart = "prometheus-operator-crds"
  name = "prometheus-operator-crds"
  namespace = "monitoring"
  repository = "https://prometheus-community.github.io/helm-charts"
  version = "2.0.0"

  depends_on = [
    helm_release.prometheus
  ]

}