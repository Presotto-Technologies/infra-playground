resource "helm_release" "prometheus" {
  chart = "prometheus"
  name = "prometheus"
  namespace = "monitoring"
  repository = "https://prometheus-community.github.io/helm-charts"
  version = "20.0.2"

  values = [
    templatefile("${path.module}/values/prometheus-values.yaml", {
      persistentVolume = true
    })
  ]

}
