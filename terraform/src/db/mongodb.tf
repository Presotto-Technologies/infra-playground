resource "helm_release" "mongodb-sharded" {
  chart = "mongodb-sharded"
  name = "mongodb-sharded"
  repository = "https://charts.bitnami.com/bitnami"
  namespace = "db"
  version = "6.3.3"
  
  values = [
    templatefile("${path.module}/src/db/values/mongodb-values.yaml", {
      // not defined yet
    })
  ]
}