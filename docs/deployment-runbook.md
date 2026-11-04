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

Each notebook activity was executed and completed successfully during implementation. This does not establish a successful end-to-end pipeline run.

## 4. Validation Activities

The following validation areas were addressed during project implementation:

- Row-count comparisons between Bronze and Silver.
- Null-value checks.
- Duplicate business-key checks.
- Referential-integrity checks.
- Date and timestamp parsing.
- Review of Gold analytical outputs.

Additional KPI reconciliation is needed before delivery performance results can be considered fully validated.

See `tests/README.md` for the documented validation approach.

## 5. Gold-Layer Outputs

The processing workflow produces the following documented analytical tables:

- `gold_delivery_performance`
- `gold_daily_delivery_metrics`
- `gold_carrier_performance`
- `dim_date`

These tables support the Power BI semantic model and Executive Delivery Dashboard.

## 6. Power BI Reporting

The Power BI semantic model uses Direct Lake connectivity to the Fabric Lakehouse.

The report contains one Executive Delivery Dashboard page with delivery KPIs, carrier and regional comparisons, delivery trends, and supporting visuals.

Before presenting the report, review KPI definitions and validate displayed results against the Gold-layer data.

## 7. Operational Considerations

For future execution and maintenance:

- Confirm source file availability and expected schemas.
- Verify the target Lakehouse and destination tables.
- Review notebook activity status and error details.
- Check output row counts after processing.
- Validate downstream Gold tables before reviewing report results.
- Review KPI reconciliation issues before publishing performance conclusions.

Do not assume that a rerun is safe without checking the write behavior of the affected notebook.

## 8. Deployment Scope and Limitations

The current repository documents the Fabric implementation and its processing workflow.

The following operational capabilities are not documented as implemented:

- Automated scheduling.
- Production monitoring and alerting.
- Automated retry and recovery procedures.
- CI/CD deployment automation.
- Dev/Test/Production environment promotion.
- Formal production release management.

These capabilities may be considered future enhancements.
