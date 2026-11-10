# Deployment and Operations Runbook

## 1. Project Environment

| Component | Name |
|---|---|
| Microsoft Fabric Workspace | Delivery Operations Intelligence |
| Lakehouse | Project Lakehouse |
| Data Factory Pipeline | `pl_delivery_medallion` |
| Bronze Notebook | `nb_delivery_bronze_ingestion` |
| Silver Notebook | `nb_delivery_silver_transform` |
| Gold Notebook | `nb_delivery_gold_analytics` |
| Reporting Tool | Power BI |
| Semantic Model Storage Mode | Direct Lake |

## 2. Source Data

The project uses five synthetic CSV source files:

- `orders.csv`
- `customers.csv`
- `order_items.csv`
- `delivery_events.csv`
- `carrier_targets.csv`

The source files are maintained in the repository's `sample-data/` folder and are used for Bronze-layer ingestion.

## 3. Processing Workflow

The Fabric pipeline `pl_delivery_medallion` organizes the following notebook activities in sequence:

1. `nb_delivery_bronze_ingestion` – loads source data into Bronze Delta tables.
2. `nb_delivery_silver_transform` – transforms and validates data in the Silver layer.
3. `nb_delivery_gold_analytics` – creates curated Gold analytical tables.

Each notebook was executed and completed successfully during implementation. This does not establish a successful end-to-end pipeline run.

## 4. Validation Activities

The following validation activities were performed during project implementation:

- Row-count comparisons between Bronze and Silver.
- Null-value checks.
- Duplicate business-key checks.
- Referential-integrity checks.
- Date and timestamp parsing.
- Review of Gold analytical outputs.
- Reconciliation of daily and carrier-level aggregate metrics against the order-level Gold table.

### Bronze and Silver Expected Row Counts

| Dataset | Bronze Rows | Silver Rows |
|---|---:|---:|
| Orders | 1,320 | 1,320 |
| Customers | 89 | 89 |
| Order Items | 2,632 | 2,632 |
| Delivery Events | 2,154 | 2,154 |
| Carrier Targets | 12 | 12 |

### Gold Validation Results

| Metric | Validated Result |
|---|---:|
| Order-level records | 1,320 |
| Distinct order IDs | 1,320 |
| Daily metrics records | 1,132 |
| Carrier-region combinations | 12 |
| Delivered orders | 915 |
| On-time deliveries | 369 |
| Late deliveries | 546 |

The date dimension covers January 2, 2024 through September 24, 2026.

See `tests/README.md` for the documented validation approach and results.

## 5. Gold-Layer Outputs

The processing workflow produces the following documented analytical tables:

- `gold_delivery_performance` – order-level delivery performance.
- `gold_daily_delivery_metrics` – daily metrics grouped by order date and region.
- `gold_carrier_performance` – carrier metrics grouped by carrier and region.
- `dim_date` – continuous date dimension.

These tables support the Power BI semantic model and Executive Delivery Dashboard.

## 6. Power BI Reporting

The Power BI semantic model uses Direct Lake connectivity to the Fabric Lakehouse.

The report contains the Executive Delivery Dashboard page with delivery KPIs, carrier and regional comparisons, delivery trends, and supporting visuals.

The semantic model has date relationships from `dim_date` to:

- `gold_delivery_performance`
- `gold_daily_delivery_metrics`

`gold_carrier_performance` is not currently connected to `dim_date`. Consequently, date filters do not automatically propagate to that table.

Before presenting the report:

- Review KPI definitions.
- Validate displayed results against the Gold-layer data.
- Consider the semantic model relationship limitations when interpreting filtered carrier performance.

## 7. Operational Considerations

For future execution and maintenance:

- Confirm source file availability and expected schemas.
- Verify the target Lakehouse and destination tables.
- Review notebook activity status and error details.
- Check output row counts after processing.
- Validate downstream Gold tables before reviewing report results.
- Review aggregate reconciliation results before publishing performance conclusions.

Do not assume that a rerun is safe without checking the write behavior of the affected notebook. Review whether the notebook uses overwrite, append, or other write logic before rerunning it.

## 8. Deployment Scope and Limitations

The current repository documents the Fabric implementation and its processing workflow.

Individual notebook executions were successful during implementation, but a successful end-to-end pipeline execution has not yet been documented.

The following operational capabilities are not documented as implemented:

- Automated scheduling.
- Production monitoring and alerting.
- Automated retry and recovery procedures.
- CI/CD deployment automation.
- Dev/Test/Production environment promotion.
- Formal production release management.

These capabilities may be considered future enhancements.

The project uses synthetic data for portfolio demonstration purposes and is not a production deployment.
