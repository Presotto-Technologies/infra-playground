resource "helm_release" "mongodb-sharded" {
  chart = "mongodb-sharded"
  name = "mongodb-sharded"
  repository = "https://charts.bitnami.com/bitnami"
  namespace = "db"
  version = "6.3.3"
  
  values = [
    templatefile("${path.module}/values/mongodb-values.yaml", {
      password = random_password.mongodb.result
      username = var.username
    })
  ]
}

resource "random_password" "mongodb" {
  length = 12
}
