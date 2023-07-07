resource "helm_release" "linkerd-plane" {
  name = "linkerd-control-plane"
  chart = "linkerd-control-plane"
  repository = "https://helm.linkerd.io/stable"
  namespace = "linkerd"
  version = "1.12.5"

  values = [
    templatefile("${path.module}/values/linkerd-plane-values.yaml", {
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

data "local_sensitive_file" "identityTrustAnchorsPEM" {
  filename = "${path.module}/certificates/ca.crt"
}

data "local_sensitive_file" "issuerCrtPEM" {
  filename = "${path.module}/certificates/issuer.crt"
}

data "local_sensitive_file" "IssuerKeyPEM" {
  filename = "${path.module}/certificates/issuer.key"
}
