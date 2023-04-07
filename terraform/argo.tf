
resource "helm_release" "argo-cd" {
  chart = "argo-cd"
  name = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  namespace = "ci-cd"
  version = "5.27.0"

  values = [
    templatefile("${path.module}/templates/argo-values.yaml", {
      replicas = 3
    })
  ]
}