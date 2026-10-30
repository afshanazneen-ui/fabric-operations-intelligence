# Fabric Lakehouse Architecture

## 1. Overview

This project implements a Microsoft Fabric Lakehouse architecture for analyzing delivery operations, order fulfillment, carrier performance, and delivery exceptions.

The solution uses a Medallion Architecture to organize data into Bronze and Silver layers, with a Gold analytical layer identified as a planned enhancement.

The architecture is designed to support scalable data ingestion, data quality validation, structured transformations, and downstream Power BI reporting.

## 2. Architecture

The current implementation follows this logical flow:

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
  - Raw source data
  - Source column preservation
  - Initial ingestion
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
  - Planned analytical tables
  - Business-ready aggregations
      |
      v
 Power BI Semantic Model
  - Direct Lake connectivity
  - Business measures
  - KPI reporting
      |
      v
 Power BI Dashboards
```

**Implementation note:** Bronze and Silver layers and the Power BI semantic model have been implemented. The Gold layer and automated orchestration remain planned enhancements.

## 3. Source Data

The solution uses five synthetic CSV datasets:

| Source file | Business purpose |
|---|---|
| orders.csv | Order and delivery information |
| customers.csv | Customer attributes |
| delivery_events.csv | Delivery status and event history |
| order_items.csv | Individual items associated with orders |
| carrier_targets.csv | Carrier performance targets |

The source files are maintained in the Lakehouse Files area under the Bronze directory.

## 4. Bronze Layer

The Bronze layer provides the initial landing and storage area for source data.

Key implementation characteristics:

- Source files are maintained in OneLake.
- Original source column names are preserved.
- Raw data is loaded into Bronze Delta tables.
- Ingestion control tables support tracking of source processing.
- Data is retained in its initial representation before downstream transformations.

### Bronze Tables

- bronze_orders
- bronze_customers
- bronze_delivery_events
- bronze_order_items
- bronze_carrier_targets

## 5. Silver Layer

The Silver layer contains standardized and validated data prepared for analytical consumption.

Implemented transformations include:

- Conversion of date and timestamp columns into appropriate data types.
- Parsing of source date and timestamp formats.
- Standardization of structured data.
- Validation of records and date coverage.
- Preservation of source-to-target data relationships.

### Silver Tables

- silver_orders
- silver_customers
- silver_delivery_events
- silver_order_items
- silver_carrier_targets

### Data Quality Considerations

Validation includes:

- Record count reconciliation between Bronze and Silver.
- Date parsing and validity checks.
- Null and invalid record checks.
- Source-to-target consistency.
- Data type validation.

## 6. Power BI Integration

The Microsoft Fabric Lakehouse is connected to a Power BI semantic model using Direct Lake.

The semantic model supports:

- Business-oriented data relationships.
- Date dimension analysis.
- Delivery performance measures.
- Carrier and regional performance analysis.
- Operational KPI reporting.

A dedicated measure table is used to organize business calculations.

## 7. Data Volumes

The following counts reflect the last recorded validation of the project data.

| Table | Bronze / Silver records |
|---|---:|
| Orders | 1,320 |
| Customers | 89 |
| Delivery Events | 2,154 |
| Order Items | 2,632 |
| Carrier Targets | 12 |

Orders date coverage: January 2, 2024 – September 24, 2026.

## 8. Planned Enhancements

The following capabilities are not yet represented as completed implementations:

- Gold-layer analytical tables.
- Automated pipeline orchestration.
- Incremental ingestion automation.
- Advanced monitoring and failure handling.
- Expanded analytical aggregations.

## 9. Design Considerations

The architecture separates raw ingestion from data standardization to improve traceability and maintainability.

The Medallion approach provides a structured foundation for introducing additional transformations and analytical workloads without modifying the original source data.

Direct Lake connectivity supports analytical consumption from the Fabric Lakehouse while minimizing the need for a separate imported copy of the data.

## 10. Technology Stack

- Microsoft Fabric
- OneLake
- Fabric Lakehouse
- Delta Lake
- Medallion Architecture
- Power BI
- Direct Lake
- DAX
- SQL
