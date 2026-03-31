-- E-Commerce Sales Data Analysis
-- Author: Melissa Muluvhahothe

-- 1. View Data
SELECT * FROM orders;

-- 2. Total Sales & Profit
SELECT 
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM orders;

-- 3. Sales by Region
SELECT 
    Region,
    SUM(Sales) AS total_sales
FROM orders
GROUP BY Region
ORDER BY total_sales DESC;

-- 4. Top 5 Customers
SELECT 
    "Customer Name",
    SUM(Sales) AS total_spent
FROM orders
GROUP BY "Customer Name"
ORDER BY total_spent DESC
LIMIT 5;

-- 5. Profit by Category
SELECT 
    Category,
    SUM(Profit) AS total_profit
FROM orders
GROUP BY Category
ORDER BY total_profit DESC;

-- 6. Monthly Sales Trend
SELECT 
    strftime('%Y-%m', "Order Date") AS month,
    SUM(Sales) AS total_sales
FROM orders
GROUP BY month
ORDER BY month;

-- 7. Loss-Making Products
SELECT 
    "Product Name",
    SUM(Profit) AS total_profit
FROM orders
GROUP BY "Product Name"
HAVING total_profit < 0
ORDER BY total_profit ASC;