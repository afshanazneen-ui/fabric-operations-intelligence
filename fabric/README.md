# Microsoft Fabric Implementation

This folder contains technical documentation for the Delivery Operations Intelligence project, covering the Microsoft Fabric Lakehouse architecture, medallion data processing, pipeline orchestration, and Power BI semantic model.

## Documentation

| File | Description |
|---|---|
| [Lakehouse Architecture](lakehouse-architecture.md) | Lakehouse structure and Bronze, Silver, and Gold architecture |
| [Bronze Ingestion](bronze-ingestion.md) | Source data ingestion, metadata, and ingestion control |
| [Silver Ingestion](silver-ingestion.md) | Data transformation, standardization, and validation |
| [Gold Layer](gold-layer.md) | Analytical tables, aggregations, and date dimension |
| [Pipeline Orchestration](pipeline-orchestration.md) | Notebook execution sequence and pipeline workflow |
| [Semantic Model](semantic-model.md) | Direct Lake model tables and relationships |

## Technology

- Microsoft Fabric
- OneLake and Fabric Lakehouse
- PySpark notebooks
- Delta Lake
- Medallion Architecture
- Fabric Data Pipelines
- Power BI Direct Lake semantic model

## Processing Flow

Bronze source ingestion → Silver data transformation → Gold analytical tables → Power BI semantic model → Executive Delivery Dashboard

See the [project README](../README.md) for the overall portfolio overview.
