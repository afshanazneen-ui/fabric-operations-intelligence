# Limitations and Known Gaps

## 1. Project Scope

- This is a portfolio demonstration project using synthetic delivery data, not a production deployment.
- Data processing is batch-oriented; real-time streaming has not been implemented.
- The solution demonstrates Microsoft Fabric Lakehouse, medallion architecture, and Power BI Direct Lake capabilities within the scope of this project.
- The implementation does not represent a production-scale operational delivery platform.

## 2. Data and KPI Validation

- Gold-layer validation confirmed 1,320 order-level records, including 915 delivered orders, 369 on-time deliveries, and 546 late deliveries.
- Daily and carrier-level aggregate metrics were cross-checked against the order-level Gold table.
- Notebook validation checks were performed during implementation, but a formal automated testing framework has not been implemented.
- The carrier performance table does not currently have a date relationship to the semantic model's date dimension. Date filters therefore do not automatically propagate to this table.

## 3. Pipeline and Operations

- Individual notebook activities completed successfully, but a successful end-to-end pipeline run has not yet been documented.
- Production monitoring, alerting, automated recovery, and operational support processes have not been implemented.
- Automated deployment and CI/CD practices have not been implemented.
- Production scheduling and operational orchestration have not been established as part of this portfolio implementation.

## 4. Security and Governance

- Row-level security (RLS) has not been implemented or tested.
- Production identity, access management, and security validation are outside the current portfolio implementation scope.
- Enterprise governance and compliance controls have not been established for production use.

## 5. Future Enhancements

Potential future improvements include:

- Capture evidence of a successful end-to-end pipeline execution.
- Expand technical screenshots and validation evidence.
- Introduce a formal automated testing framework.
- Evaluate pipeline monitoring, alerting, and failure-handling capabilities.
- Implement and test appropriate security and governance controls.
- Evaluate automated deployment and CI/CD practices.
- Consider additional analytical datasets and reporting requirements.

These items represent potential enhancements and should not be interpreted as completed implementation work.

## 6. Reporting Guidelines

All project outcomes are based on synthetic data. Dashboard metrics demonstrate reporting logic and analytical capabilities only.

Do not interpret the results as actual business performance, cost savings, or measured operational improvements.
