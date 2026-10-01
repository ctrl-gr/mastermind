---
name: dotnet-modular-ddd
description: Design and implement .NET backends using domain-driven design, modular boundaries, and API/Core/DataAccess separation. Use for ASP.NET Core APIs, modular monoliths, backend features, domain modeling, persistence, integration, or architectural refactoring in .NET.
---

# Modular DDD for .NET

Apply the repository's target framework and conventions. Prefer a modular monolith unless independent deployment is a demonstrated requirement.

## Module Shape

Organize each bounded context around three explicit layers when the codebase permits it:

```text
Modules/<ModuleName>/
├── Api/         HTTP endpoints, contracts, authorization, composition
├── Core/        domain model, use cases, ports, domain events
└── DataAccess/  EF Core mappings, repositories, migrations, adapters
```

- `Core` must not reference API, EF Core, transport, or infrastructure concerns.
- `DataAccess` implements ports owned by `Core` and keeps persistence models or mappings out of the domain model.
- `Api` translates HTTP concerns into use-case inputs and owns the module's composition root.
- Cross-module work must use explicit contracts or events, never another module's internal tables or domain objects.

## Domain Modeling

- Establish bounded-context language before choosing entities or services.
- Put invariants and state transitions inside aggregates and value objects.
- Use entities for identity and value objects for immutable concepts.
- Keep aggregate boundaries small and enforce consistency within them.
- Use domain services only for domain behavior that does not naturally belong to one aggregate.
- Use application/use-case services for orchestration, transactions, authorization decisions, and ports.
- Emit domain events for meaningful facts; translate to integration events at a boundary.
- Avoid anemic models, public setters, generic repositories, and framework attributes leaking into `Core` when clean mapping is practical.

## API and Data Access

- Use correct HTTP semantics, explicit contracts, boundary validation, cancellation tokens, and consistent problem details.
- Keep DTOs separate from domain entities and never bind persistence entities directly to requests.
- Make EF Core query tracking intentional, avoid N+1 access, project read models, and keep migrations scoped to their owning module.
- Define transaction boundaries around use cases. Use an outbox when reliable external event publication is required.

## Verification

Follow `$red-green-refactor`. Unit-test domain invariants and use cases; integration-test API wiring, persistence mappings, transactions, serialization, and module boundaries where relevant.
