provider "helm" {
  kubernetes {
    load_config_file       = false
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}

resource "helm_release" "vault" {
  name       = var.project_name
  chart      = "vault"
  repository = "https://helm.releases.hashicorp.com"
  version    = "0.8.0"

  set {
    name  = "ha.enabled"
    value = "true"
  }

  set {
    name  = "raft.enabled"
    value = true
  }

  set {
    name  = "ui.enabled"
    value = true
  }
}
