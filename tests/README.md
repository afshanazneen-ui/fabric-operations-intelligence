# Data Validation and Testing

## 1. Overview

This folder documents the data validation approach used in the Delivery Operations Intelligence project built with Microsoft Fabric.

Validation activities were performed across the Bronze, Silver, and Gold layers to check data completeness, consistency, referential integrity, and transformation results.

These checks were performed during notebook implementation and validation. The project does not currently include a formal automated testing framework.

## 2. Validation Areas

The following validation areas were addressed during project implementation:

| Validation Area | Description |
|---|---|
| Row Count Validation | Compared record counts across Bronze and Silver tables. |
| Null Value Checks | Checked important columns for unexpected null values. |
| Duplicate Checks | Validated business keys for duplicate records. |
| Referential Integrity | Checked relationships between related datasets. |
| Date Validation | Checked date parsing and date-range coverage. |
| Transformation Validation | Reviewed Silver and Gold transformation outputs. |
| Aggregation Validation | Cross-checked Gold-level metrics and grouped analytical results. |

## 3. Validation Scope

Validation covered the following datasets:

- Orders
- Customers
- Order Items
- Delivery Events
- Carrier Targets

Validation was performed on data processed through the Fabric Lakehouse medallion architecture.

## 4. Verified Results

The following results were confirmed during project validation.

### 4.1 Bronze and Silver Record Counts

| Dataset | Bronze Rows | Silver Rows |
|---|---:|---:|
| Orders | 1,320 | 1,320 |
| Customers | 89 | 89 |
| Order Items | 2,632 | 2,632 |
| Delivery Events | 2,154 | 2,154 |
| Carrier Targets | 12 | 12 |

### 4.2 Gold Validation

| Validation Item | Result |
|---|---:|
| `gold_delivery_performance` rows | 1,320 |
| Distinct order IDs | 1,320 |
| Duplicate order IDs | 0 |
| Delivered orders | 915 |
| On-time deliveries | 369 |
| Late deliveries | 546 |
| `gold_daily_delivery_metrics` rows | 1,132 |
| `gold_carrier_performance` carrier-region combinations | 12 |

The daily and carrier-level aggregate metrics were cross-checked against the order-level Gold table.

### 4.3 Additional Data Quality Checks

The Gold validation process also checked:

- Delivered orders with null `is_on_time` values.
- Delivered orders missing an actual delivery timestamp.
- Negative delivery durations.
- Date dimension continuity across the order date range.

The validated date dimension covers January
