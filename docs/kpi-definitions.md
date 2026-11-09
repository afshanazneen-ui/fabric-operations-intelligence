# KPI Definitions

## 1. Overview

This document defines the key performance indicators used in the Delivery Operations Intelligence Power BI dashboard.

The KPIs are based on the curated Gold tables in Microsoft Fabric and support analysis of order volume, delivery timeliness, delivery duration, and carrier performance.

The definitions describe the business logic and reporting interpretation of the implemented metrics. They do not imply that every KPI is implemented as a separate DAX measure.

## 2. Executive Delivery KPIs

| KPI | Definition | Reporting Consideration |
|---|---|---|
| Total Orders | Count of orders in the selected reporting context. | Use order-level data to avoid double counting. |
| Delivered Orders | Count of orders with a completed delivery. | Exclude orders that have not been delivered. |
| On-Time Deliveries | Count of delivered orders that met the promised delivery date. | Use the implemented `is_on_time` classification. |
| On-Time Delivery Rate (OTD) | On-time deliveries divided by delivered orders. | Use delivered orders as the denominator. |
| Target On-Time Delivery Rate | Target performance rate for the applicable carrier and region. | Sourced from carrier target data. |
| OTD Target Variance | Actual on-time delivery rate minus target on-time delivery rate. | Interpret the result as a percentage-point difference. |
| Late Orders | Count of delivered orders classified as late. | Exclude orders that have not been delivered. |
| Average Delivery Days | Average delivery duration for delivered orders. | Exclude orders without a completed delivery duration. |

## 3. Gold-Layer Metric Definitions

### `gold_delivery_performance`

The order-level Gold table supports detailed delivery analysis.

Key fields used in KPI calculations:

- `order_id`
- `order_value`
- `delivery_days`
- `is_on_time`
- `delivery_status`
- `actual_delivery_timestamp`
- `promised_delivery_date`

This table is the appropriate source for order-level counts, order values, and detailed delivery analysis.

### `gold_daily_delivery_metrics`

The daily aggregate table contains:

- `total_orders`
- `delivered_orders`
- `on_time_deliveries`
- `late_deliveries`
- `avg_delivery_days`
- `total_order_value`
- `on_time_delivery_rate`

The on-time delivery rate is calculated as:

**On-Time Delivery Rate = On-Time Deliveries / Delivered Orders**

The rate is calculated only when delivered orders are greater than zero.

The average delivery duration is based on delivered orders.

### `gold_carrier_performance`

The carrier performance table supports comparison of actual performance with carrier targets.

Key metrics:

- `on_time_delivery_rate`
- `target_on_time_rate`
- `target_gap`
- `target_status`

The target gap represents the difference between actual and target on-time delivery rates. The target status indicates performance relative to the applicable carrier-region target.

Carrier performance is aggregated at carrier and region grain.

## 4. Reporting and Interpretation Rules

- Evaluate delivery timeliness using delivered orders.
- Do not include undelivered orders in the on-time delivery rate denominator.
- Use order-level data when calculating order counts and order value.
- Avoid summing order values after joining to delivery-event history without controlling for duplicate order records.
- Interpret target variance as a percentage-point difference, not a percentage change.
- Evaluate carrier targets in the context of the applicable carrier and region.
- Apply report filters with consideration for the grain and relationships of each Gold table.
- Use the date relationships documented in the semantic-model architecture.

## 5. Semantic Model Considerations

The current semantic model has date relationships from `dim_date` to:

- `gold_delivery_performance`
- `gold_daily_delivery_metrics`

`gold_carrier_performance` is not currently connected to `dim_date`.

Consequently, date filters do not automatically propagate from the date dimension to the carrier performance table. Interpret carrier target and performance comparisons with this relationship limitation in mind.

## 6. Scope and Limitations

The current dashboard focuses on delivery volume, delivery timeliness, delivery duration, and carrier performance.

The following metrics are not currently documented as implemented dashboard KPIs:

- Open overdue packages.
- Overdue order value.
- Rejected records.
- Duplicate event counts.
- Automated data freshness monitoring.
- Source-to-Gold reconciliation variance.

These may be considered future enhancements if implemented and validated.

KPI definitions should be updated when the underlying Gold logic, semantic model, or reporting requirements change.
