variable "project_name" {
  type        = string
  description = "Globally used project name for this demo."
  default     = "opa-vault-plugin"
}

variable "region" {
  type        = string
  description = "AWS US-based Region that will be used in this demo."
  default     = "us-east-1"
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability zones that will be used in this demo."
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "cluster_version" {
  type        = string
  description = "The Kubernetes version for our clusters"
  default     = "1.18"
}

variable "cidr" {
  type        = string
  description = "The CIDR block to use for this demo"
  default     = "10.0.0.0/16"
}


variable "vault_address" {
  type        = string
  description = "Address to the Vault Address"
}