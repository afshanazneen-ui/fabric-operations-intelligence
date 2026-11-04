# Design Decisions

This log records key design choices reflected in the current Delivery Operations Intelligence implementation.

| ID | Decision | Rationale | Notes |
|---|---|---|---|
| ADR-001 | Use a Bronze, Silver, and Gold medallion architecture. | Separates source ingestion, data preparation, and reporting datasets. | Implemented in the Fabric Lakehouse. |
| ADR-002 | Use PySpark notebooks for data processing. | Supports ingestion, transformation, validation, and analytical table creation within Fabric. | Processing is organized through `pl_delivery_medallion`. |
| ADR-003 | Store processed datasets as Delta tables. | Provides a consistent table format across the Lakehouse layers. | Bronze, Silver, and Gold tables use Delta format. |
| ADR-004 | Maintain Gold tables at defined reporting grains. | Supports order-level analysis alongside daily and carrier-level aggregates. | See `docs/data-dictionary.md`. |
| ADR-005 | Use Direct Lake for the Power BI semantic model. | Connects the report to curated Lakehouse tables. | The current model includes date relationships to the daily metrics and order-level performance tables. |
| ADR-006 | Use synthetic source data. | Enables a public portfolio demonstration without publishing real customer or employer data. | Source files are documented in `sample-data/`. |
| ADR-007 | Keep the report focused on one Executive Delivery Dashboard page. | Demonstrates core delivery KPIs and performance analysis in a concise report. | Additional pages are outside the current project scope. |

## Scope Notes

This log describes decisions reflected in the current implementation. It does not claim that production deployment, streaming, automated monitoring, or a formal automated testing framework has been implemented.
