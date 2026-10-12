# Deployment and Operations Runbook

This is a starter runbook. Replace each placeholder with the actual workspace names, item names, and tested steps. Never include credentials, tokens, or private endpoints.

## Before a run

- [ ] Confirm source files and expected schemas.
- [ ] Confirm target Lakehouse and destination tables.
- [ ] Check whether the run is a full load or incremental load.
- [ ] Record the run ID and start time.
- [ ] Confirm no overlapping run can cause duplicate writes.

## Execute and validate

1. Trigger the Fabric pipeline using the documented method.
2. Review each activity status and capture failure details if applicable.
3. Record source, Bronze, Silver, and Gold row counts.
4. Run key and null checks.
5. Run event deduplication checks.
6. Reconcile order counts and order value at order grain.
7. Refresh or validate the semantic model using the supported method.
8. Compare report totals to curated data.
9. Record the completion time and any warnings.

## Failure recovery

1. Capture the exact error, activity, run ID, and affected dataset.
2. Determine whether partial output was written.
3. Check whether a rerun is safe and idempotent.
4. Correct the cause and rerun from the earliest safe stage.
5. Re-run all downstream validation tests.
6. Record the incident using `incidents/incident-template.md`.
7. Update the runbook if the recovery procedure changed.

## Release checklist

- [ ] Changes reviewed and committed to Git.
- [ ] Data quality tests passed.
- [ ] KPI reconciliation passed.
- [ ] Security tests completed where supported.
- [ ] Report interactions checked.
- [ ] Limitations and known defects updated.
- [ ] Screenshots represent the current implementation.
- [ ] Release notes list changed items and validation evidence.

## Deployment approach

Document whether you used a Fabric deployment pipeline, Git integration, PBIP files, or a manual process. Use only the steps supported by your tenant, capacity, permissions, and item types. Do not state that CI/CD or Dev/Test/Prod promotion exists unless you have demonstrated it.
