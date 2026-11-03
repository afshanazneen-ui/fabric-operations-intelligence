# Power BI Report Overview

## Delivery Operations Intelligence Dashboard

## Overview

The Delivery Operations Intelligence dashboard provides an executive-level view of delivery performance across regions and carriers.

Built using Power BI and Microsoft Fabric, the dashboard presents operational KPIs and delivery trends to help stakeholders monitor service performance, identify delivery issues, and evaluate performance against established targets.

## Executive Delivery Dashboard

The Executive Delivery Dashboard brings together key delivery performance indicators and supporting visualizations in a single view.

### Key Performance Indicators

The dashboard includes:

- **YTD On-Time Delivery Rate:** Measures year-to-date delivery performance.
- **On-Time Delivery Target:** Provides the benchmark for evaluating delivery performance.
- **OTD Variance:** Shows the difference between actual on-time delivery performance and the target.
- **Late Orders:** Tracks orders classified as late.
- **Total Orders:** Displays the overall order volume.
- **Average Delivery Days:** Shows average delivery duration.
- **On-Time Orders:** Tracks orders delivered on time.

### Report Visualizations

The dashboard includes the following visualizations:

| Visualization | Business Purpose |
|---|---|
| Delivery Status | Shows the distribution of delivery statuses |
| Late Orders by Region | Identifies regions contributing to late deliveries |
| On-Time Delivery by Carrier | Compares carrier delivery performance |
| Delivery Time Distribution | Shows the distribution of delivery durations |
| Monthly On-Time Delivery Trend | Tracks changes in on-time delivery performance over time |

## Interactive Filtering

The dashboard provides slicers for:

- Region
- Carrier
- Year

These filters allow users to explore delivery performance across different operational segments and reporting periods.

## Data Source

The report uses the Delivery Operations Intelligence semantic model in Microsoft Fabric, which is connected to the Lakehouse Gold-layer analytics tables.

The semantic model uses Direct Lake.

## Business Value

The dashboard helps business stakeholders:

- Monitor delivery performance against targets.
- Identify regions with higher late-order volumes.
- Compare carrier performance.
- Understand delivery-duration patterns.
- Track monthly delivery performance trends.
- Support operational decisions using consolidated delivery analytics.

## Report Scope

This documentation covers the Executive Delivery Dashboard page. Detailed DAX definitions and individual measure implementation are maintained outside the scope of this report overview.
