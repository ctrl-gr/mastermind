---
name: engineering-delivery
description: Deliver software changes with clean-code fundamentals, red-green-refactor testing, separation of concerns, and independent test and review passes. Use for implementing, changing, fixing, refactoring, or completing production code in any language or framework.
---

# Engineering Delivery

Deliver the smallest coherent change that satisfies the requested behavior and leaves the codebase easier to understand.

## Required Workflow

1. Inspect repository instructions, architecture, build manifests, tests, and working-tree state.
2. Clarify the observable behavior and identify the smallest useful test boundary.
3. Spawn `test_engineer` to inspect coverage and create or specify a failing test. If that named agent is unavailable, spawn a dedicated test subagent with the same bounded responsibility. Wait for its result before production implementation.
4. Run the new test and confirm it fails for the intended reason. A compile failure caused by a deliberately missing API is an acceptable initial red state.
5. Implement the minimum production change that makes the test pass.
6. Run the focused test, then the relevant test suite and build or static checks.
7. Refactor only while tests remain green. Remove duplication, improve names, and restore clear boundaries.
8. Spawn `code_reviewer` for a read-only independent review. If that named agent is unavailable, spawn a dedicated review subagent. Address material findings and rerun affected checks.
9. Review the final diff and report behavior, tests, and unresolved risks.

Do not skip the red step silently. If an automated test is genuinely impossible, explain the constraint, perform the closest deterministic verification, and identify the missing test seam.

## Clean-Code Rules

- Prefer intention-revealing names and small cohesive units.
- Keep domain policy separate from transport, persistence, framework, and presentation concerns.
- Depend on stable abstractions at architectural boundaries; avoid speculative interfaces inside a cohesive unit.
- Make invalid states difficult to represent and validate at system boundaries.
- Avoid hidden global state, temporal coupling, boolean-flag APIs, and unrelated cleanup.
- Preserve existing public behavior unless the request changes it.
- Treat error handling, cancellation, logging, accessibility, security, and observability as design concerns, not afterthoughts.
- Comment decisions and constraints, not code that already explains itself.

## Testing Standard

- Test externally meaningful behavior rather than private implementation details.
- Cover the happy path, important boundaries, and credible failure modes.
- Keep tests deterministic, isolated, readable, and fast at the lowest suitable level.
- Use integration tests where behavior depends on framework wiring, persistence, serialization, or external boundaries.
- Never weaken or delete a valid test merely to obtain a green run.
