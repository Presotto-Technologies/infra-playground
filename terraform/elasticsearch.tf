resource "helm_release" "elasticsearch" {
  chart = "elasticsearch"
  name = "elasticsearch"
  repository = "https://helm.elastic.co"
  namespace = "db"
  version = "8.5.1"
  
  values = [
    templatefile("${path.module}/templates/elastic-values.yaml", {
      password = "${random_password.elasticsearch_pass}"
    })
  ]

}

resource "random_password" "elastic-search-password" {
  length = 24
}
