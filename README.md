<div align="center">

# 📚 Online Book Store Analytics Using SQL

### 🚀 End-to-End SQL Data Analytics Project

Transforming raw bookstore data into actionable business insights using SQL.

<img src="Images/banner.png" alt="Online Book Store Analytics banner" width="100%">

![SQL](https://img.shields.io/badge/SQL-Advanced-blue?style=for-the-badge&logo=mysql)
![MySQL](https://img.shields.io/badge/MySQL-Database-orange?style=for-the-badge&logo=mysql)
![Data Analytics](https://img.shields.io/badge/Data-Analytics-success?style=for-the-badge)
![Status](https://img.shields.io/badge/Project-Completed-brightgreen?style=for-the-badge)

</div>

---

# 📖 Project Overview

Businesses generate thousands of sales transactions every day. However, collecting data alone is not enough—organizations need meaningful insights to make informed business decisions.

This project demonstrates how SQL can be used to transform raw transactional data into valuable business intelligence.

The project simulates a real-world Online Book Store where sales, customers, books, and inventory data are analyzed to answer important business questions.

Rather than simply writing SQL queries, the project follows the complete workflow of a Data Analyst:

- Understanding business requirements
- Designing a relational database
- Importing and validating data
- Performing exploratory data analysis
- Solving business problems
- Applying advanced SQL
- Optimizing database performance
- Delivering actionable business insights

---

# 🎯 Business Problem

The Online Book Store collects large volumes of transactional data but lacks meaningful reporting to support business decisions.

Management wants answers to questions like:

- 📚 Which books generate the highest revenue?
- 📖 Which genres perform best?
- 👥 Who are the most valuable customers?
- 📈 How are monthly sales changing?
- 📦 Which books are running out of stock?
- ❌ Which books have never been sold?
- 💰 Which authors generate the highest revenue?
- 🎯 How can business profitability be improved?

Without proper analysis, these questions remain unanswered.

---

# 💡 Solution

Using SQL, the project transforms raw data into actionable insights through:

- Database Design
- Data Validation
- Exploratory Data Analysis
- Business Analysis
- SQL JOIN Operations
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- Views
- Stored Procedures
- Indexes
- Business Insight Reporting

---

# 🛠 Tech Stack

| Category | Technology |
|----------|------------|
| Database | MySQL |
| Language | SQL |
| IDE | MySQL Workbench |
| Version Control | Git & GitHub |

---

# 🗂 Database Schema

The project consists of three relational tables.

```text
Customers
     │
     │ Customer_ID
     ▼
Orders
     ▲
     │ Book_ID
Books
```

### Relationships

- One Customer → Many Orders
- One Book → Many Orders

---

# 📂 Dataset

## Books

- Book ID
- Title
- Author
- Genre
- Price
- Published Year
- Stock

---

## Customers

- Customer ID
- Name
- Email
- Phone
- City
- Country

---

## Orders

- Order ID
- Customer ID
- Book ID
- Quantity
- Order Date
- Total Amount

---

# 🚀 Project Workflow

```text
Business Understanding
        │
        ▼
Database Design
        │
        ▼
Import Dataset
        │
        ▼
Data Validation
        │
        ▼
Exploratory Data Analysis
        │
        ▼
Business Analysis
        │
        ▼
JOIN Operations
        │
        ▼
Advanced SQL
        │
        ▼
Views & Stored Procedures
        │
        ▼
Query Optimization
        │
        ▼
Business Insights Report
```

---

# 📚 SQL Concepts Covered

## Basic SQL

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- LIMIT

---

## Aggregate Functions

- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()

---

## SQL JOINs

- INNER JOIN
- LEFT JOIN
- Multiple Table JOINs

---

## Advanced SQL

- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- RANK()
- DENSE_RANK()
- ROW_NUMBER()
- PARTITION BY

---

## Database Objects

- Views
- Stored Procedures
- Indexes
- EXPLAIN

---

# 📊 Key Business Insights

## 📈 Overall Performance

- Total Orders: **500**
- Total Customers: **307**
- Total Revenue: **$75,628.66**
- Total Books Sold: **2,697**

---

## 📚 Product Insights

- Romance generated the highest revenue.
- Mystery recorded the highest number of books sold.
- Several books generated significant revenue and should remain highly visible.
- Some books have never been sold.

---

## 👥 Customer Insights

- Identified highest spending customers.
- Found inactive customers without purchases.
- Customer spending varies significantly.

---

## 📦 Inventory Insights

- Multiple books are currently out of stock.
- Some books require immediate restocking.
- Inventory planning can be improved.

---

## 📅 Sales Insights

- Monthly revenue changes throughout the year.
- Sales exhibit seasonal fluctuations.
- Peak revenue months were identified.

---

# 💼 Business Recommendations

### 📦 Inventory

- Restock high-demand books.
- Monitor inventory regularly.
- Reduce slow-moving inventory.

---

### 📈 Marketing

- Promote unsold books.
- Offer seasonal discounts.
- Focus campaigns on high-performing genres.

---

### 👥 Customers

- Launch loyalty programs.
- Reward high-value customers.
- Re-engage inactive customers.

---

### 💰 Revenue

- Expand successful genres.
- Optimize pricing strategies.
- Improve monthly sales planning.

---

# 📁 Project Structure

```text
1Online Book Store Analytics/
├── Dataset/
│   ├── Books.csv
│   ├── Customers.csv
│   └── Orders.csv
├── Documentation/
│   ├── ER_diagram.png
│   ├── Linkedln post.png
│   ├── Online Book Store Analytics Documentation.pdf
│   └── Online Book Store.png
├── Images/
│   └── banner.png
├── Insights/
│   └── Online_Book_Store_Analytics_Report.pdf
├── SQL_Scipts/
│   ├── 01_Creates_Database.sql
│   ├── 02_ Data_Import_validation.sql
│   ├── 03_EDA.sql
│   ├── 04_Analysis.sql
│   ├── 05_Analysis_Complete_data_join.sql
│   ├── 06_adv_analytics.sql
│   ├── 07_View_index.sql
│   └── 08_Business_Insights.sql
└── README.md
```

---

# 🎯 Skills Demonstrated

### SQL

- Data Cleaning
- Data Validation
- Data Analysis
- Query Optimization
- Joins
- Window Functions

### Analytics

- Business Analysis
- KPI Reporting
- Customer Analysis
- Inventory Analysis
- Revenue Analysis
- Trend Analysis

### Database

- Relational Database Design
- Views
- Stored Procedures
- Indexing

---

# 📈 Project Outcome

This project demonstrates how SQL can solve real-world business problems by converting raw transactional data into meaningful business insights.

The analysis helps management:

- Make data-driven decisions
- Improve inventory management
- Increase customer retention
- Optimize sales strategies
- Enhance overall business performance

---

# 🏆 Key Learnings

Through this project, I strengthened my understanding of:

- Relational Database Design
- SQL Query Writing
- Data Analysis
- Business Intelligence
- Query Optimization
- Analytical Thinking
- Problem Solving

---

# 📬 Connect With Me

**Rutik Tetare**

💼 Aspiring Data Analyst

🔗 LinkedIn: [rutik-tetare-3154b3281](https://www.linkedin.com/in/rutik-tetare-3154b3281/)

💻 GitHub: [Rutik-tetare29](https://github.com/Rutik-tetare29)

📧 Email: [rutiktetare@gmail.com](mailto:rutiktetare@gmail.com)

---

<div align="center">

## ⭐ If you found this project useful, consider giving it a Star!

### Thank you for visiting my project!

</div>
