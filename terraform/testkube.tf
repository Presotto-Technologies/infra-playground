resource "helm_release" "testkube" {
  chart = "testkube"
  name = "testkube"
  repository = "https://kubeshop.github.io/helm-charts"
  namespace = "testkube"
  version = "1.9.276"

  values = [
    templatefile("${path.module}/templates/testkube-values.yaml", {
      telemetry = false
      minioAccessKeyId = kubernetes_secret.minio.data.rootUser
      minioAccessKey = kubernetes_secret.minio.data.rootPassword
    })
  ]

  depends_on = [
    helm_release.minio
  ]
}