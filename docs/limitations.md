# Limitations and Known Gaps

## Project Scope

- This is a portfolio demonstration project using synthetic delivery data, not a production deployment.
- Data processing is batch-oriented; real-time streaming has not been implemented.
- The solution demonstrates Microsoft Fabric Lakehouse, medallion architecture, and Power BI Direct Lake capabilities within the scope of this project.

## Data and KPI Validation

- Gold-layer delivered and on-time delivery counts require further reconciliation.
- Dashboard KPI calculations should be validated against the underlying Gold-layer tables before being treated as final business results.
- The carrier performance table does not currently have a date relationship to the semantic model's date dimension.
- Validation checks were performed during notebook implementation, but a formal automated testing framework has not been implemented.

## Pipeline and Operations

- Individual notebook activities completed successfully, but a successful end-to-end pipeline run has not yet been documented.
- Production monitoring, alerting, automated recovery, and operational support processes have not been implemented.
- Automated deployment and CI/CD practices have not been implemented.

## Security

- Row-level security (RLS) has not been implemented or tested.
- Production identity, access management, and security validation are outside the current portfolio implementation scope.

## Future Enhancements

- Reconcile Gold-layer delivery metrics and dashboard KPIs.
- Capture evidence of a successful end-to-end pipeline execution.
- Expand technical screenshots and validation evidence.
- Consider automated testing, monitoring, and deployment practices.
- Evaluate additional security and governance capabilities.

## Reporting Guidelines

All project outcomes are based on synthetic data. Do not interpret dashboard metrics as actual business performance, cost savings, or measured operational improvements.
