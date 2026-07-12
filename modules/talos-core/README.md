# talos-core

Provider-agnostic Talos cluster core: machine secrets, per-role/per-node machine configs, bootstrap, Cilium, Tailscale identity, role-aware firewall. Node adapters feed it a uniform contract (node IPs, a provisioned handle, a per-node replace trigger) — new providers never change this module.

**Status: scaffold** — extraction from the consumer repo is #322.

Addressable as `xd-ventures/cluster/talos//modules/talos-core` (git fallback:
`git::https://github.com/xd-ventures/terraform-talos-cluster.git//modules/talos-core?ref=vX.Y.Z`).

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
