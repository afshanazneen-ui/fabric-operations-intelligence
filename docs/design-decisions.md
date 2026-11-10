# Design Decisions

This log records key design choices reflected in the current Delivery Operations Intelligence implementation.

| ID | Decision | Rationale | Notes |
|---|---|---|---|
| ADR-001 | Use a Bronze, Silver, and Gold Medallion Architecture. | Separates source ingestion, data preparation, and reporting datasets. | Implemented in the Fabric Lakehouse. |
| ADR-002 | Use PySpark notebooks for data processing. | Supports ingestion, transformation, validation, and analytical table creation within Fabric. | Processing is organized through `pl_delivery_medallion`, which contains three sequential notebook activities. Individual notebook executions succeeded; an end-to-end pipeline execution has not yet been documented. |
| ADR-003 | Store processed datasets as Delta tables. | Provides a consistent table format across the Lakehouse layers. | Bronze, Silver, and Gold tables use Delta format. |
| ADR-004 | Maintain Gold tables at defined reporting grains. | Supports detailed order-level analysis alongside daily and carrier-level aggregates. | `gold_delivery_performance` is order-level; `gold_daily_delivery_metrics` is grouped by order date and region; `gold_carrier_performance` is grouped by carrier and region. |
| ADR-005 | Use Direct Lake for the Power BI semantic model. | Connects the report to curated Lakehouse tables. | Date relationships connect `dim_date` to `gold_daily_delivery_metrics` and `gold_delivery_performance`. `gold_carrier_performance` is not connected to `dim_date`, so Year filters do not automatically propagate to that table. |
| ADR-006 | Use synthetic source data. | Enables a public portfolio demonstration without publishing real customer or employer data. | Source files are documented in `sample-data/`. |
| ADR-007 | Keep the report focused on one Executive Delivery Dashboard page. | Demonstrates core delivery KPIs and performance analysis in a concise report. | Additional pages are outside the current project scope. |
| ADR-008 | Validate Gold aggregate metrics against the order-level Gold table. | Helps confirm that daily and carrier-level analytical outputs are consistent with the detailed delivery records. | Aggregate results were cross-checked during project validation. |
| ADR-009 | Maintain ingestion metadata and SHA-256 fingerprints. | Supports ingestion traceability and change detection during Bronze processing. | Bronze ingestion includes source metadata, ingestion control information, and SHA-256 fingerprints. |

## Scope Notes

This log describes decisions reflected in the current implementation. It does not claim that production deployment, real-time streaming, automated monitoring, or a formal automated testing framework has been implemented.

The Power BI dashboard does not currently include drillthrough or drilldown functionality.

Design decisions may be revised as the project evolves. Any changes should be reflected in the relevant architecture, implementation, and validation documentation.
