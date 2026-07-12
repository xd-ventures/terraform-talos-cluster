# Changelog

All notable changes to this module are documented here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/); versions follow
[semver](https://semver.org/) (0.x: breaking changes bump MINOR).

Releases are signed manual tags; this file is updated by an automation PR
per release (never by direct push).

## [Unreleased]

### Added
- Repository scaffold (#321, ADR-0016): layout (root composition module,
  `modules/talos-core`, `modules/node-ovh-baremetal`,
  `modules/node-ovh-publiccloud`, examples, tests), pre-commit quality gates
  (fmt, validate, tflint preset=all, terraform-docs inject, gitleaks,
  shellcheck, SPDX headers), credential-less CI (pre-commit + plan-only
  `tofu test`), SBOM workflow, Renovate config with the
  talos/kubernetes-version lockstep ignore, tag ruleset (immutable `v*`),
  community docs (CONTRIBUTING, SECURITY, CODE_OF_CONDUCT).

[Unreleased]: https://github.com/xd-ventures/terraform-talos-cluster/commits/main
