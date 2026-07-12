# SPDX-License-Identifier: Apache-2.0
# Copyright Maciej Sawicki

# Plan-only scaffold test: proves the tofu-test harness end to end with no
# cloud credentials (ADR-0016: CI is validate + mocked/plan-level tests).
# Real contract tests land with the module code (#322/#323).
run "scaffold_plans_clean" {
  command = plan
}
