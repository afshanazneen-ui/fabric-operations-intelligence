# KPI Definitions

Use these definitions consistently in the semantic model, report labels, tests, and recruiter walkthrough. Adapt only when the business rule is explicitly documented.

| KPI | Definition | Important rule |
|---|---|---|
| Delivered packages | Distinct eligible packages with a valid delivered event | Use package grain, not event-row count |
| On-time delivery rate | Eligible delivered packages delivered on/before promise ÷ all eligible delivered packages | Exclude undelivered packages from this denominator; document cancellation rules |
| Average delivery duration | Average elapsed time from chosen start timestamp to delivered timestamp | State whether start is order, dispatch, or pickup time |
| Open overdue packages | Distinct undelivered packages whose promised timestamp is before evaluation time | Use a consistent “as of” time |
| Overdue order value | Sum of order value for distinct open overdue orders | This is exposure associated with overdue orders, not automatically lost revenue |
| Carrier target variance | Actual on-time rate minus target rate | Display as percentage-point variance |
| Rejected records | Count of records rejected or quarantined by validation | Define whether counts are rows or distinct business entities |
| Duplicate events | Count of duplicate event records detected by event identity | Report duplicates before/after deduplication distinctly |
| Data freshness | Difference between current evaluation time and latest successful source/load timestamp | State timezone and timestamp source |
| Source-to-Gold reconciliation | Difference between expected and actual counts/totals at matching grain | Reconcile each entity separately |

## DAX starter patterns

These are illustrative patterns. Rename tables and columns to match the model and validate the filter context before publishing.

```dax
Delivered Packages =
CALCULATE(
    DISTINCTCOUNT(FactDeliveryEvents[package_id]),
    FactDeliveryEvents[event_status] = "Delivered"
)
```

This starter measure may be wrong if a package has multiple delivered events or if event status history requires selecting the latest event. Prefer a curated package-level delivery snapshot when that rule is needed.

```dax
On-Time Delivery Rate =
DIVIDE(
    [On-Time Delivered Packages],
    [Eligible Delivered Packages]
)
```

Define both component measures explicitly before using this rate.

```dax
Carrier Target Variance (pp) =
[On-Time Delivery Rate] - [Target On-Time Rate]
```

Format the result as a percentage; label it as percentage-point variance. Validate target aggregation if more than one target row can be in filter context.
