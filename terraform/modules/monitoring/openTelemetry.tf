resource "helm_release" "grafana" {
  chart = "opentelemetry-helm"
  name = "opentelemtry"
  repository = " https://open-telemetry.github.io/opentelemetry-helm-charts"
  namespace = "monitoring"
  version = "0.27.0"

  values = [
    templatefile("${path.module}/values/openTelemtry-values.yaml", {
      replicas = 1
    })
  ]

}
