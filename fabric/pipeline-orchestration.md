# Pipeline Orchestration

## Overview

The `pl_delivery_medallion` pipeline coordinates the notebook activities used to process the Delivery Operations Intelligence data through the Bronze, Silver, and Gold layers.

## Pipeline Activities

The pipeline contains three notebook activities:

1. **Run Bronze Ingestion** — executes `nb_delivery_bronze_ingestion`.
2. **Run Silver Transformation** — executes `nb_delivery_silver_transform`.
3. **Run Gold Analytics** — executes `nb_delivery_gold_analytics`.

The activities are connected in sequence so that the Silver transformation follows Bronze ingestion, and Gold analytics follows Silver transformation.

## Execution Evidence

The following notebook executions were reported as successful:

| Layer | Notebook run ID | Notebook status | Cluster status |
|---|---|---|---|
| Bronze | `a3a80046-171e-4934-96b8-6053c0a37bec` | Succeeded | Succeeded |
| Silver | `6b80ab7b-644d-47c0-a972-345c80104baf` | Succeeded | Succeeded |
| Gold | `e37dbb6b-b327-48cc-88fb-01ced6c347cf` | Succeeded | Succeeded |

## Lineage

The Fabric lineage view shows the Lakehouse, Bronze/Silver/Gold notebooks, and `pl_delivery_medallion` in the workspace.

## Scope Notes

This documentation records the observed pipeline activities and successful notebook executions. Scheduling, retry policies, parameterization, and other operational settings are not documented here because they have not been confirmed.
