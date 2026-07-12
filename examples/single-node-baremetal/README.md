# single-node-baremetal

The production-shaped configuration: one OVH dedicated server, ZFS mirror, Tailscale-only access, firewall on. Mirrors the consumer repo's live cluster.

**Tier**: 2 (validate + mocked tests per PR; periodic manual hardware runs)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cluster"></a> [cluster](#module\_cluster) | ../.. | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
