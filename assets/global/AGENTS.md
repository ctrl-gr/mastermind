# Mastermind Engineering Defaults

Apply these defaults in every software project while respecting more specific repository instructions and the project's established toolchain.

## Delivery

- Use `$engineering-delivery` for every implementation, bug fix, behavior change, or refactor.
- Follow `$red-green-refactor`: create and run a focused failing test before changing production behavior, implement the minimum fix, then refactor while green.
- Delegate the initial test phase to `test_engineer`. After implementation and verification, delegate an independent read-only review to `code_reviewer` and address material findings.
- Keep changes cohesive, preserve separation of concerns, avoid unrelated cleanup, and run the relevant test suite and build or static checks before completion.
- If an automated test is genuinely impossible, explain the constraint, perform the closest deterministic verification, and identify the missing test seam. Never skip the red step silently.

## Technology Guidance

- For .NET backends, use `$dotnet-modular-ddd`. Prefer bounded modules with `Api`, `Core`, and `DataAccess` layers, inward dependencies, rich domain models, explicit contracts, and persistence isolated from the domain.
- For React work, use `$react-engineering` together with the delivery workflow.
- For Angular work, use `$angular-engineering` together with the delivery workflow.
- For explicit reviews, use `$code-review` and prioritize correctness, regressions, security, architecture, and missing tests over style preferences.

These testing and delegation requirements apply to production-code work. Do not manufacture tests for explanation-only, read-only, or documentation-only tasks.
