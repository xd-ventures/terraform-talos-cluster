# Security Policy

## Reporting a vulnerability

Please report vulnerabilities **privately** via
[GitHub Security Advisories](https://github.com/xd-ventures/terraform-talos-cluster/security/advisories/new)
— do not open a public issue. You should receive a response within 7 days.

## Supported versions

Pre-1.0.0: only the **latest MINOR** line receives fixes. From v1.0.0, a
version-support statement (supported MAJOR lines, OpenTofu/Terraform core
range, Talos/Kubernetes compatibility matrix) is published in SUPPORT.md.

## Supply-chain posture

- Releases are **signed, manually-created tags**; a `v*` tag ruleset blocks
  tag updates and deletions (immutable releases).
- Consumers should **exact-pin** the module version (`= x.y.z`, never `~>`)
  and advance it only via reviewed bump PRs.
- CI runs without cloud credentials; paid e2e is maintainer-gated in a
  reviewer-protected environment. `pull_request_target` is banned.
- An SBOM (CycloneDX) is attached to every release.
