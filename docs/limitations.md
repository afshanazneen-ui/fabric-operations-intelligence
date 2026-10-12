# Limitations and Known Gaps

Update this page honestly as the implementation evolves.

## Initial scaffold limitations

- This repository starts as a documentation and synthetic-data scaffold; it is not a deployed production system.
- Fabric notebooks, pipelines, Lakehouse tables, and Power BI report files must be created and tested in the author's workspace.
- Direct Lake is a proposed option and must be verified in the actual semantic model.
- Real-Time Intelligence is an optional extension; do not claim streaming if the event source is processed as scheduled files.
- Alerting and Activator behavior require implementation and testing.
- RLS tests require clear documentation of which identities and environments were actually tested.
- AI-generated code and documentation require manual review and repeatable validation.
- Synthetic outcomes cannot support claims of real business savings or service improvement.

## Evidence still to capture

- [ ] Actual source and layer row counts
- [ ] Actual successful pipeline run and failure recovery
- [ ] Actual semantic model storage mode
- [ ] Actual KPI reconciliation results
- [ ] Actual RLS test evidence, if implemented
- [ ] Actual report performance observations
- [ ] Actual event-processing latency, if streaming is implemented
- [ ] Actual deployment method and constraints

## How to report results

Use measured statements such as “reconciled 500 synthetic orders across Gold and the semantic model” only after performing that test and recording the result. Do not use invented performance percentages, business impact, or latency.
