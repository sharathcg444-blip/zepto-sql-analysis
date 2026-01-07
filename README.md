# Zepto SQL Data Analysis Project (PostgreSQL)

## 📌 Project Overview
This project focuses on analyzing Zepto grocery delivery data using PostgreSQL.
The goal is to answer real-world business questions related to pricing, discounts,
categories, and sales performance using SQL.

## 🛠 Tools & Technologies
- PostgreSQL
- SQL
- GitHub

## 📂 Dataset Description
The dataset contains product-level information from Zepto, including:
- product_id
- product_name
- category
- mrp
- discount_percent
- discounted_selling_price
- quantity

## 📐 Database Schema
- zepto (single table used for analysis)

## 📊 SQL Concepts Covered
- SELECT, WHERE, ORDER BY
- Filtering and sorting
- Aggregate functions (SUM, AVG, COUNT)
- GROUP BY and HAVING
- JOINs (where applicable)
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions (RANK, DENSE_RANK, LAG)
- CASE statements

## ❓ Business Questions Solved
- What are the top-selling product categories?
- Which products have the highest discounts?
- Rank products by discounted selling price within each category
- Calculate running total of sales
- Identify price trends using window functions
- Find products priced above category average


## 📁 Project Structure
```text
postgresql-sql-project/
├── README.md
├── schema/
│   └── create_tables.sql
├── data/
│   └── insert_data.sql
├── queries/
│   ├── basic_queries.sql
│   ├── joins.sql
│   ├── aggregate_queries.sql
│   ├── cte_queries.sql
│   ├── window_functions.sql
│   └── interview_queries.sql
└── insights/
    └── findings.md
```




# zepto-sql-analysis
A PostgreSQL-based SQL project covering data analysis, joins, CTEs, window functions, and business queries using real-world datasets.
