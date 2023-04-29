resource "helm_release" "garage" {
  name = "garage"
  chart = "./charts/garage"
  namespace = "storage"
  
  values = [
    templatefile("${path.module}/src/storage/values/garage-values.yaml", {
      password = random_password.garage.result
      replicas = 3
    })
  ]

}

resource "random_password" "garage" {
  length = 128
}
