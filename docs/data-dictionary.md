# Data Dictionary

The CSV files in `sample-data/` are synthetic starter data. Confirm and update field types and rules when loading them into Fabric.

## orders

**Grain:** one row per order.

| Field | Meaning | Suggested type | Rule |
|---|---|---|---|
| order_id | Unique order identifier | String | Required, unique |
| order_date | Date order was placed | Date | Required |
| customer_id | Customer reference | String | Should match customers |
| promised_delivery_date | Promised delivery date/time | Timestamp | Required for delivery SLA |
| order_value | Total order value | Decimal | Non-negative |
| region | Order's assigned region | String | Standardized values |
| carrier | Assigned delivery carrier | String | Standardized values |
| order_status | Current order status | String | Controlled vocabulary |

## order_items

**Grain:** one row per order-product line.

| Field | Meaning | Suggested type | Rule |
|---|---|---|---|
| order_item_id | Unique line identifier | String | Required, unique |
| order_id | Parent order | String | Should match orders |
| product_id | Product identifier | String | Required |
| quantity | Units ordered | Whole number | Positive |
| unit_price | Price per unit | Decimal | Non-negative |

## customers

**Grain:** one row per customer.

| Field | Meaning | Suggested type | Rule |
|---|---|---|---|
| customer_id | Unique customer identifier | String | Required, unique |
| customer_segment | Demonstration segment | String | Standardized |
| region | Customer region | String | Standardized |

## delivery_events

**Grain:** one row per event ID. Multiple events per package are expected.

| Field | Meaning | Suggested type | Rule |
|---|---|---|---|
| event_id | Unique event identifier | String | Required, unique after deduplication |
| package_id | Package identifier | String | Required |
| order_id | Related order | String | Should match orders |
| event_timestamp | Time the event occurred | Timestamp | Required |
| event_status | Status reported by event | String | Controlled vocabulary |
| event_location | Event location | String | May be unknown |
| carrier | Carrier reporting event | String | Standardized |

## carrier_targets

**Grain:** one row per carrier-region pair for this starter dataset.

| Field | Meaning | Suggested type | Rule |
|---|---|---|---|
| carrier | Carrier name | String | Required |
| region | Region | String | Required |
| target_on_time_rate | Target rate, from 0 to 1 | Decimal | Between 0 and 1 |

## Derived fields to consider

- delivered_timestamp: latest valid delivered event timestamp per package/order, according to documented rules.
- delivery_duration_hours: delivered timestamp minus order timestamp (or dispatch timestamp if modeled).
- is_on_time: delivered timestamp <= promised timestamp for eligible delivered packages.
- is_open_overdue: not delivered and evaluation timestamp > promised timestamp.
- data_quality_status: accepted, warning, or quarantined, with reason codes.

## Grain warning

Do not sum `orders.order_value` after joining to `delivery_events` where an order has multiple events. Validate totals at the order grain and document the aggregation path.
