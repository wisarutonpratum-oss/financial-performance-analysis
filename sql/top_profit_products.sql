-- =========================================================
-- File: top_profit_products.sql
-- Project: Financial Performance Analysis
-- Purpose:
--   Identify the individual products generating the largest profits.
-- =========================================================

SELECT
    p.ProductID,
    p.ProductName,
    p.ModelName,
    ROUND(SUM(o.LineTotal), 2) AS revenue,
    ROUND(SUM(o.OrderQty * p.StandardCost), 2) AS cost,
    ROUND(SUM(o.LineTotal) - SUM(o.OrderQty * p.StandardCost), 2) AS profit,
    ROUND(
        (SUM(o.LineTotal) - SUM(o.OrderQty * p.StandardCost)) * 100.0 / NULLIF(SUM(o.LineTotal), 0),
        2
    ) AS margin_pct,
    SUM(o.OrderQty) AS units_sold
FROM orders o
JOIN products p
    ON o.ProductID = p.ProductID
GROUP BY
    p.ProductID,
    p.ProductName,
    p.ModelName
ORDER BY profit DESC
LIMIT 10;