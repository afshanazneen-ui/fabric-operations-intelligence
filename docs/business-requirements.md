# Business Requirements

## 1. Business Problem

Delivery operations generate data across orders, customers, delivery events, carriers, and carrier performance targets.

Without a consolidated analytical view, stakeholders may find it difficult to monitor delivery performance, identify delays, compare carrier performance, and understand regional delivery trends.

The Delivery Operations Intelligence project addresses this need by bringing delivery-related data together into a centralized analytics solution using Microsoft Fabric and Power BI.

## 2. Business Objectives

The primary business objectives are to:

- Monitor on-time delivery performance against established targets.
- Identify late orders and delivery exceptions.
- Evaluate carrier performance across regions.
- Analyze delivery duration and operational efficiency.
- Track delivery performance trends over time.
- Provide stakeholders with a consolidated executive dashboard.
- Support data-driven operational and performance decisions.

## 3. Stakeholders and Users

The intended users include:

| Stakeholder | Information Needs |
|---|---|
| Executive Management | Overall delivery performance, KPIs, and target achievement |
| Operations Managers | Regional performance, late orders, and delivery trends |
| Logistics Managers | Carrier performance and delivery duration |
| Business Analysts | Delivery datasets, performance metrics, and operational analysis |

## 4. Functional Requirements

The solution is designed to support the following capabilities:

1. Ingest delivery-related source data into Microsoft Fabric.
2. Transform and standardize data for analytical use.
3. Validate data quality during processing.
4. Create curated analytical datasets for delivery performance reporting.
5. Present delivery performance KPIs through a Power BI dashboard.
6. Compare actual carrier performance against defined targets.
7. Analyze delivery performance by region, carrier, and time period.
8. Provide interactive filtering through the Power BI dashboard.
9. Display the report's last-refresh timestamp.
10. Provide an order-level analytical dataset to support detailed delivery performance analysis.

The functional requirements describe the intended business capabilities. Actual implementation status and known limitations are documented in `implementation-status.md` and `limitations.md`.

## 5. Key Performance Indicators

The Executive Delivery Dashboard includes the following KPIs:

| KPI | Business Purpose |
|---|---|
| YTD On-Time Delivery Rate | Monitor the percentage of delivered orders completed on or before the promised delivery date during the year-to-date period |
| On-Time Delivery Target | Establish the benchmark for evaluating delivery performance |
| OTD Variance | Evaluate the difference between actual on-time delivery performance and the target, expressed in percentage points |
| Late Orders | Monitor delivered orders classified as late |
| Total Orders | Understand overall order volume |
| Average Delivery Days | Measure average delivery duration for delivered orders |
| On-Time Orders | Track the number of delivered orders completed on or before the promised delivery date |

## 6. Reporting and Analytical Requirements

The Executive Delivery Dashboard is designed to provide:

- Delivery status distribution.
- Late-order analysis by region.
- On-time delivery comparisons by carrier.
- Delivery-duration distribution.
- Monthly on-time delivery trends.
- Interactive filtering by region, carrier, and year.
- A last-refresh timestamp for reporting context.

## 7. Data Requirements

The solution uses synthetic source datasets representing:

- Orders
- Customers
- Order items
- Delivery events
- Carrier performance targets

The data is processed through Bronze, Silver, and Gold layers in Microsoft Fabric.

The curated Gold layer provides:

- Order-level delivery performance.
- Daily delivery metrics grouped by order date and region.
- Carrier performance grouped by carrier and region.
- A continuous date dimension for time-based analysis.

## 8. Scope and Assumptions

- The project uses synthetic data for portfolio demonstration purposes.
- Delivery performance is evaluated using promised and actual delivery information.
- On-time delivery calculations apply to delivered orders.
- Carrier performance is evaluated against the targets available in the source dataset.
- The Power BI report provides executive-level analysis and interactive filtering.
- The report does not currently implement drillthrough or drilldown functionality.
- Production integrations, real-time streaming, and enterprise operational monitoring are outside the current project scope.

## 9. Expected Business Outcomes

The solution demonstrates how stakeholders can use consolidated delivery analytics to:

- Monitor service-level performance.
- Identify regions with higher late-delivery volumes.
- Evaluate carrier performance against targets.
- Understand delivery-duration patterns.
- Track performance trends over time.
- Make more informed operational decisions using consistent reporting data.
