-- =========================================================
-- File: yearly_profit_trend.sql
-- Project: Financial Performance Analysis
-- Purpose:
--   Track yearly financial performance to evaluate whether
--   revenue growth is translating into profit growth.
-- =========================================================

SELECT
    EXTRACT(YEAR FROM o.OrderDate) AS order_year,
    ROUND(SUM(o.LineTotal), 2) AS revenue,
    ROUND(SUM(o.OrderQty * p.StandardCost), 2) AS cost,
    ROUND(SUM(o.LineTotal) - SUM(o.OrderQty * p.StandardCost), 2) AS profit,
    ROUND(
        (SUM(o.LineTotal) - SUM(o.OrderQty * p.StandardCost)) * 100.0 / NULLIF(SUM(o.LineTotal), 0),
        2
    ) AS margin_pct,
    COUNT(DISTINCT o.SalesOrderID) AS total_orders,
    COUNT(DISTINCT o.CustomerID) AS total_customers
FROM orders o
JOIN products p
    ON o.ProductID = p.ProductID
GROUP BY EXTRACT(YEAR FROM o.OrderDate)
ORDER BY order_year;