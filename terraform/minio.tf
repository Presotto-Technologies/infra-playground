resource "kubernetes_secret" "minio" {
  metadata {
    name = "minio"
    namespace = "storage"
  }

  data = {
    rootUser = "admin"
    rootPassword = random_password.minio.result
  }
}

resource "random_password" "minio" {
  length = 24
}

resource "helm_release" "minio" {
  chart = "minio"
  name = "minio"
  repository = "https://charts.min.io/"
  namespace = "storage"
  version = "5.0.7"

  values = [
    templatefile("${path.module}/templates/minio-values.yaml", {
      admin_existing_secret = kubernetes_secret.minio.metadata[0].name
      rootUser_key = "rootUser"
      rootPassword_key = "rootPassword"
      replicas = 4
      pools = 1
    })
  ]
}