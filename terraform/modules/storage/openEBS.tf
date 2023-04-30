resource "helm_release" "openEBS" {
  name = "openebs"
  chart = "openebs"
  repository = "https://openebs.github.io/charts"
  namespace = "storage"
  version = "3.6.0"
}