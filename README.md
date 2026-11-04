# Fabric Operations Intelligence

**Delivery Operations Intelligence | Microsoft Fabric | Power BI | Data Engineering | Business Intelligence**

## Project Overview

Delivery Operations Intelligence is an end-to-end data analytics portfolio project built using Microsoft Fabric and Power BI.

The project demonstrates how delivery data can be ingested, transformed, organized into analytical tables, and presented through an interactive executive dashboard.

## Architecture

The solution follows a Medallion Architecture:

**Bronze → Silver → Gold → Power BI**

- **Bronze:** Ingests source data into Delta tables and maintains ingestion metadata and control information.
- **Silver:** Applies data transformations, standardization, and data quality validation.
- **Gold:** Creates curated analytical tables for delivery performance, daily metrics, and carrier analysis.
- **Power BI:** Uses a Direct Lake semantic model to support the Executive Delivery Dashboard.

## Technology Stack

- Microsoft Fabric
- OneLake and Fabric Lakehouse
- PySpark
- Delta Lake
- Fabric Data Pipelines
- Power BI
- Direct Lake
- DAX and Power Query

## Business Objectives

The project focuses on analyzing:

- On-time delivery performance
- Late orders and delivery exceptions
- Carrier performance against targets
- Regional delivery trends
- Delivery duration and operational efficiency

## Executive Dashboard Preview

![Executive Delivery Dashboard](powerbi/executive-overview.png)

## Repository Structure

| Folder | Contents |
|---|---|
| `fabric/` | Lakehouse, ingestion, transformation, orchestration, and semantic model documentation |
| `powerbi/` | Power BI report documentation and dashboard preview |
| `docs/` | Architecture, business requirements, data dictionary, KPI definitions, design decisions, deployment runbook, limitations, and implementation status |
| `sample-data/` | Synthetic CSV source datasets used for ingestion |
| `tests/` | Data validation and testing approach |

## Documentation

- [Fabric Implementation](fabric/README.md)
- [Power BI Implementation](powerbi/README.md)
- [Power BI Report Overview](powerbi/report-overview.md)
- [Implementation Status](docs/implementation-status.md)
- [Architecture](docs/architecture.md)
- [Business Requirements](docs/business-requirements.md)
- [Data Dictionary](docs/data-dictionary.md)
- [KPI Definitions](docs/kpi-definitions.md)
- [Design Decisions](docs/design-decisions.md)
- [Limitations](docs/limitations.md)
- [Deployment Runbook](docs/deployment-runbook.md)
- [Data Validation](tests/README.md)
- [Sample Data](sample-data/README.md)

## Project Status

The Fabric Lakehouse medallion layers, three processing notebooks, pipeline configuration, Gold analytical tables, Direct Lake semantic model, and Executive Delivery Dashboard have been implemented and documented.

The pipeline is named `pl_delivery_medallion` and uses three notebooks:

1. `nb_delivery_bronze_ingestion`
2. `nb_delivery_silver_transform`
3. `nb_delivery_gold_analytics`

Individual notebook activities completed successfully during implementation. End-to-end pipeline execution evidence and Gold-layer KPI reconciliation remain areas for further validation.

This portfolio demonstrates practical Microsoft Fabric and Power BI solution development using synthetic data.
