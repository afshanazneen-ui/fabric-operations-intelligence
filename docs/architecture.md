# Architecture

## 1. Project Overview

Delivery Operations Intelligence is a data engineering and business intelligence portfolio project built using Microsoft Fabric and Power BI.

The solution follows a Medallion Architecture, organizing data into Bronze, Silver, and Gold layers before exposing curated analytical tables through a Power BI Direct Lake semantic model.

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
          |
          v
Silver Layer
  └── Cleaned and validated Delta tables
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

The project uses a Microsoft Fabric Data Factory pipeline named `pl_delivery_medallion` to organize the processing workflow.

The pipeline contains three sequential notebook activities:

1. `nb_delivery_bronze_ingestion`
2. `nb_delivery_silver_transform`
3. `nb_delivery_gold_analytics`

Each notebook activity was executed and completed successfully during implementation.

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
- Referential-integrity checks.
- Record-count validation.

### Gold Layer

The Gold layer provides curated analytical datasets for reporting.

| Table | Purpose |
|---|---|
| `gold_delivery_performance` | Order-level delivery performance analysis. |
| `gold_daily_delivery_metrics` | Daily delivery metrics grouped by order date and region. |
| `gold_carrier_performance` | Carrier and region performance compared with targets. |
| `dim_date` | Date dimension for reporting and time-based analysis. |

Gold tables are written in Delta format.

## 4. Power BI Semantic Model

The Power BI semantic model uses Direct Lake connectivity to the Fabric Lakehouse.

The model includes:

- `gold_delivery_performance`
- `gold_daily_delivery_metrics`
- `gold_carrier_performance`
- `dim_date`
- Supporting measure and reporting helper tables.

The implemented date relationships are:

- `dim_date[Date]` to `gold_daily_delivery_metrics[order_date]` (one-to-many).
- `dim_date[Date]` to `gold_delivery_performance[order_date]` (one-to-many).

The carrier performance table is not connected to the date dimension in the current model.

## 5. Power BI Reporting

The project includes one Executive Delivery Dashboard page.

It provides:

- Delivery performance KPIs.
- On-time delivery performance against targets.
- Late orders and order volume.
- Average delivery time.
- Delivery status distribution.
- Regional and carrier comparisons.
- Monthly delivery performance trends.
- Delivery time distribution.

Report filters include Region, Carrier, and Year.

## 6. Data Grain and Modeling Considerations

The Gold layer uses different analytical grains:

- `gold_delivery_performance`: one row per order.
- `gold_daily_delivery_metrics`: one row per order date and region.
- `gold_carrier_performance`: one row per carrier and region.
- `dim_date`: one row per calendar date.

These grains are important when interpreting measures and aggregating order values or delivery counts.

## 7. Scope and Limitations

The current implementation focuses on batch ingestion, Lakehouse transformations, curated analytical tables, and Power BI reporting.

The following capabilities are not represented as implemented features in this project:

- Real-time streaming through Eventstream or Eventhouse.
- Automated production monitoring and alerting.
- Implemented row-level security.
- Production deployment automation.
- A formal automated testing framework.

These may be considered future enhancements.

## 8. Architecture Summary

The solution demonstrates an end-to-end Microsoft Fabric analytics workflow, from synthetic source data ingestion through medallion-layer processing and curated Gold datasets to a Direct Lake semantic model and executive Power BI reporting.
