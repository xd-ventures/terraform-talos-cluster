# Contributing

Thanks for considering a contribution! This module runs real production
clusters, so the bar is: every change reviewable, every release reproducible.

## Development setup

```bash
# Requirements: OpenTofu >= 1.6, tflint, terraform-docs, pre-commit
pre-commit install
pre-commit run --all-files   # fmt, validate, tflint (preset=all), docs drift,
                             # gitleaks, shellcheck, SPDX headers
tofu init -backend=false && tofu test   # plan-only tests, no cloud creds
```

`terraform-docs` output is **injected** into each README between the
`TF_DOCS` markers by the pre-commit hook — never edit those sections by hand;
CI fails on drift.

## Commit format

```
<type>: <short summary in imperative mood>
```

Types: `feat:`, `fix:`, `docs:`, `refactor:`, `chore:`, `test:`.
Sign-off (`git commit -s`) is appreciated.

## Pull requests

- All work on feature branches; `main` merges via PR (CODEOWNERS review).
- A PR that changes module inputs/outputs must regenerate the docs tables
  (the pre-commit hook does it) and note the change in `CHANGELOG.md` under
  `[Unreleased]`.
- **Breaking change** means, in consumer terms: anything that forces resource
  replacement or node reinstall on `tofu apply` of an otherwise-unchanged
  consumer configuration; plus variable renames/removals and default flips.
  Pre-1.0.0 these bump MINOR (semver 0.x); from v1.0.0, MAJOR.

## Testing & support tiers

e2e coverage is guaranteed for the configurations in `examples/` (Tier 1,
run on hourly-billable OVH Public Cloud). Other combinations are
contract-tested and community-supported. **The way into the Tier 1 matrix is
contributing your configuration as a blessed example.** Paid e2e runs are
maintainer-triggered only — PRs from forks never execute cloud credentials.

## Releases

Tags are semver, **signed, and created manually by a maintainer** — a `v*`
tag ruleset blocks updates and deletions, so releases are immutable.
Automation only ever produces the CHANGELOG/version-bump PR.
