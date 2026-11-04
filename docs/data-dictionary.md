# Data Dictionary

## 1. Overview

This document describes the primary source datasets and curated Gold tables used in the Delivery Operations Intelligence project.

The project uses synthetic CSV source data stored in the `sample-data/` folder and processes it through the Bronze, Silver, and Gold layers in Microsoft Fabric.

Column names and data types below reflect the implemented reporting model where verified. Source and Silver column types may differ because of transformation and standardization.

## 2. Source Datasets

| Dataset | Description | Grain |
|---|---|---|
| `orders.csv` | Order details, customer references, dates, values, and delivery assignments. | One row per order |
| `customers.csv` | Customer identifiers and segment information. | One row per customer |
| `order_items.csv` | Individual items associated with customer orders. | One row per order item |
| `delivery_events.csv` | Delivery tracking events and associated order information. | One row per delivery event |
| `carrier_targets.csv` | On-time delivery targets by carrier and region. | One row per carrier-region combination |

## 3. Gold Tables

### 3.1 `gold_delivery_performance`

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
| `delivery_location` | Delivery location. |
| `delivery_status` | Delivery status. |
| `delivery_days` | Delivery duration in days. |
| `is_on_time` | Indicates whether the delivery met its promised date. |

### 3.2 `gold_daily_delivery_metrics`

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

### 3.3 `gold_carrier_performance`

**Grain:** One row per carrier and region.

| Column | Description |
|---|---|
| `carrier` | Delivery carrier. |
| `region` | Region associated with the carrier performance. |
| `total_orders` | Total orders in the group. |
| `delivered_orders` | Number of delivered orders. |
| `on_time_deliveries` | Number of on-time deliveries. |
| `late_deliveries` | Number of late deliveries. |
| `avg_delivery_days` | Average delivery duration. |
| `on_time_delivery_rate` | Calculated on-time delivery rate. |
| `target_on_time_rate` | Target on-time delivery rate. |
| `target_gap` | Difference between actual and target performance. |
| `target_status` | Indicates performance relative to the target. |

### 3.4 `dim_date`

**Grain:** One row per calendar date.

The date dimension supports time-based reporting and includes date attributes such as:

- Date
- Year
- Quarter
- Month
- Day
- Weekend indicator

## 4. Data Modeling Considerations

- `gold_delivery_performance` is maintained at order grain.
- `gold_daily_delivery_metrics` is aggregated at order-date and region grain.
- `gold_carrier_performance` is aggregated at carrier and region grain.
- `dim_date` provides calendar attributes for time-based analysis.
- Order values should be aggregated at order grain to avoid duplication when working with delivery-event history.

## 5. Semantic Model Relationships

The current Power BI semantic model includes these date relationships:

| One Side | Many Side | Cardinality |
|---|---|---|
| `dim_date[Date]` | `gold_daily_delivery_metrics[order_date]` | One-to-many |
| `dim_date[Date]` | `gold_delivery_performance[order_date]` | One-to-many |

`gold_carrier_performance` is not currently connected to `dim_date`.

## 6. Notes and Limitations

- Source and Silver data types may differ from the final Gold reporting types.
- The dictionary describes the current documented implementation, not a proposed future schema.
- Supporting measure and reporting helper tables are part of the semantic model but are not detailed here.
- Data definitions should be updated if the implemented schemas change.
