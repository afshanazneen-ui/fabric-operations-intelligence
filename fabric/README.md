# Microsoft Fabric Implementation

This folder contains technical documentation for the Microsoft Fabric implementation of the Delivery Operations Intelligence project. It describes the Lakehouse architecture, medallion data processing, source ingestion, data transformation, Gold-layer analytical tables, pipeline orchestration, and Power BI semantic model.

## Documentation

| File | Description |
|---|---|
| [Lakehouse Architecture](lakehouse-architecture.md) | Lakehouse structure and Bronze, Silver, and Gold architecture |
| [Bronze Ingestion](bronze-ingestion.md) | Source data ingestion, metadata, and ingestion control |
| [Silver Ingestion](silver-ingestion.md) | Data transformation, standardization, and data validation |
| [Gold Layer](gold-layer.md) | Analytical tables, aggregations, and date dimension |
| [Pipeline Orchestration](pipeline-orchestration.md) | Notebook execution sequence and pipeline workflow |
| [Semantic Model](semantic-model.md) | Power BI Direct Lake semantic model tables and relationships |

## Technology Stack

- Microsoft Fabric
- OneLake and Fabric Lakehouse
- PySpark notebooks
- Delta Lake
- Medallion Architecture
- Fabric Data Pipelines
- Power BI Direct Lake semantic model

## Data Processing Flow

The solution follows a Medallion Architecture to transform source data into business-ready analytical datasets.

**Bronze → Silver → Gold → Power BI**

1. **Bronze:** Ingest source CSV files into the Lakehouse and maintain ingestion metadata.
2. **Silver:** Clean, standardize, transform, and validate ingested data.
3. **Gold:** Build curated analytical tables, delivery performance metrics, carrier performance, and date dimensions.
4. **Power BI:** Connect the semantic model to curated Gold-layer data and present delivery performance through the Executive Delivery Dashboard.

For the overall project overview, business context, and portfolio details, see the [project README](../README.md).
