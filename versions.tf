terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.6"
    }
  }
  required_version = ">= 0.14.8"
}
