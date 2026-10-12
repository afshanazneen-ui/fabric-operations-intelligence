# Architecture

## 1. Logical architecture

```text
Synthetic CSV sources
  ├── orders.csv
  ├── order_items.csv
  ├── customers.csv
  ├── delivery_events.csv
  └── carrier_targets.csv
          |
          v
Fabric Data Factory pipeline
          |
          v
Bronze Lakehouse: source-aligned raw data
          |
          v
Dataflow Gen2 / Notebook / SQL (choose and document actual tools)
          |
          v
Silver Lakehouse: cleaned, typed, deduplicated, validated data
          |
          v
Gold reporting layer
  ├── FactOrders
  ├── FactOrderItems
  ├── FactDeliveryEvents or package-level delivery snapshot
  ├── DimDate
  ├── DimCustomer
  ├── DimCarrier
  └── DimRegion
          |
          v
Power BI semantic model
          |
          v
Executive Overview / Diagnose Performance / Data Trust & Operations
```

## 2. Optional Real-Time Intelligence extension

```text
Generated or sample delivery events
          |
          v
Eventstream
          |
          v
Eventhouse / KQL database
          |
          ├── KQL queries and event investigation
          ├── Real-Time Dashboard
          └── Activator rule (only if implemented)
```

If events are read from a file by a scheduled pipeline, label the implementation as batch ingestion. Do not call it streaming. Document the event source and the measured time from event generation to visible output.

## 3. Layer responsibilities

| Layer | Responsibility | Expected evidence |
|---|---|---|
| Bronze | Retain source-aligned data for traceability | Source inventory, load time, row counts |
| Silver | Normalize types and values; flag or quarantine invalid records | Transformation logic, quality checks |
| Gold | Provide stable reporting grains and business-friendly entities | Table schema, reconciliation |
| Semantic model | Define relationships, measures, date behavior, security | Model screenshot, DAX, test results |
| Power BI | Present trends, comparisons, exceptions, and data trust | Report screenshots and interaction demo |
| Operations | Capture run outcomes, incidents, recovery, and releases | Runbook, incident log, release notes |

## 4. Modeling decisions

- Orders: one row per order.
- Order items: one row per order-product line.
- Delivery events: one row per event ID.
- Customers: one row per customer ID.
- Carrier targets: one row per carrier-region-target period (revise if target history is modeled).

Orders and events must not be joined and then used to sum order value without controlling the grain. Prefer separate facts with shared dimensions or a deliberately defined package-level snapshot.

## 5. Semantic model

Recommended dimensions: Date, Customer, Carrier, Region, Product (if product analysis is in scope). Recommended facts: Orders, Order Items, Delivery Events or Delivery Snapshot.

Choose Direct Lake only if the target tables, workspace capacity, and semantic-model setup support it. Otherwise use a supported mode, document the actual choice, and explain the trade-off. Do not claim Direct Lake unless verified in the model.

## 6. Security and governance

Potential demonstration: region-based row-level security using a user-to-region mapping table. Test with separate test identities if the environment permits. If only Desktop “View as” testing is available, document that limitation; do not claim identity-level Service validation.

## 7. Architecture decisions to record

- Ingestion method and retry/re-run behavior.
- Transformation tools and why they were selected.
- Data grain and handling of multiple events per package.
- Semantic-model storage mode and evidence.
- How late-arriving events update historical KPIs.
- How event data is reconciled with historical reporting.
- Workspace, version control, and deployment approach.
