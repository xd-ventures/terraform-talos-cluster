#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0
# Copyright Maciej Sawicki

# Provision the repository rulesets (#321, ADR-0016 decision 5). Run ONCE by a
# repo admin AFTER the repo is public (rulesets need a public repo or Pro):
#
#   ./scripts/provision-rulesets.sh
#
# Creates three rulesets:
#   1. "v* tags immutable"          — update/delete blocked, NO bypass
#                                     (releases are immutable for everyone)
#   2. "v* tag creation restricted" — only repo admins create release tags
#                                     (tags stay signed + manual)
#   3. "main protection"            — PRs only, code-owner review, no
#                                     force-push/delete
#
# Verify afterwards (expected: the delete is REJECTED):
#   git tag v0.0.0-rulesettest && git push origin v0.0.0-rulesettest
#   git push --delete origin v0.0.0-rulesettest   # must FAIL
#   # cleanup: temporarily set ruleset 1 enforcement=disabled, delete, re-enable

set -euo pipefail

REPO="${1:-xd-ventures/terraform-talos-cluster}"

echo "== 1/3: v* tags immutable =="
gh api "repos/${REPO}/rulesets" -X POST --input - <<'JSON'
{
  "name": "v* tags immutable",
  "target": "tag",
  "enforcement": "active",
  "conditions": {"ref_name": {"include": ["refs/tags/v*"], "exclude": []}},
  "rules": [{"type": "update"}, {"type": "deletion"}],
  "bypass_actors": []
}
JSON

echo "== 2/3: v* tag creation restricted =="
gh api "repos/${REPO}/rulesets" -X POST --input - <<'JSON'
{
  "name": "v* tag creation restricted",
  "target": "tag",
  "enforcement": "active",
  "conditions": {"ref_name": {"include": ["refs/tags/v*"], "exclude": []}},
  "rules": [{"type": "creation"}],
  "bypass_actors": [{"actor_id": 5, "actor_type": "RepositoryRole", "bypass_mode": "always"}]
}
JSON

echo "== 3/3: main protection =="
gh api "repos/${REPO}/rulesets" -X POST --input - <<'JSON'
{
  "name": "main protection",
  "target": "branch",
  "enforcement": "active",
  "conditions": {"ref_name": {"include": ["~DEFAULT_BRANCH"], "exclude": []}},
  "rules": [
    {"type": "deletion"},
    {"type": "non_fast_forward"},
    {"type": "pull_request", "parameters": {
      "required_approving_review_count": 0,
      "require_code_owner_review": true,
      "dismiss_stale_reviews_on_push": true,
      "require_last_push_approval": false,
      "required_review_thread_resolution": true,
      "allowed_merge_methods": ["squash", "merge"]
    }}
  ],
  "bypass_actors": []
}
JSON

echo "All rulesets created. Verify tag immutability per the header comment."
