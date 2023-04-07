terraform {
  required_version = ">= 1.0.0"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.18.1"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.9.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
}