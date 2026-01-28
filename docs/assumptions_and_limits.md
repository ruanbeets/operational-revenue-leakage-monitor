# Assumptions and Limitations

## Assumptions
- Raw data reflects upstream system outputs and is not corrected at source
- Non-numeric values in numeric fields (e.g. age = 'U') represent unknowns
- Fraud flags are binary indicators without severity levels

## Limitations
- No true transaction IDs linking all datasets
- No timestamps beyond step-based ordering
- Dataset is synthetic and not tied to real accounts

## Implications
- Reconciliation focuses on structural consistency, not financial settlement
- Cleaning logic must be conservative to avoid false certainty
- Results are illustrative of process, not absolute revenue figures
