# resource "helm_release" "elasticsearch" {
#   chart = "elasticsearch"
#   name = "elasticsearch"
#   repository = "https://helm.elastic.co"
#   namespace = "monitoring"
#   version = "8.5.1"
  
#   values = [
#     templatefile("${path.module}/values/elastic-values.yaml", {
#       password = "${random_password.elastic-search-password.result}"
#     })
#   ]

# }

# resource "random_password" "elastic-search-password" {
#   length = 24
# }
