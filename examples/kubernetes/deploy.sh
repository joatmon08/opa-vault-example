#!/bin/bash

vault policy write internal - <<EOF
path "internal/*" {
  capabilities = ["read"]
}
EOF

kubectl create serviceaccount internal

vault write auth/kubernetes/role/internal \
    bound_service_account_names=internal \
    bound_service_account_namespaces=default \
    policies=internal \
    ttl=24h

kubectl apply -f app.yaml