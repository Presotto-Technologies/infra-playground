resource "helm_release" "redis-cluster" {
  chart = "redis-cluster"
  name = "redis-cluster"
  repository = "https://charts.bitnami.com/bitnami"
  namespace = "db"
  version = "8.4.3"
  
  values = [
    templatefile("${path.module}/templates/redis-values.yaml", {
      certFilename: "${path.module}/templates/certificates/ca.crt"
      certKeyFilename: "${path.module}/templates/certificates/ca.key"
      certCAFilename: "${path.module}/templates/certificates/ca.crt"
    })
  ]

  depends_on = [
    helm_release.prometheus-crds
  ]

}