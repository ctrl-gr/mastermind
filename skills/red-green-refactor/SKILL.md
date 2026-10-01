---
name: red-green-refactor
description: Apply test-driven development through strict red-green-refactor cycles. Use when adding behavior, fixing a defect, changing a contract, or refactoring code that needs executable regression protection.
---

# Red Green Refactor

Work in small observable increments.

## Red

1. Translate one behavior into one focused test at the lowest reliable boundary.
2. Use the project's existing test framework and conventions.
3. Run the test and confirm it fails because the behavior is absent or wrong.
4. Fix the test itself if it fails for setup, environment, or assertion mistakes.

For a bug, reproduce the defect with a regression test before changing production code.

## Green

Implement only enough production code to satisfy the failing test. Run the focused test after each meaningful change. Do not broaden the implementation based on hypothetical future requirements.

## Refactor

With tests green, improve names, structure, duplication, and boundaries without changing behavior. Run focused tests during refactoring and the relevant suite before completion.

## Test Quality

- Assert outcomes, state transitions, interactions at true boundaries, or emitted contracts.
- Avoid assertions that merely repeat the implementation.
- Prefer real domain objects over excessive mocking.
- Mock nondeterministic or external boundaries, not the unit's internal collaborators by default.
- Keep each test failure diagnostic and arrange data around the behavior under examination.
