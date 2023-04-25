resource "helm_release" "kibana" {
  chart = "kibana"
  name = "kibana"
  repository = "https://helm.elastic.co"
  namespace = "monitoring"
  version = "8.5.1"
  
  values = [
    templatefile("${path.module}/values/kibana-values.yaml", {
      // not definied yet
    })
  ]

  depends_on = [
    helm_release.elasticsearch
  ]

}

