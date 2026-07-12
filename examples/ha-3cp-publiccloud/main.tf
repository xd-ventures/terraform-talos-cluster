# SPDX-License-Identifier: Apache-2.0
# Copyright Maciej Sawicki

# ha-3cp-publiccloud example (scaffold). Blessed examples are the Tier-1 e2e matrix
# (ADR-0016 decision 7); this one materializes as the module code lands.
module "cluster" {
  source = "../.."
}
