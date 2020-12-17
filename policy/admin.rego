package main

all_capabilities := ["create", "read", "update", "delete", "list", "sudo"]
path_allow_all_capabilities := ["sys/policies/acl/*", "auth/*", "secret/*", "sys/mounts/*"]

deny[msg] {
    capabilities := input.path[path_allow_all_capabilities[i]].capabilities
    capabilities != all_capabilities
    msg = sprintf("path %v should allow all capabilities", [path_allow_all_capabilities[i]])
}