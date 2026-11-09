# Architecture

## 1. Project Overview

Delivery Operations Intelligence is a data engineering and business intelligence portfolio project built using Microsoft Fabric and Power BI.

The solution follows a Medallion Architecture, organizing data into Bronze, Silver, and Gold layers before exposing curated analytical tables through a Power BI Direct Lake semantic model.

The architecture demonstrates an end-to-end analytics workflow, from source data ingestion and transformation to business-focused reporting.

## 2. Logical Architecture

```text
Synthetic CSV Source Files
  ├── orders.csv
  ├── order_items.csv
  ├── customers.csv
  ├── delivery_events.csv
  └── carrier_targets.csv
          |
          v
Microsoft Fabric Lakehouse
          |
          v
Bronze Layer
  └── Source-aligned Delta tables
      Ingestion metadata and control
          |
          v
Silver Layer
  └── Standardized and validated Delta tables
          |
          v
Gold Layer
  ├── gold_delivery_performance
  ├── gold_daily_delivery_metrics
  ├── gold_carrier_performance
  └── dim_date
          |
          v
Power BI Semantic Model
  └── Direct Lake
          |
          v
Executive Delivery Dashboard
```

## 3. Data Ingestion and Processing

The project uses a Microsoft Fabric Data Pipeline named `pl_delivery_medallion` to organize the processing workflow.

The pipeline contains three sequential notebook activities:

1. `nb_delivery_bronze_ingestion`
2. `nb_delivery_silver_transform`
3. `nb_delivery_gold_analytics`

All three notebook activities recorded successful individual executions during implementation. A successful end-to-end pipeline execution has not yet been independently evidenced.

### Bronze Layer

The Bronze layer contains source-aligned Delta tables created from the five synthetic CSV datasets.

Key implementation details:

- PySpark-based ingestion.
- Delta table storage.
- Source file and ingestion metadata.
- Ingestion control and pending-record tables.
- SHA-256 fingerprints for change detection.

### Silver Layer

The Silver layer contains transformed and validated datasets.

Key activities include:

- Data type standardization.
- Date and timestamp parsing.
- Data quality checks.
- Duplicate business-key checks.
- Foreign-key validation.
- Bronze-to-Silver record-count reconciliation.

### Gold Layer

The Gold layer provides curated analytical datasets for reporting.

| Table | Purpose |
|---|---|
| `gold_delivery_performance` | Order-level delivery performance analysis. |
| `gold_daily_delivery_metrics` | Daily delivery metrics grouped by order date and region. |
| `gold_carrier_performance` | Carrier and region performance compared with targets. |
| `dim_date` | Shared date dimension for reporting and time-based analysis. |

Gold tables are stored in Delta format.

## 4. Power BI Semantic Model

The Power BI semantic model uses Direct Lake connectivity to the Fabric Lakehouse.

The model includes the following analytical tables:

- `gold_delivery_performance`
- `gold_daily_delivery_metrics`
- `gold_carrier_performance`
- `dim_date`

Supporting tables include:

- `Measures`
- `Delivery Status Legend`
- `Delivery Days Threshold`
- `Delivery Duration Bins`

### Implemented Relationships

The model contains two date relationships:

| One Side | Many Side |
|---|---|
| `dim_date[Date]` | `gold_daily_delivery_metrics[order_date]` |
| `dim_date[Date]` | `gold_delivery_performance[order_date]` |

Both relationships are many-to-one from the analytical tables to `dim_date`.

The `gold_carrier_performance` table is included in the model but does not have a documented relationship to the date dimension.

## 5. Power BI Reporting

The project includes an Executive Delivery Dashboard.

It provides:

- Delivery performance KPIs.
- On-time delivery performance against targets.
- Late orders and order volume.
- Average delivery days.
- Delivery status distribution.
- Regional and carrier comparisons.
- Monthly delivery performance trends.
- Delivery-duration analysis.

Report filters include Region, Carrier, and Year.

## 6. Data Grain and Modeling Considerations

The Gold layer uses different analytical grains:

| Table | Data Grain |
|---|---|
| `gold_delivery_performance` | One row per order |
| `gold_daily_delivery_metrics` | One row per order date and region |
| `gold_carrier_performance` | One row per carrier and region |
| `dim_date` | One row per calendar date |

These grains are important when interpreting metrics and aggregating order values, delivery counts, and performance percentages.

The shared date dimension supports consistent time-based filtering across the two connected analytical tables.

## 7. Scope and Limitations

The current implementation focuses on batch ingestion, Lakehouse transformations, curated analytical tables, and Power BI reporting.

The following capabilities are not implemented as part of the current project:

- Real-time streaming through Eventstream or Eventhouse.
- Automated production monitoring and alerting.
- Implemented row-level security.
- Production deployment automation.
- A formal automated testing framework.

These capabilities may be considered future enhancements.

## 8. Architecture Summary

The solution demonstrates an end-to-end Microsoft Fabric analytics workflow, from synthetic source data ingestion through medallion-layer processing and curated Gold datasets to a Direct Lake semantic model and executive Power BI reporting.
