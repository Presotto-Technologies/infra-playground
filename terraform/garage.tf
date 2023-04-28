# resource "helm_release" "garage" {
#   name = "garage"
#   chart = "./charts/garage"
#   namespace = "storage"
  
#   values = [
#     templatefile("${path.module}/values/garage-values.yaml", {
#       // not definied yet
#     })
#   ]

# }

