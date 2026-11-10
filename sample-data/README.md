# Sample Data

## Overview

This folder contains the synthetic source datasets used in the Delivery Operations Intelligence project.

The datasets represent order, customer, order item, delivery event, and carrier target information used to demonstrate data ingestion, transformation, and analytical processing in Microsoft Fabric.

## Files

| File | Description |
|---|---|
| `orders.csv` | Order-level information, including order dates, customer references, and order values. |
| `customers.csv` | Customer reference information. |
| `order_items.csv` | Individual items associated with customer orders. |
| `delivery_events.csv` | Delivery event and status information. |
| `carrier_targets.csv` | Carrier performance targets by carrier and region. |

## Usage

These files serve as source datasets for the Bronze layer of the Fabric Lakehouse Medallion Architecture.

The files are ingested into Bronze Delta tables and subsequently transformed through the Silver and Gold layers for analytical reporting.

## Data Scope

The datasets contain synthetic records created for portfolio demonstration purposes. They do not represent actual customer, order, or carrier information.

The source data is intended to demonstrate data engineering and analytics workflows rather than support production operations.
