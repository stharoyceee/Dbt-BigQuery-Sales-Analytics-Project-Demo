# Sales Analytics ELT Pipeline (dbt & BigQuery)

An end-to-end data engineering project built with **dbt (Data Build Tool)** and **Google BigQuery**. This pipeline ingests raw synthetic sales transactions, applies reusable Jinja macro transformations to classify records into dynamic time windows, aggregates regional product performance, and validates data integrity with automated schema tests.

---

## Architecture & Data Flow

```text
BigQuery Raw Table (raw_sales)
        │
        ▼
[ Staging Model: stg_sales ]  ──► Applies dynamic_partition macro (Recent vs. Historical)
        │
        ▼
[ Mart Model: sales_final ]   ──► Aggregates total_orders & total_revenue by country & product
        │
        ▼
[ Data Quality Tests ]        ──► Validates non-null constraints on key business fields
