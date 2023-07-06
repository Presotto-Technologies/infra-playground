# resource "helm_release" "openTelemtry" {
#   chart = "opentelemetry-helm"
#   name = "opentelemtry"
#   repository = "https://open-telemetry.github.io/opentelemetry-helm-charts"
#   namespace = "monitoring"
#   version = "0.28.0"

#   values = [
#     templatefile("${path.module}/values/openTelemtry-values.yaml", {
#       replicas = 1
#     })
#   ]

# }
