# Gold Layer – Analytical Data Model

## Overview

The Gold layer contains curated analytical tables built from the Silver layer using PySpark in Microsoft Fabric. These tables support delivery performance reporting, operational analysis, and Power BI dashboards.

The Gold layer organizes data into order-level, daily regional, and carrier-level analytical datasets.

## Gold Tables

### 1. `gold_delivery_performance`

An order-level analytical table containing delivery, customer, and operational information.

**Grain:** One row per order.

Key attributes include:
- Order ID and order date
- Customer ID and customer segment
- Region and carrier
- Order status and order value
- Promised and actual delivery timestamps
- Latest delivery event status
- Delivery duration
- On-time delivery indicator

The latest delivery event for each order is identified using event timestamps, with event ID used as a tie-breaker.

**Purpose:** Supports order-level analysis, delivery exceptions, and detailed performance reporting.

### 2. `gold_daily_delivery_metrics`

A daily aggregated analytical table grouped by order date and region.

**Grain:** One row per order date and region combination.

Key metrics include:
- Total orders
- Delivered orders
- On-time deliveries
- Late deliveries
- Average delivery days
- Total order value
- On-time delivery rate

Average delivery days are calculated using delivered orders. On-time delivery rate is calculated as on-time deliveries divided by delivered orders when delivered orders are greater than zero.

**Purpose:** Supports daily and regional delivery trend analysis.

### 3. `gold_carrier_performance`

A carrier and region-level analytical table incorporating carrier performance targets.

**Grain:** One row per carrier and region combination.

Key metrics include:
- Total and delivered orders
- On-time and late deliveries
- Average delivery days
- On-time delivery rate
- Target on-time delivery rate
- Target gap and target status

Carrier target information is sourced from the Silver `silver_carrier_targets` table.

**Purpose:** Enables carrier performance comparisons across regions and evaluation against defined delivery targets.

## Date Dimension

The `dim_date` table provides a shared date dimension for time-based reporting.

It includes:
- Date
- Year
- Quarter
- Month
- Day
- Weekend indicator

The date dimension contains a continuous daily date range from January 2, 2024 through September 24, 2026.

**Purpose:** Supports consistent date-based filtering and time analysis across the Gold analytical tables.

## Implementation

- Analytical transformations implemented using PySpark notebooks in Microsoft Fabric.
- Gold tables stored in Delta format.
- Gold tables written using overwrite operations.
- Latest delivery event logic applied to order-level delivery reporting.
- The Gold analytics notebook completed successfully.

## Downstream Usage

The Gold tables provide the curated analytical foundation for the Power BI semantic model and Executive Delivery Dashboard.

They support order-level investigation, daily delivery trends, regional analysis, and carrier performance monitoring.
