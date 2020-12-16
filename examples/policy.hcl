path "infrastructure-pipeline/*" {
  capabilities = ["read"]
}

path "auth/token/create" {
    capabilities = ["update"]
}

path "infrastructure-pipeline/database/*" {
  capabilities = ["create", "read", "update", "delete"]
}