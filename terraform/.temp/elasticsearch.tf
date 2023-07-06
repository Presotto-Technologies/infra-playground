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

#
# Env values for argo config (apiGateway)
#
# - name: ELASTIC_SEARCH-HOST
#   value: "https://elasticsearch-master.monitoring"
# - name: ELASTIC_SEARCH-PASS
#   valueFrom:
#     secretKeyRef:
#       name: elastic-search-password
#       key: password
