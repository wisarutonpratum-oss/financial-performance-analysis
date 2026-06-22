-- =========================================================
-- File: subcategory_profitability.sql
-- Project: Financial Performance Analysis
-- Purpose:
--   Drill down from category level to subcategory level
--   to identify the exact product lines driving losses or profits.
-- =========================================================

SELECT
    psc.SubCategoryName AS sub_category,
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
JOIN product_sub_categories psc
    ON p.SubCategoryID = psc.SubCategoryID
JOIN product_categories pc
    ON psc.CategoryID = pc.CategoryID
GROUP BY psc.SubCategoryName
ORDER BY profit ASC;