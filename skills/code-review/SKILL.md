---
name: code-review
description: Perform evidence-based code review focused on correctness, regressions, security, architecture, maintainability, and missing tests. Use when reviewing a diff, branch, pull request, patch, implementation, or proposed refactor.
---

# Code Review

Review like an owner and prioritize defects over preferences.

## Workflow

1. Establish the intended behavior and comparison base.
2. Inspect the diff, then trace affected execution paths and relevant tests in surrounding code.
3. Check correctness, edge cases, error handling, concurrency, security, performance, compatibility, and data migration impact.
4. Verify that architecture and dependency direction remain coherent.
5. Identify missing tests that could allow a realistic regression.
6. Run targeted non-mutating checks when useful.

## Findings

Report only actionable findings. Order them by severity and include:

- the concrete failure or risk;
- the conditions that trigger it;
- precise file and line evidence;
- the smallest defensible remediation.

Distinguish confirmed defects from questions or residual risks. Avoid style-only findings unless they obscure correctness or substantially harm maintainability. If no findings remain, say so and name any verification gaps.

When this review follows an implementation workflow, remain read-only and return findings to the parent agent rather than editing production code.
