package main

all_capabilities := [
    "create",
    "read",
    "update",
    "delete",
    "list",
    "sudo"
]

allow_all_capabilities := [
    "sys/policies/acl/*",
    "auth/*",
    "secret/*",
    "sys/mounts/*"
]

paths_and_expected_capabilities := {
    "sys/health": ["read", "sudo"],
    "sys/policies/acl": ["list"],
    "sys/auth/*": ["create", "update", "delete", "sudo"],
    "sys/auth": ["read"],
    "sys/mounts": ["read"]
}

deny[msg] {
    expected_capabilities := paths_and_expected_capabilities[path]
    input.path[path].capabilities != expected_capabilities
    msg = sprintf("path %v should allow capabilities %v", [path, expected_capabilities])
}

deny[msg] {
    capabilities := input.path[allow_all_capabilities[i]].capabilities
    capabilities != all_capabilities
    msg = sprintf("path %v should allow all capabilities", [allow_all_capabilities[i]])
}