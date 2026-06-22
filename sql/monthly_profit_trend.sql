-- =========================================================
-- File: monthly_profit_trend.sql
-- Project: Financial Performance Analysis
-- Purpose:
--   Track monthly revenue, cost, and profit trends to identify
--   seasonality and periods of profit deterioration.
-- =========================================================

SELECT
    EXTRACT(YEAR FROM o.OrderDate) AS order_year,
    EXTRACT(MONTH FROM o.OrderDate) AS order_month,
    ROUND(SUM(o.LineTotal), 2) AS revenue,
    ROUND(SUM(o.OrderQty * p.StandardCost), 2) AS cost,
    ROUND(SUM(o.LineTotal) - SUM(o.OrderQty * p.StandardCost), 2) AS profit,
    ROUND(
        (SUM(o.LineTotal) - SUM(o.OrderQty * p.StandardCost)) * 100.0 / NULLIF(SUM(o.LineTotal), 0),
        2
    ) AS margin_pct
FROM orders o
JOIN products p
    ON o.ProductID = p.ProductID
GROUP BY
    EXTRACT(YEAR FROM o.OrderDate),
    EXTRACT(MONTH FROM o.OrderDate)
ORDER BY order_year, order_month;