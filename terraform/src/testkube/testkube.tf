resource "helm_release" "testkube" {
  chart = "testkube"
  name = "testkube"
  repository = "https://kubeshop.github.io/helm-charts"
  namespace = "testkube"
  version = "1.9.276"

  values = [
    templatefile("${path.module}/src/testkube/values/testkube-values.yaml", {
      telemetry = false
      endpoint = "${helm_release.garage.name}.${helm_release.garage.namespace}:3901"
      accessKey = "${random_password.garage.result}"
      accessKeyId = ""
    })
  ]

  depends_on = [
    helm_release.garage
  ]
}