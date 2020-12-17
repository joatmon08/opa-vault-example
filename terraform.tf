terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
    template = {
      source  = "hashicorp/template"
      version = "~> 2.2"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 1.13"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 1.3"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.21"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }

  required_version = "~> 0.14"
}

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "hashicorp-team-da-beta"

    workspaces {
      name = "opa-vault-plugin"
    }
  }
}
