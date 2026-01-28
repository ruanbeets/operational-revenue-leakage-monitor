# Operational Revenue & Leakage Monitor (SQL)

## Overview
This project implements a SQL-first system for ingesting, validating, and preparing
transactional payment data for operational reporting and revenue leakage analysis.

It focuses on **data correctness, reconciliation readiness, and auditability**, rather
than dashboards or predictive models.

The goal is to surface **silent failures, inconsistencies, and risk signals** in
transactional systems.

---

## Business Problem
Transactional systems often fail quietly:

- malformed or inconsistent records
- mixed data quality across sources
- non-numeric values in numeric fields
- mismatched transaction representations

If these issues are not detected early, they lead to:
- incorrect revenue reporting
- hidden losses
- poor operational decisions

This project answers:

> **“Can we trust the transactional data before we report on it?”**

---

## Dataset
Synthetic financial transaction data simulating:
- customer-level payment records
- network-style transaction flows
- fraud flags
- inconsistent raw values (e.g. unknown ages)

The project intentionally preserves raw data issues to demonstrate
**real-world ingestion and cleaning discipline**.

---

## Project Structure

data/
raw/ # Original, untouched CSV files
processed/ # Reserved for derived exports

sql/
00_schema.sql # Raw table definitions
01_data_ingestion.sql # Robust CSV ingestion
02_data_cleaning.sql # Cleaning & normalization (views)
03_revenue_reconciliation.sql
04_leakage_detection.sql
05_kpi_snapshot.sql

docs/
business_context.md
assumptions_and_limits.md

reports/
kpi_definitions.md
leakage_summary.md


---

## Design Principles
- Raw tables mirror source data exactly
- No data is mutated during ingestion
- Cleaning is done via views, not overwrites
- Ambiguous values are preserved, then handled explicitly
- Scripts are runnable end-to-end via CLI

---

## Intended Use Cases
- Operations / Reporting Analysts
- Finance & Revenue Operations
- BI teams validating upstream data
- SQL-based audit or reporting services

---

## How This Can Be Reused
- Adapt schemas to other transactional systems
- Plug cleaned views into Power BI / Looker
- Use reconciliation logic for audits
- Package as a recurring data-quality check

---

## Status
Raw ingestion and validation complete.  
Cleaning, reconciliation, and leakage logic in progress.
l