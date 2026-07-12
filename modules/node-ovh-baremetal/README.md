# node-ovh-baremetal

OVH dedicated-server node adapter: the BYOI reinstall machinery (config drive, reinstall task, replace trigger), kept adapter-internal. **Tier 2 for e2e**: validate + mocked `tofu test` per PR + periodic manual real-hardware validation (monthly-billed hardware cannot be provisioned per-PR; #337 tracks the hourly Metal spike).

**Status: scaffold** — extraction is #323.

Addressable as `xd-ventures/cluster/talos//modules/node-ovh-baremetal` (git fallback:
`git::https://github.com/xd-ventures/terraform-talos-cluster.git//modules/node-ovh-baremetal?ref=vX.Y.Z`).

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
