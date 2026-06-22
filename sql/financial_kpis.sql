-- =========================================================
-- File: financial_kpis.sql
-- Project: Financial Performance Analysis
-- Purpose:
--   Calculate core financial KPIs for the executive dashboard:
--   - Total Revenue
--   - Total Orders
--   - Total Customers
--   - Total Products Sold
--   - Average Order Value
--   - Total Cost
--   - Gross Profit
--   - Gross Margin %
-- =========================================================

SELECT
    ROUND(SUM(o.LineTotal), 2) AS total_revenue,
    COUNT(DISTINCT o.SalesOrderID) AS total_orders,
    COUNT(DISTINCT o.CustomerID) AS total_customers,
    SUM(o.OrderQty) AS total_products_sold,
    ROUND(SUM(o.LineTotal) / COUNT(DISTINCT o.SalesOrderID), 2) AS avg_order_value,
    ROUND(SUM(o.OrderQty * p.StandardCost), 2) AS total_cost,
    ROUND(SUM(o.LineTotal) - SUM(o.OrderQty * p.StandardCost), 2) AS gross_profit,
    ROUND(
        (SUM(o.LineTotal) - SUM(o.OrderQty * p.StandardCost)) * 100.0 / NULLIF(SUM(o.LineTotal), 0),
        2
    ) AS gross_margin_pct
FROM orders o
JOIN products p
    ON o.ProductID = p.ProductID;