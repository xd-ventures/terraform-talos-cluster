# SPDX-License-Identifier: Apache-2.0
# Copyright Maciej Sawicki

# Root module inputs (scaffold — populated with the composition, #322/#323).
#
# Version-pin conventions (enforced by Renovate custom managers):
#   - plain pins:  # renovate: datasource=... depName=...
#                  default = "<version>"
#   - image pins:  repo:tag@digest in one default string (atomic updates)
#   - talos_version / kubernetes_version move in LOCKSTEP with the Talos
#     support matrix and are explicitly Renovate-IGNORED (see renovate.json).
