package main

deny[msg] {
    capabilities := input.path["infrastructure-pipeline/*"].capabilities
    capabilities != ["read"]
    msg = sprintf("capabilities allow %v, should only allow read", capabilities)
}