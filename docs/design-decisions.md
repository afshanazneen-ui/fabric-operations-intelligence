# Design Decisions

Maintain this log as choices are made. These are initial recommendations, not claims that the decisions have already been implemented.

| ID | Decision | Rationale | Trade-off / validation |
|---|---|---|---|
| ADR-001 | Use Bronze, Silver, and Gold layers | Separates source preservation, quality processing, and reporting | Verify lineage and row counts between layers |
| ADR-002 | Preserve distinct fact grains | Prevents event joins from multiplying order value | Reconcile revenue at order grain |
| ADR-003 | Define KPIs centrally in the semantic model | Reduces duplicated logic across report pages | Test DAX against independently computed totals |
| ADR-004 | Build historical reporting before streaming | Produces a useful complete portfolio milestone early | Streaming remains optional until core model is trusted |
| ADR-005 | Use synthetic data | Avoids exposing real customer or employer information | Clearly label it synthetic in GitHub |
| ADR-006 | Choose storage mode based on environment support | Avoids claiming Direct Lake without evidence | Record actual mode and limitations |
| ADR-007 | Treat AI output as a draft | Generated code can misinterpret grain and KPI definitions | Keep prompts, tests, defects, and final decisions in AI log |

## Decision record template

- **ID / date:**
- **Context:**
- **Options considered:**
- **Decision:**
- **Why:**
- **Consequences / trade-offs:**
- **Validation evidence:**
