# GRAFANA
resource "kubernetes_secret" "grafana" {
  metadata {
    name = "grafana"
    namespace = "monitoring"
  }

  data = {
    admin-user = "admin"
    admin-password = random_password.grafana.result
  }
}

resource "random_password" "grafana" {
  length = 24
}