# Bronze Layer – Data Ingestion

## Overview

The Bronze layer is the initial data ingestion layer of the Delivery Operations Intelligence solution, implemented using PySpark notebooks in Microsoft Fabric.

It stores source datasets as Delta tables in the Fabric Lakehouse while retaining ingestion metadata to support data lineage, traceability, and change detection.

## Source Data

The Bronze ingestion process uses five source CSV files:

| Source File | Description |
|---|---|
| customers | Customer information |
| orders | Order transactions |
| order_items | Order line-item details |
| delivery_events | Delivery event records |
| carrier_targets | Carrier performance targets |

## Bronze Tables

Each source dataset is ingested into its corresponding Bronze Delta table.

| Bronze Table | Source |
|---|---|
| `bronze_customers` | customers |
| `bronze_orders` | orders |
| `bronze_order_items` | order_items |
| `bronze_delivery_events` | delivery_events |
| `bronze_carrier_targets` | carrier_targets |

## Ingestion Metadata

The ingestion process maintains metadata columns to support data lineage and tracking:

- `_source_file` – identifies the originating source file.
- `_ingested_at` – records the ingestion timestamp.
- `_ingestion_date` – records the ingestion date.

## Ingestion Control and Change Detection

Two additional tables support ingestion tracking and control:

- `bronze_ingestion_control`
- `bronze_ingestion_pending`

The ingestion implementation also uses SHA-256 fingerprints and change-detection logic to identify changes in source datasets and support ingestion processing.

## Implementation

The Bronze ingestion process is implemented using PySpark in Microsoft Fabric notebooks.

The resulting datasets are stored as Delta tables in the Lakehouse and serve as the source for subsequent Silver-layer transformations.

## Validation Evidence

The following row counts were recorded during Bronze-layer validation:

| Table | Rows |
|---|---:|
| `bronze_orders` | 1,320 |
| `bronze_customers` | 89 |
| `bronze_delivery_events` | 2,154 |
| `bronze_order_items` | 2,632 |
| `bronze_carrier_targets` | 12 |

The recorded order-date coverage is January 2, 2024 through September 24, 2026.

## Scope Notes

This document describes the implemented Bronze ingestion process and its recorded validation results.

It does not imply a scheduled ingestion frequency or automated orchestration behavior beyond what is configured and implemented in the Fabric pipeline.
