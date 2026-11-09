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
| `delivery_events.csv` | Delivery status and event history |
| `order_items.csv` | Individual items associated with orders |
| `carrier_targets.csv` | Carrier performance targets |

The source datasets are ingested into the Fabric Lakehouse through PySpark notebooks.

## 4. Bronze Layer

The Bronze layer provides the initial landing and storage area for source data.

Key implementation characteristics:

- Source datasets are ingested from CSV files.
- Original source column names are preserved.
- Raw data is stored in Bronze Delta tables.
- Ingestion metadata supports source traceability.
- SHA-256 fingerprints support change detection.
- Ingestion control tables support processing tracking.

### Bronze Tables

- `bronze_orders`
- `bronze_customers`
- `bronze_delivery_events`
- `bronze_order_items`
- `bronze_carrier_targets`
- `bronze_ingestion_control`
- `bronze_ingestion_pending`

## 5. Silver Layer

The Silver layer contains standardized and validated data prepared for analytical consumption.

Implemented transformations include:

- Conversion of date and timestamp columns into appropriate data types.
- Parsing of source date and timestamp formats.
- Data type standardization.
- Null and duplicate business-key checks.
- Foreign-key validation.
- Bronze-to-Silver row count reconciliation.

### Silver Tables

- `silver_orders`
- `silver_customers`
- `silver_delivery_events`
- `silver_order_items`
- `silver_carrier_targets`

The validated Silver row counts matched their corresponding Bronze table counts.

## 6. Gold Layer

The Gold layer contains curated analytical datasets designed to support business reporting and operational analysis.

### Gold Tables

| Gold Table | Description | Grain |
|---|---|---|
| `gold_delivery_performance` | Order-level delivery and customer information | One row per order |
| `gold_daily_delivery_metrics` | Daily delivery metrics by order date and region | One row per order date and region |
| `gold_carrier_performance` | Carrier performance metrics incorporating carrier targets | One row per carrier and region |
| `dim_date` | Shared calendar dimension for time-based analysis | One row per calendar date |

### Analytical Capabilities

The Gold layer supports:

- Order-level delivery investigation.
- On-time and late delivery analysis.
- Daily and regional delivery trends.
- Average delivery duration analysis.
- Carrier performance comparisons.
- Performance evaluation against carrier targets.
- Date-based reporting.

The latest delivery event is used to determine the current delivery status for each order in the order-level analytical table.

## 7. Power BI Integration

The Fabric Lakehouse is connected to a Power BI semantic model using Direct Lake.

The semantic model uses curated Gold-layer tables to support delivery performance reporting.

### Implemented Relationships

The semantic model contains two date relationships:

| From Table | Column | To Table | Column |
|---|---|---|---|
| `gold_daily_delivery_metrics` | `order_date` | `dim_date` | Date |
| `gold_delivery_performance` | `order_date` | `dim_date` | Date |

Both relationships use a many-to-one relationship with `dim_date` on the one side.

### Executive Delivery Dashboard

The Power BI report provides an executive view of delivery operations, including:

- Year-to-date on-time delivery rate.
- Target on-time delivery rate and variance.
- Total orders and late orders.
- Average delivery days.
- Delivery status distribution.
- Late orders by region.
- Delivery performance trends.
- Carrier performance comparisons.

Report filters support analysis by region, carrier, and year.

## 8. Data Volumes

The following counts reflect the recorded Bronze and Silver validation results.

| Table | Bronze Rows | Silver Rows |
|---|---:|---:|
| Orders | 1,320 | 1,320 |
| Customers | 89 | 89 |
| Delivery Events | 2,154 | 2,154 |
| Order Items | 2,632 | 2,632 |
| Carrier Targets | 12 | 12 |

**Order date coverage:** January 2, 2024 – September 24, 2026.

## 9. Design Considerations

The architecture separates source ingestion, data standardization, and analytical processing to improve traceability, maintainability, and data quality.

The Medallion approach provides distinct processing layers:

- **Bronze:** Preserves ingested source data and ingestion metadata.
- **Silver:** Provides standardized and validated datasets.
- **Gold:** Organizes curated analytical datasets for business reporting.

Delta tables provide the storage foundation across the Lakehouse layers.

Direct Lake connectivity enables Power BI to consume curated Lakehouse data without requiring a separate imported copy of the analytical tables.

## 10. Future Enhancements

Potential enhancements include:

- Scheduled and automated pipeline execution.
- Incremental ingestion improvements.
- Expanded pipeline monitoring and failure handling.
- Additional analytical datasets and reporting capabilities.
- Expanded semantic model relationships and analytical calculations where required.

## 11. Technology Stack

- Microsoft Fabric
- OneLake
- Fabric Lakehouse
- PySpark notebooks
- Delta Lake
- Medallion Architecture
- Fabric Data Pipelines
- Power BI
- Direct Lake
