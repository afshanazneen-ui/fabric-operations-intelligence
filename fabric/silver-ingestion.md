# Silver Layer – Data Transformation

## Overview

The Silver layer contains cleaned and standardized Delta tables derived from the Bronze layer. The transformation process prepares source data for analytical processing and downstream Gold-layer reporting.

## Silver Tables

The following Silver tables were created:

| Silver Table | Source |
|---|---|
| `silver_orders` | `bronze_orders` |
| `silver_customers` | `bronze_customers` |
| `silver_order_items` | `bronze_order_items` |
| `silver_delivery_events` | `bronze_delivery_events` |
| `silver_carrier_targets` | `bronze_carrier_targets` |

## Transformation and Data Quality

The Silver transformation notebook performs data preparation and validation, including:

- Standardization of data types.
- Conversion of date and timestamp fields into appropriate formats.
- Data quality checks.
- Validation of row counts.
- Checks for null values and duplicate business keys.
- Validation of foreign-key matches.

Date and timestamp fields are parsed using explicit formats to support consistent downstream processing.

## Data Validation

The Silver tables were validated against their corresponding Bronze tables.

| Table | Validated Row Count |
|---|---:|
| Orders | 1,320 |
| Customers | 89 |
| Delivery Events | 2,154 |
| Order Items | 2,632 |
| Carrier Targets | 12 |

The validated Silver row counts matched the corresponding Bronze row counts.

## Implementation

- Transformations implemented using PySpark in a Microsoft Fabric notebook.
- Silver tables stored in Delta format.
- The Silver transformation notebook completed successfully.
- Overwrite operations are used for the Orders and Delivery Events tables.

## Downstream Usage

The Silver layer serves as the prepared data foundation for Gold-layer analytical tables, business metrics, and Power BI reporting.
