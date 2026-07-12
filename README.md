# terraform-talos-cluster

> Provider-agnostic Talos Linux Kubernetes clusters — an OpenTofu module with
> pluggable node adapters (OVH dedicated servers, OVH Public Cloud).

**Registry address**: `xd-ventures/cluster/talos` (OpenTofu registry; published
at v1.0.0 — until then, consume via git tag). Terraform is supported
best-effort via git-tag sources; the HCL avoids OpenTofu-exclusive language
features.

> **Provenance**: extracted from
> [xd-ventures/tf-xd-venture-talos01](https://github.com/xd-ventures/tf-xd-venture-talos01)
> (ADR-0016), where it runs a production single-node cluster on an OVH
> dedicated server. Prior-art modules
> ([hcloud-talos](https://github.com/hcloud-talos/terraform-hcloud-talos),
> [hcloud-k8s](https://github.com/hcloud-k8s/terraform-hcloud-kubernetes),
> [sergelogvinov/terraform-talos](https://github.com/sergelogvinov/terraform-talos))
> were surveyed for design, not copied.

## Status

**Scaffold** (#321). The module code lands in subsequent PRs:
`talos-core` extraction (#322), node adapters (#323), examples + e2e
(#324–#336). Ships 0.x until the N-node adapter contract is exercised;
breaking changes bump MINOR pre-1.0.0 (semver 0.x semantics).

## Layout

```
.                        # thin composition module (the registry address resolves here)
├── modules/
│   ├── talos-core/            # provider-agnostic: secrets, machine configs, bootstrap,
│   │                          # Cilium, Tailscale identity, role-aware firewall
│   ├── node-ovh-baremetal/    # OVH dedicated server adapter (BYOI machinery)
│   └── node-ovh-publiccloud/  # OVH Public Cloud adapter (OpenStack)
├── examples/
│   ├── single-node-baremetal/ # the production-shaped configuration
│   └── ha-3cp-publiccloud/    # 3 control planes on hourly-billable VMs
└── tests/                     # plan-only / mocked tofu test
```

Node adapters implement a uniform contract (node IPs, a provisioned handle, a
per-node replace trigger) so new providers never change `talos-core`.
Submodules are individually addressable:
`xd-ventures/cluster/talos//modules/<name>` (git fallback:
`git::https://github.com/xd-ventures/terraform-talos-cluster.git//modules/<name>?ref=vX.Y.Z`).

## Support tiers (summary)

- **Tier 1** — the blessed `examples/` configurations are the entire e2e
  matrix (run on `node-ovh-publiccloud`, hourly-billable, ephemeral).
- **Tier 2** — `node-ovh-baremetal` (monthly-billed hardware: validate +
  mocked `tofu test` per PR, periodic manual real-hardware validation) and
  flag-gated alternatives.

The way into the Tier 1 matrix is contributing your configuration as a blessed
example. Full policy lands as TESTING.md / SUPPORT.md (#327).

## Usage

Not yet — the scaffold contains no functional module code. This section, and
the input/output tables below, populate as the code lands.

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

## License

[Apache-2.0](LICENSE). Copyright Maciej Sawicki.
