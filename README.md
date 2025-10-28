## Table of Contents
- [Features](#features)
- [Files](#files)
- [Quick Start](#quick-start)
  - [Database Setup](#database-setup)
  - [Application Setup](#application-setup)
  - [Commands (optional)](#commands-optional)
- [Author](#author)

---

## Features
- Centralized ingestion of field system files (ETL/validation)
- PL/SQL packages for **daily reconciliation & settlements**
- Exception handling and full audit trails
- **Daily Aging Report** to monitor receivables and payment performance
- Oracle Reports/SQL queries for daily, monthly, and YTD KPIs
- Nightly scheduling via **DBMS_SCHEDULER**

## Files
- `schema.sql` — Core tables (**ACCOUNTS, TOLL_TRANSACTIONS, SETTLEMENTS, ERROR_LOG**)
- `sample_data.sql` — Minimal dataset for demo
- `plsql_packages.sql` — **PKG_RECONCILIATION** (validate & reconcile)
- `reports_queries.sql` — Daily totals, exceptions, revenue by class
- `jobs_scheduler.sql` — Nightly job to run reconciliation

---

## Quick Start

### Database Setup
```sql
-- 1) Create tables
@schema.sql

-- 2) Load sample data
@sample_data.sql

-- 3) Create PL/SQL reconciliation package
@plsql_packages.sql

-- 4) Create KPI/exception views & queries
@reports_queries.sql

-- 5) Schedule nightly reconciliation
@jobs_scheduler.sql
