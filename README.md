# 🛒 Retail Product Analysis with SQL – Zepto Dataset

## 📊 Overview
This project demonstrates how SQL can be used for **data cleaning, transformation, and business insights** in a retail context.  
The dataset represents product-level information from Zepto, including pricing, discounts, stock availability, and inventory details.

---

## 🛠️ Tech Stack
- SQL (PostgreSQL/MySQL)
- Aggregations, Joins, Window Functions, CTEs
- Data Cleaning & Manipulation Queries
- Business KPI Analysis

---

## 🧹 Data Cleaning & Manipulation
Key steps performed:
- Identified **stock vs. out-of-stock** products.
- Detected and flagged **duplicate items**.
- Removed products with **zero price values**.
- Converted **paise into rupees** for consistency.
- Categorized products by **weight (Low, Medium, Bulk)**.

---

## 🎯 Business Insights & KPIs
The project highlights several business-critical metrics:

- **Top 10 Best-Value Products** → Highest discount percentages.  
- **Top 5 High-MRP Out-of-Stock Products** → Potential lost revenue.  
- **Estimated Revenue by Category** → Total potential earnings.  
- **Expensive Products with Minimal Discounts** → Pricing inefficiency.  
- **Top 5 Categories by Avg. Discount** → Customer attraction strategy.  
- **Price per Gram Analysis** → Value-for-money metric.  
- **Inventory Weight Distribution** → Segmentation into Low/Medium/Bulk.

---

## 📈 Sample Queries
### 1. Detecting Duplicate Items
```sql
SELECT name, COUNT(sku_id) 
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY COUNT(sku_id) DESC;
