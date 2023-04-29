resource "helm_release" "testkube" {
  chart = "testkube"
  name = "testkube"
  repository = "https://kubeshop.github.io/helm-charts"
  namespace = "testkube"
  version = "1.9.276"

  values = [
    templatefile("${path.module}/values/testkube-values.yaml", {
      telemetry = false
      endpoint = var.garage_endpoint
      accessKey = var.garage_accessKey
      accessKeyId = var.garage_secret
    })
  ]
}