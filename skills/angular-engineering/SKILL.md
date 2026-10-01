---
name: angular-engineering
description: Design, implement, test, and review modern Angular applications. Use for Angular components, templates, signals, RxJS, dependency injection, routing, reactive forms, HTTP integration, accessibility, performance, and frontend tests.
---

# Angular Engineering

Follow the installed Angular version and repository conventions. Prefer current APIs only when the target version supports them.

## Design

- Prefer standalone components for new code unless the application intentionally uses NgModules.
- Keep components focused on presentation and interaction; move reusable application behavior into services or feature facades.
- Use signals for synchronous local reactive state and RxJS for asynchronous streams, cancellation, and event composition.
- Convert between signals and observables deliberately; avoid parallel sources of truth.
- Use dependency injection at stable boundaries and scope providers according to ownership and lifetime.
- Prefer reactive forms for nontrivial validation and workflows.
- Keep routes lazy at feature boundaries when it improves startup cost and cohesion.
- Use `OnPush` where consistent with the project and avoid manual subscriptions when template or lifecycle-aware alternatives exist.

## Templates and Data

- Keep templates declarative, typed, accessible, and free of expensive repeated computation.
- Model loading, empty, success, validation, and error states explicitly.
- Use `HttpClient` through focused data services, type contracts, and handle cancellation and errors intentionally.
- Use interceptors only for genuinely cross-cutting transport concerns.
- Track repeated items by stable domain identity.

## Testing

Follow `$red-green-refactor`. Test components through rendered behavior and accessible interactions. Unit-test pure domain or state logic; use Angular testing utilities for DI, routing, forms, and HTTP boundaries. Add integration or browser tests for critical feature flows when supported.
