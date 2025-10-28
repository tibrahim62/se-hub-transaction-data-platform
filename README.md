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

```

### Application Setup {#application-setup}

1. Clone the repository  
2. Install dependencies  
3. Run the app  

#### Commands (optional)

```bash
# Clone
# Clone
git clone https://github.com/tibrahim62/se-hub-transaction-data-platform.git
cd se-hub-transaction-data-platform

# (Optional) Run SQL scripts from sqlplus (you’ll be prompted for the password)
# Use a DB alias or wallet alias (e.g., DBNAME_HIGH)
sqlplus admin@your_db_alias @schema.sql
sqlplus admin@your_db_alias @sample_data.sql
sqlplus admin@your_db_alias @plsql_packages.sql
sqlplus admin@your_db_alias @reports_queries.sql
sqlplus admin@your_db_alias @jobs_scheduler.sql

```
<p align="right"><a href="#table-of-contents">⬆️ Back to top</a></p>

---

## Author

Built by **Tarek I. Adam** – Oracle Cloud Certified Professional  
as a public demonstration of practical Oracle AI Vector Search for transportation analytics.  
[LinkedIn](https://www.linkedin.com/in/tarek-i-adam) | [GitHub](https://github.com/tibrahim62)
