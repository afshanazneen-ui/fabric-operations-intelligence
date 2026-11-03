# Gold Layer – Analytical Data Model

## Overview

The Gold layer contains curated analytical tables built from the Silver layer using PySpark in Microsoft Fabric. These tables support delivery performance reporting, operational analysis, and Power BI dashboards.

## Gold Tables

### 1. gold_delivery_performance

An order-level analytical table containing delivery and customer information.

Key attributes include:
- Order ID and order date
- Customer ID and customer segment
- Region and carrier
- Order status and order value
- Promised and actual delivery dates
- Delivery status and delivery duration
- On-time delivery indicator

**Purpose:** Supports order-level analysis, delivery exceptions, and detailed performance reporting.

### 2. gold_daily_delivery_metrics

A daily aggregated table grouped by order date and region.

Key metrics include:
- Total orders
- Delivered orders
- On-time deliveries
- Late deliveries
- Average delivery days
- Total order value
- On-time delivery rate

Average delivery days are calculated using delivered orders. On-time delivery rate is calculated using on-time deliveries divided by delivered orders when delivered orders are greater than zero.

**Purpose:** Supports daily and regional delivery trend analysis.

### 3. gold_carrier_performance

A carrier and region-level analytical table incorporating carrier targets.

Key metrics include:
- Total and delivered orders
- On-time and late deliveries
- Average delivery days
- On-time delivery rate
- Target on-time delivery rate
- Target gap and target status

The table uses carrier target information from the Silver carrier targets table.

**Purpose:** Enables carrier performance comparisons against defined targets.

## Date Dimension

The `dim_date` table provides a shared date dimension for time-based reporting.

It includes:
- Date
- Year
- Quarter
- Month
- Day
- Weekend indicator

The date dimension covers January 2, 2024 through September 24, 2026.

## Implementation

- Analytical transformations implemented using PySpark.
- Gold tables stored in Delta format.
- Gold tables written using overwrite operations.
- The Gold analytics notebook completed successfully.

## Downstream Usage

The Gold tables provide the analytical foundation for the Power BI semantic model and Executive Delivery Dashboard.
