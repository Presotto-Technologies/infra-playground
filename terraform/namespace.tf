resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
    annotations = {
      "linkerd.io/inject" = "enabled"
    }
  }
}

resource "kubernetes_namespace" "app" {
  metadata {
    name = "app"
    annotations = {
      "linkerd.io/inject" = "enabled"
    }
  }
}

resource "kubernetes_namespace" "storage" {
  metadata {
    name = "storage"
  }
}

resource "kubernetes_namespace" "linkerd" {
  metadata {
    name = "linkerd"
  }
}

resource "kubernetes_namespace" "ci-cd" {
  metadata {
    name = "ci-cd"
  }
}

resource "kubernetes_namespace" "testkube" {
  metadata {
    name = "testkube"
  }
}

resource "kubernetes_namespace" "db" {
  metadata {
    name = "db"
  }
}
