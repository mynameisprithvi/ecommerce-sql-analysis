# E-Commerce Analytics Using SQL (The Look E-Commerce Dataset)

## Overview
This project builds an analytical layer for a fictional e-commerce company using
the *The Look E-Commerce* dataset. The goal is to analyze revenue growth, customer
behavior, and product performance using SQL, following the workflow a data analyst
or BI analyst would use in a real business setting.

The emphasis is on defining clear KPIs, writing reproducible queries, validating data
integrity, and producing analysis-ready outputs suitable for dashboarding or reporting.

---

## Data Source
The dataset used in this project originates from the public
**The Look E-Commerce** dataset, which is commonly accessed via Google BigQuery.

For this project, the dataset was **downloaded and imported into a local MySQL
environment** and queried using **MySQL Workbench**. All queries in this repository
use **MySQL-compatible SQL syntax**.

No raw data is stored or versioned in this repository.

---

## Dataset Overview
Key tables used in the analysis include:

- `order_items` – line-level transaction data (item prices, revenue)
- `orders` – order-level metadata and timestamps
- `users` – customer information
- `products` – product attributes and categories

Revenue calculations are performed at the **order item level**, which represents the
true transactional grain of the dataset.

---

## Business Questions
The analysis focuses on answering the following questions:

1. Is revenue growing over time, and how stable is that growth?
2. How does order volume change over time?
3. Are customers primarily new or returning?
4. Which product categories drive the most revenue versus order volume?
5. How is demand distributed across countries?

---

## Key Metrics (KPIs)
- Total Revenue
- Number of Orders
- Average Order Value (AOV)
- Revenue by Product Category
- Orders by Country
- New vs Returning Customer Revenue

Metric definitions are implemented directly in SQL and documented through comments
within each query.

---

## Analysis Structure

Each SQL file addresses a specific analytical purpose:

- data/
  - orders.csv
  - order_items.csv
  - products.csv
  - users.csv

- sql/
  - 01_data_validation.sql
  - 02_revenue_trends.sql
  - 03_customer_behavior.sql
  - 04_product_performance.sql
  - 05_orders_by_country.sql

- result_tables/
  - 02_revenue_trends.csv
  - 03_customer_behavior.csv
  - 04_product_performance.csv
  - 05_orders_by_country.csv

- powerbi/
  - ecommerce_dashboard.pbix
  - screenshots/
    - overview.png
    - customer_behavior.png
    - product_performance.png

- README.md


Queries are written to be modular, readable, and reusable.

---

## Data Validation Notes
A small number of orders (202) were identified with no associated order items.
These orders were excluded from revenue calculations, as they do not represent
completed transactions.

---

## Tools Used
- MySQL
- MySQL Workbench
- SQL (aggregation, joins, subqueries)
- Power BI (for downstream visualization)

---

## Limitations
- The analysis is descriptive and does not imply causality.
- Pricing, marketing campaigns, and operational constraints are not explicitly modeled.
- Results reflect historical data and should be interpreted as analytical insights rather
  than forecasts.

---

## Visualization
The results of the SQL analysis were visualized in Power BI using aggregated query
outputs. The dashboard includes overview metrics, customer behavior trends, and
product performance breakdowns. Screenshots of key dashboard pages are included
in the `powerbi/` directory.

---


## Status
Complete. This project focuses on SQL-driven business analysis and metric definition,
with results designed for use in BI dashboards or reporting workflows.

