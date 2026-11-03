# Power BI Semantic Model

## Overview

The Power BI semantic model connects to the Microsoft Fabric Lakehouse using Direct Lake. It provides the data model for the Executive Delivery Dashboard.

## Model Tables

The model includes:

- `gold_delivery_performance`
- `gold_daily_delivery_metrics`
- `gold_carrier_performance`
- `dim_date`
- `Measures`
- `Delivery Status Legend`
- `Delivery Days Threshold`
- `Delivery Duration Bins`

## Relationships

The model contains two relationships:

| One Side | Many Side |
|---|---|
| `dim_date[Date]` | `gold_daily_delivery_metrics[order_date]` |
| `dim_date[Date]` | `gold_delivery_performance[order_date]` |

Both relationships support date-based filtering across the connected analytical tables.

## Implementation Notes

- The semantic model uses a Direct Lake connection to the Fabric Lakehouse.
- A separate `Measures` table is included in the model.
- The date dimension is named `dim_date`.
- `gold_carrier_performance` is included in the model; no relationship to it is documented here.

## Report Usage

The semantic model supports the Executive Delivery Dashboard, including delivery performance KPIs, trends, regional analysis, carrier comparisons, and delivery-duration analysis.
