//https://helm.influxdata.com/
resource "helm_release" "influxdb" {
  chart = "influxdb"
  name = "influxdb"
  repository = "https://charts.bitnami.com/bitnami"
  namespace = "monitoring"
  version = "5.4.21"
  
  values = [
    templatefile("${path.module}/templates/influxdb-values.yaml", {
      admin-password = "${random_password.influxdb-admin.result}"
      user-password = "${random_password.influxdb-user.result}"
      admin-token = "${random_password.influxdb-token.result}"
      organization = "${local.influxOrg}"
    })
  ]
}

resource "random_password" "influxdb-admin" {
  length = 24
}

resource "random_password" "influxdb-user" {
  length = 24
}

resource "random_password" "influxdb-token" {
  length = 128
}