resource "helm_release" "linkerd-plane" {
  name = "linkerd-control-plane"
  chart = "linkerd-control-plane"
  repository = "https://helm.linkerd.io/stable"
  namespace = "linkerd"
  version = "1.9.6"

  values = [
    templatefile("${path.module}/templates/linkerd-plane-values.yaml", {
      debugLevel = "debug"
    })
  ]

  set {
    name = "proxyInit.runAsRoot"
    value = true
  }

  set {
    name = "proxyInit.privileged: true"
    value = true
  }

  set_sensitive {
    name = "identityTrustAnchorsPEM"
    value = data.local_sensitive_file.identityTrustAnchorsPEM.content
  }

  set_sensitive {
    name = "identity.issuer.tls.keyPEM"
    value = data.local_sensitive_file.IssuerKeyPEM.content
  }

  set_sensitive {
    name = "identity.issuer.tls.crtPEM"
    value = data.local_sensitive_file.issuerCrtPEM.content
  }
  
  depends_on = [
    helm_release.linkerd-crds
  ]
}

resource "helm_release" "linkerd-viz" {
  name = "linkerd-viz"
  chart = "linkerd-viz"
  repository = "https://helm.linkerd.io/stable"
  namespace = "linkerd"
  version = "30.3.6"

  values = [
    templatefile("${path.module}/templates/linkerd-viz-values.yaml", {
      debugLevel = "debug"
    })
  ]

  depends_on = [
    helm_release.linkerd-plane
  ]
}

# resource "helm_release" "linkerd-multi-cluster" {
#   chart            = "linkerd-multicluster"
#   name            = "linkerd-multicluster"
#   repository    = "https://helm.linkerd.io/stable"
#   namespace  = "linkerd"
#   version         = "30.2.6"
  
#   depends_on = [
#     helm_release.linkerd-plane
#   ]
# }

resource "helm_release" "linkerd-crds" {
  chart = "linkerd-crds"
  name = "linkerd-crds"
  repository = "https://helm.linkerd.io/stable"
  namespace = "linkerd"
  version = "1.4.0"
}

data "local_sensitive_file" "identityTrustAnchorsPEM" {
  filename = "${path.module}/templates/certificates/ca.crt"
}

data "local_sensitive_file" "issuerCrtPEM" {
  filename = "${path.module}/templates/certificates/issuer.crt"
}

data "local_sensitive_file" "IssuerKeyPEM" {
  filename = "${path.module}/templates/certificates/issuer.key"
}
