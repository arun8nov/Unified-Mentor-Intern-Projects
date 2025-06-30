# Coffee Sales Analysis - SQL Queries

## Overview
This document contains a collection of SQL queries designed to analyze coffee sales data. These queries provide insights into revenue trends, sales distribution by payment type, product popularity, and time-based sales trends.

## Table Used: `[Coffee sales]`
### Key Columns:
- `datetime` - Timestamp of the sale (Unique)
- `date` - Date of the sale
- `money` - Sale amount
- `cash_type` - Payment method (Card/Cash)
- `coffee_name` - Product sold

## SQL Queries Included

### 1. Data Integrity Check
- **Ensure `datetime` column is unique:**
  ```sql
  ALTER TABLE [Coffee sales] ADD CONSTRAINT unique_datetime UNIQUE (datetime);
  ```
- **Find duplicate `datetime` entries:**
  ```sql
  SELECT datetime, COUNT(datetime) AS value_count
  FROM [Coffee sales]
  GROUP BY datetime
  HAVING COUNT(datetime) > 1;
  ```

### 2. Revenue Analysis
- **Total Revenue in 2024:**
  ```sql
  SELECT ROUND(SUM(money), 2) AS Total_Revenue_2024 FROM [Coffee sales];
  ```
- **Revenue by Payment Method:**
  ```sql
  SELECT cash_type, ROUND(SUM(money), 2) AS Cash_Type_Revenue_2024
  FROM [Coffee sales]
  GROUP BY cash_type;
  ```
- **Monthly Revenue Breakdown:**
  ```sql
  SELECT FORMAT(date, 'MMM') AS Month, ROUND(SUM(money), 2) AS Monthly_Revenue
  FROM [Coffee sales]
  GROUP BY FORMAT(date, 'MMM')
  ORDER BY SUM(money) DESC;
  ```
- **Daily Revenue:**
  ```sql
  SELECT date, ROUND(SUM(money), 2) AS Day_Revenue
  FROM [Coffee sales]
  GROUP BY date
  ORDER BY date;
  ```

### 3. Product Sales Analysis
- **Total revenue by product:**
  ```sql
  SELECT coffee_name, ROUND(SUM(money), 2) AS Product_Revenue_by_Year
  FROM [Coffee sales]
  GROUP BY coffee_name
  ORDER BY ROUND(SUM(money), 2) DESC;
  ```
- **Monthly revenue by product:**
  ```sql
  SELECT coffee_name, FORMAT(date, 'MMM') AS Month, ROUND(SUM(money), 2) AS Monthly_Revenue
  FROM [Coffee sales]
  GROUP BY FORMAT(date, 'MMM'), coffee_name
  ORDER BY coffee_name, FORMAT(date, 'MMM');
  ```
- **Product sales count over the year:**
  ```sql
  SELECT coffee_name, COUNT(coffee_name) AS count_of_sales
  FROM [Coffee sales]
  GROUP BY coffee_name
  ORDER BY count_of_sales DESC;
  ```

### 4. Time-Based Trends
- **Weekly revenue analysis:**
  ```sql
  SELECT DATENAME(weekday, date) AS Week_Day, ROUND(SUM(money), 2) AS Week_Day_Revenue
  FROM [Coffee sales]
  GROUP BY DATENAME(weekday, date)
  ORDER BY DATENAME(weekday, date);
  ```
- **Hourly revenue trend:**
  ```sql
  SELECT DATEPART(hour, datetime) AS Hour_, SUM(ROUND(money, 2)) AS Hourly_Revenue
  FROM [Coffee sales]
  GROUP BY DATEPART(hour, datetime)
  ORDER BY DATEPART(hour, datetime);
  ```
- **Top 3 highest sales hours:**
  ```sql
  SELECT TOP 3 DATEPART(hour, datetime) AS Hour_, SUM(ROUND(money, 2)) AS Hourly_Revenue
  FROM [Coffee sales]
  GROUP BY DATEPART(hour, datetime)
  ORDER BY SUM(ROUND(money, 2)) DESC;
  ```
- **Top 3 lowest sales hours:**
  ```sql
  SELECT TOP 3 DATEPART(hour, datetime) AS Hour_, SUM(ROUND(money, 2)) AS Hourly_Revenue
  FROM [Coffee sales]
  GROUP BY DATEPART(hour, datetime)
  ORDER BY SUM(ROUND(money, 2)) ASC;
  ```

### 5. Average Sales Analysis
- **Overall average sales:**
  ```sql
  SELECT ROUND(AVG(money), 2) AS AVG_Sales_Over_Year FROM [Coffee sales];
  ```
- **Average sales per month:**
  ```sql
  SELECT FORMAT(datetime, 'MMM') AS Month, ROUND(AVG(money), 2) AS AVG_Sales_Over_Month
  FROM [Coffee sales]
  GROUP BY FORMAT(datetime, 'MMM')
  ORDER BY ROUND(AVG(money), 2) DESC;
  ```
- **Average sales per hour:**
  ```sql
  SELECT DATEPART(hour, datetime) AS Hour, ROUND(AVG(money), 2) AS AVG_Hour_Sales
  FROM [Coffee sales]
  GROUP BY DATEPART(hour, datetime)
  ORDER BY DATEPART(hour, datetime);
  ```

## Usage
- Ensure your database has a `Coffee sales` table with the necessary columns.
- Run the queries in an SQL environment (e.g., SQL Server, MySQL, PostgreSQL).
- Modify date filters as needed to analyze different time periods.

## Notes
- The `datetime` column is set as `UNIQUE` to prevent duplicate entries.
- Date formatting uses `FORMAT()` and `DATENAME()` for better readability.
- Ensure your database supports functions like `DATEPART()`, `DATENAME()`, and `FORMAT()`.

