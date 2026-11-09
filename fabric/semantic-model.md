# Power BI Semantic Model

## Overview

The Power BI semantic model connects to the Microsoft Fabric Lakehouse using Direct Lake. It provides the analytical data model for the Executive Delivery Dashboard.

The model uses curated Gold-layer tables, a shared date dimension, and supporting tables for report organization and delivery analysis.

## Model Tables

The semantic model includes the following tables:

### Gold Analytical Tables

- `gold_delivery_performance` – order-level delivery and customer information.
- `gold_daily_delivery_metrics` – daily delivery metrics grouped by order date and region.
- `gold_carrier_performance` – carrier and regional performance metrics.

### Supporting Tables

- `dim_date` – shared date dimension for time-based analysis.
- `Measures` – dedicated table for organizing report measures.
- `Delivery Status Legend` – supporting table for delivery status reporting.
- `Delivery Days Threshold` – supporting table for delivery-duration analysis.
- `Delivery Duration Bins` – supporting table for delivery-duration categorization.

## Relationships

The semantic model contains two documented relationships:

| One Side | Many Side |
|---|---|
| `dim_date[Date]` | `gold_daily_delivery_metrics[order_date]` |
| `dim_date[Date]` | `gold_delivery_performance[order_date]` |

Both relationships use a many-to-one structure, with `dim_date` on the one side.

These relationships support date-based filtering across the connected analytical tables.

`gold_carrier_performance` is included in the semantic model. No relationship to this table is documented in the current implementation.

## Implementation Notes

- The semantic model uses Direct Lake connectivity to the Microsoft Fabric Lakehouse.
- Gold analytical tables provide the curated reporting datasets.
- `dim_date` provides shared calendar attributes.
- A dedicated `Measures` table is included in the model.
- Supporting tables provide delivery status and duration reporting capabilities.
- Two date relationships are implemented in the semantic model.

## Report Usage

The semantic model supports the Executive Delivery Dashboard, including:

- Delivery performance KPIs.
- On-time and late delivery analysis.
- Daily delivery trends.
- Regional performance analysis.
- Carrier performance comparisons.
- Delivery status distribution.
- Delivery-duration analysis.

The model provides the analytical foundation for presenting operational delivery information through Power BI.
