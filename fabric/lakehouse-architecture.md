# Fabric Lakehouse Architecture

## 1. Overview

This project implements a Microsoft Fabric Lakehouse architecture for analyzing delivery operations, order fulfillment, carrier performance, and delivery exceptions.

The solution follows the Medallion Architecture, organizing data into Bronze, Silver, and Gold layers to support structured ingestion, data quality validation, analytical transformations, and downstream Power BI reporting.

The architecture uses OneLake, Fabric Lakehouse, PySpark notebooks, Delta tables, and a Power BI Direct Lake semantic model.

## 2. Architecture

The implemented solution follows this logical flow:

```text
Source CSV Files
      |
      v
   OneLake
      |
      v
Microsoft Fabric Lakehouse
      |
      v
  Bronze Layer
  - Source data ingestion
  - Source column preservation
  - Ingestion metadata
  - Change detection
      |
      v
  Silver Layer
  - Data type standardization
  - Date and timestamp parsing
  - Data quality validation
  - Structured Delta tables
      |
      v
   Gold Layer
  - Order-level delivery performance
  - Daily regional delivery metrics
  - Carrier performance analysis
  - Date dimension
      |
      v
Power BI Direct Lake Semantic Model
  - Curated analytical tables
  - Date relationships
      |
      v
Executive Delivery Dashboard
  - Delivery performance KPIs
  - Regional analysis
  - Carrier comparisons
  - Delivery trends
```

**Implementation status:** Bronze, Silver, and Gold layers, the Power BI Direct Lake semantic model, and the Executive Delivery Dashboard have been implemented.

## 3. Source Data

The solution uses five synthetic CSV datasets:

| Source File | Business Purpose |
|---|---|
| `orders.csv` | Order and delivery information |
| `customers.csv` | Customer attributes |
| `delivery_events.csv`
