---
name: react-engineering
description: Design, implement, test, and review modern React applications and components. Use for React with JavaScript or TypeScript, hooks, routing, forms, state management, data fetching, accessibility, performance, component architecture, and frontend tests.
---

# React Engineering

Follow the installed React version and the repository's established toolchain. Do not introduce a new state, styling, form, or data-fetching library without a concrete need.

## Design

- Build small function components with clear responsibilities and typed props when TypeScript is available.
- Keep state local; lift or centralize it only when multiple owners genuinely coordinate it.
- Separate server state from client UI state and derive values instead of synchronizing duplicate state.
- Extract custom hooks for reusable stateful behavior, not merely to shorten a component.
- Keep side effects at external synchronization boundaries. Do not use effects for values computable during render.
- Model loading, empty, success, validation, and error states explicitly.
- Preserve semantic HTML, keyboard behavior, focus management, accessible names, and useful error announcements.

## Data and Performance

- Keep request logic behind focused clients or hooks and support cancellation or stale-response protection.
- Validate external data at the boundary when runtime uncertainty matters.
- Profile before optimizing. Use memoization only when it prevents measured work or stabilizes a required identity.
- Use stable keys from domain identity and avoid index keys for reorderable collections.

## Testing

Follow `$red-green-refactor`. Prefer user-observable tests with Testing Library and the repository's runner. Test accessible interactions and outcomes; avoid querying component internals, snapshots as primary evidence, or mocking React itself. Add browser-level coverage for critical cross-page flows when the project supports it.
