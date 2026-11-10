# Data Dictionary

## 1. Overview

This document describes the source datasets, Bronze and Silver tables, curated Gold tables, and key analytical structures used in the Delivery Operations Intelligence project.

The project uses synthetic CSV source data stored in the `sample-data/` folder and processes it through the Bronze, Silver, and Gold layers in Microsoft Fabric.

Column names and descriptions below reflect the documented implementation. Source and Silver data types may differ because of transformation and standardization.

## 2. Source Datasets

| Dataset | Description | Grain |
|---|---|---|
| `orders.csv` | Order details, customer references, dates, values, and delivery assignments. | One row per order |
| `customers.csv` | Customer identifiers and segment information. | One row per customer |
| `order_items.csv` | Individual items associated with customer orders. | One row per order item |
| `delivery_events.csv` | Delivery tracking events and associated order information. | One row per delivery event |
| `carrier_targets.csv` | On-time delivery targets by carrier and region. | One row per carrier-region combination |

## 3. Bronze and Silver Tables

The Bronze and Silver layers contain corresponding datasets.

| Bronze Table | Silver Table | Description |
|---|---|---|
| `bronze_orders` | `silver_orders` | Order transactions and delivery information |
| `bronze_customers` | `silver_customers` | Customer information and attributes |
| `bronze_order_items` | `silver_order_items` | Order line-item details |
| `bronze_delivery_events` | `silver_delivery_events` | Delivery tracking events and history |
| `bronze_carrier_targets` | `silver_carrier_targets` | Carrier performance targets |

Additional Bronze ingestion-control tables:

- `bronze_ingestion_control`
- `bronze_ingestion_pending`

The Bronze layer retains source-oriented data and ingestion metadata. The Silver layer contains standardized and validated datasets prepared for analytical processing.

## 4. Gold Analytical Tables

### 4.1 `gold_delivery_performance`

**Grain:** One row per order.

| Column | Description |
|---|---|
| `order_id` | Unique order identifier. |
| `order_date` | Date the order was placed. |
| `customer_id` | Customer associated with the order. |
| `customer_segment` | Customer segment. |
| `region` | Order region. |
| `carrier` | Assigned delivery carrier. |
| `order_status` | Current order status. |
| `order_value` | Order value. |
| `promised_delivery_date` | Promised delivery date and time. |
| `actual_delivery_timestamp` | Actual delivery timestamp. |
| `actual_delivery_date` | Actual delivery date. |
| `delivery_location` | Delivery location from the latest delivery event. |
| `delivery_status` | Status from the latest delivery event. |
| `delivery_days` | Delivery duration in days. |
| `is_on_time` | Indicates whether a completed delivery met its promised delivery date. |

The latest delivery event is selected for each order using event timestamp ordering, with event ID used as a tie-breaker.

### 4.2 `gold_daily_delivery_metrics`

**Grain:** One row per order date and region.

| Column | Description |
|---|---|
| `order_date` | Order date used for daily aggregation. |
| `region` | Region associated with the metrics. |
| `total_orders` | Total orders in the group. |
| `delivered_orders` | Number of delivered orders. |
| `on_time_deliveries` | Number of on-time deliveries. |
| `late_deliveries` | Number of late deliveries. |
| `avg_delivery_days` | Average delivery duration for delivered orders. |
| `total_order_value` | Total order value for the group. |
| `on_time_delivery_rate` | On-time deliveries divided by delivered orders when delivered orders are greater than zero. |

### 4.3 `gold_carrier_performance`

**Grain:** One row per carrier and region.

| Column | Description |
|---|---|
| `carrier` | Delivery carrier. |
| `region` | Region associated with carrier performance. |
| `total_orders` | Total orders in the group. |
| `delivered_orders` | Number of delivered orders. |
| `on_time_deliveries` | Number of on-time deliveries. |
| `late_deliveries` | Number of late deliveries. |
| `avg_delivery_days` | Average delivery duration. |
| `on_time_delivery_rate` | Calculated on-time delivery rate. |
| `target_on_time_rate` | Target on-time delivery rate. |
| `target_gap` | Difference between actual and target on-time delivery rates, expressed in percentage points. |
| `target_status` | Indicates performance relative to the target. |

Carrier targets are sourced from `silver_carrier_targets`.

### 4.4 `dim_date`

**Grain:** One row per calendar date.

The date dimension supports time-based reporting and includes:

- Date
- Year
- Quarter
- Month
- Day
- Weekend indicator

The implemented date dimension contains continuous daily coverage from January 2, 2024 through September 24, 2026.

## 5. Data Modeling Considerations

- `gold_delivery_performance` is maintained at order grain.
- `gold_daily_delivery_metrics` is aggregated at order-date and region grain.
- `gold_carrier_performance` is aggregated at carrier and region grain.
- `dim_date` provides calendar attributes for time-based analysis.
- The latest delivery event is used to determine order-level delivery information.
- Order values should be aggregated at order grain to avoid duplication when working with delivery-event history.
- Aggregated delivery metrics should be interpreted according to their respective table grains.

## 6. Semantic Model Relationships

The current Power BI semantic model includes two date relationships:

| One Side | Many Side | Cardinality |
|---|---|---|
| `dim_date[Date]` | `gold_daily_delivery_metrics[order_date]` | One-to-many |
| `dim_date[Date]` | `gold_delivery_performance[order_date]` | One-to-many |

`gold_carrier_performance` is included in the semantic model but is not currently connected to `dim_date`. Date filters therefore do not automatically propagate from the date dimension to this table.

## 7. Notes and Limitations

- Source and Silver data types may differ from the final Gold reporting types.
- This dictionary describes the documented implementation, not a proposed future schema.
- Supporting semantic model tables include `Measures`, `Delivery Status Legend`, `Delivery Days Threshold`, and `Delivery Duration Bins`.
- Supporting table column definitions are not included in this dictionary.
- Data definitions should be updated if the implemented schemas change.
