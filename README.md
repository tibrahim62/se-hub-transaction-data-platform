# SE HUB – South East HUB Transaction Data Platform

**Period:** Apr 2018 – Mar 2020  
**Stack:** Oracle Database 19c · PL/SQL · Oracle Forms · Oracle Reports · DBMS_SCHEDULER

SE HUB is an Oracle-based transactional data platform used to consolidate toll operations across regional systems. It provides nightly ETL, automated reconciliation/settlement logic, and operational reports for finance and operations.

## Features
- Centralized ingestion of field system files (ETL/validation)
- PL/SQL packages for **daily reconciliation & settlements**
- Exception handling and audit trails
- **Daily Aging Report generation** to monitor outstanding receivables and payment performance
- Oracle Reports/SQL queries for daily, monthly, and YTD KPIs
- Job scheduling via **DBMS_SCHEDULER**


## Files
- `schema.sql` – Core tables (ACCOUNTS, TOLL_TRANSACTIONS, SETTLEMENTS, ERROR_LOG)
- `sample_data.sql` – Minimal dataset for demo
- `plsql_packages.sql` – `PKG_RECONCILIATION` (validate + reconcile)
- `reports_queries.sql` – Daily totals, exceptions, revenue by class
- `jobs_scheduler.sql` – Nightly job to run reconciliation

> Developed by **Tarek I. Adam** (Conduent) – Oracle Certified Cloud Consultant
