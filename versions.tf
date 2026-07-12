# SPDX-License-Identifier: Apache-2.0
# Copyright Maciej Sawicki

# Root composition module. Conservative required_version floor: the module
# stays Terraform-compatible (best-effort, via git-tag source) and must not
# inherit consumer-root concerns like backend locking (ADR-0016 decision 6).
# required_providers are declared as the composition wires in talos-core and
# the node adapters (#322/#323); provider {} blocks always live in consumer
# roots.
terraform {
  required_version = ">= 1.6.0"
}
