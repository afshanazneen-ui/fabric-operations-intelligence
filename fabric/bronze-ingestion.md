# Bronze Layer – Data Ingestion

## Overview

The Bronze layer is the initial data ingestion layer of the Delivery Operations Intelligence solution, implemented using PySpark notebooks in Microsoft Fabric.

It stores source data in Delta tables while retaining ingestion metadata to support traceability and change detection.

## Source Data

The Bronze ingestion process uses five source files:

| Source File | Description |
|---|---|
| customers | Customer information |
| orders | Order transactions |
| order_items | Order line-item details |
| delivery_events | Delivery event records |
| carrier_targets | Carrier performance targets |

## Bronze Tables

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

## Ingestion Control

Two additional tables support ingestion tracking:

- `bronze_ingestion_control`
- `bronze_ingestion_pending`

The notebook also uses SHA-256 fingerprints and change detection to identify changes in source datasets.

## Implementation

The Bronze ingestion process is implemented using PySpark in Microsoft Fabric notebooks.

The resulting Bronze datasets are stored as Delta tables in the Lakehouse and serve as the input for Silver-layer transformations.

## Validation Evidence

Recorded Bronze table row counts:

| Table | Rows |
|---|---:|
| `bronze_orders` | 1,320 |
| `bronze_customers` | 89 |
| `bronze_delivery_events` | 2,154 |
| `bronze_order_items` | 2,632 |
| `bronze_carrier_targets` | 12 |

The recorded order-date coverage is January 2, 2024 through September 24, 2026.

## Scope Notes

This document describes the implemented Bronze ingestion process and its observed validation results. It does not assume a scheduled ingestion frequency or automated orchestration behavior beyond the configured Fabric pipeline.
