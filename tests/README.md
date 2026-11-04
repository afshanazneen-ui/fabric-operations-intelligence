
# Data Validation and Testing

## Overview

This folder documents the data validation approach used in the Delivery Operations Intelligence project built with Microsoft Fabric.

Validation activities were performed across the Bronze, Silver, and Gold layers to check data completeness, consistency, accuracy, and transformation results.

## Validation Areas

The following checks were included in the project:

| Validation Area | Description |
|---|---|
| Row Count Validation | Compared record counts across Bronze and Silver tables. |
| Null Value Checks | Checked important columns for unexpected null values. |
| Duplicate Checks | Validated business keys for duplicate records. |
| Referential Integrity | Checked relationships between related datasets. |
| Date Validation | Checked date parsing and date-range coverage. |
| Transformation Validation | Reviewed Silver and Gold transformation outputs. |
| Aggregation Validation | Reviewed Gold-level metrics and grouped analytical results. |

## Validation Scope

Validation covered the following datasets:

- Orders
- Customers
- Order Items
- Delivery Events
- Carrier Targets

Validation was performed on the data processed through the Fabric Lakehouse medallion architecture.

## Evidence and Results

Validation results and supporting evidence may be added to this folder as the project documentation evolves.

Only completed and verified validation results should be published.

## Scope and Limitations

This folder documents project-level data validation activities. It does not represent a formal automated testing framework or production monitoring solution.
