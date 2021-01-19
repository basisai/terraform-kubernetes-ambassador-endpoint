terraform {
  required_providers {
    kubernetes-alpha = {
      source  = "hashicorp/kubernetes-alpha"
      version = ">= 0.2"
    }
  }
  required_version = ">= 0.13"
}
