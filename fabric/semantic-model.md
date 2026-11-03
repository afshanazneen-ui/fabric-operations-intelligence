# Power BI Semantic Model

## Overview

The Delivery Operations Intelligence semantic model connects the Gold-layer analytics tables from the Fabric Lakehouse to Power BI for business reporting and analysis.

The model uses a Direct Lake connection to the Lakehouse.

## Model Tables

| Table | Purpose |
|---|---|
| `gold_delivery_performance` | Order-level delivery performance analysis |
| `gold_daily_delivery_metrics` | Daily delivery metrics aggregated by order date and region |
| `gold_carrier_performance` | Carrier and regional performance against delivery targets |
| `dim_date` | Shared date dimension for time-based analysis |
| `Measures` | Dedicated table for Power BI measures |
| `Delivery Status Legend` | Supports delivery-status reporting |
| `Delivery Days Threshold` | Supports delivery-day threshold selection |
| `Delivery Duration Bins` | Supports delivery-duration grouping |

## Relationships

The semantic model contains two relationships:

| One side | Many side | Relationship key |
|---|---|---|
| `dim_date[Date]` | `gold_delivery_performance[order_date]` | Date |
| `dim_date[Date]` | `gold_daily_delivery_metrics[order_date]` | Date |

Both relationships use a one-to-many structure from `dim_date` to the respective Gold tables.

The shared date dimension supports consistent date-based analysis across order-level and daily aggregated delivery data.

No relationship to `gold_carrier_performance` was observed in the model view.

## Modeling Approach

- Gold-layer tables provide the analytical data used by the semantic model.
- A shared date dimension supports time-based reporting.
- A dedicated Measures table organizes Power BI measures.
- Supporting tables provide delivery-status and delivery-duration reporting functionality.

## Reporting

The semantic model supports the Executive Delivery Dashboard, including:

- Delivery performance KPIs
- On-time and late delivery analysis
- Regional performance comparisons
- Carrier performance analysis
- Delivery-duration distribution
- Monthly delivery trends

## Scope Notes

This document describes the observed semantic-model structure and relationships. Detailed DAX measure definitions are intentionally excluded from this portfolio documentation.
