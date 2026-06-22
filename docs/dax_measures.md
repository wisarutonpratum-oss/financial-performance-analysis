# DAX Measures

## Overview

This document lists the main DAX measures used in the **Financial Performance Analysis** project.

The measures were designed to support three business goals:

1. **Track overall financial performance**

   - Revenue

   - Cost

   - Gross Profit

   - Gross Margin %

   - Average Order Value

2. **Evaluate product profitability**

   - category-level and subcategory-level performance

   - revenue vs cost vs profit comparisons

3. **Monitor time-based performance**

   - monthly trends

   - Year-to-Date (YTD) performance

   - comparison with prior year

---

# Core Financial Measures

## 1) Revenue

```DAX
Revenue = SUM(orders[LineTotal])
```

## 2) Cost

```DAX
Cost = 
SUMX(
    orders,
    orders[OrderQty] * RELATED(products[StandardCost])
)
```

## 3) Gross Profit

```DAX
Gross Profit = [Revenue] - [Cost]
```

## 4) Gross Margin %

```DAX
Gross Margin % = DIVIDE([Gross Profit], [Revenue], 0)
```

## 5) Total Orders

```DAX
Total Orders = COUNT(orders[SalesOrderID])
```

## 6) Total Customers

```DAX
Total Customers = DISTINCTCOUNT(orders[CustomerID])
```

## 7) Total Products Sold

```DAX
Total Products Sold = SUM(orders[OrderQty])
```

## 8) Average Order Value (AOV)

```DAX
Average Order Value = DIVIDE([Revenue], [Total Orders], 0)
```

## 9) Revenue YTD

```DAX
Revenue YTD = TOTALYTD([Revenue], 'Calendar'[Date])
```

## 10) Gross Profit YTD

```DAX
Gross Profit YTD = TOTALYTD([Gross Profit], 'Calendar'[Date])
```

## 11) Revenue LY

```DAX
Revenue LY = CALCULATE([Revenue], SAMEPERIODLASTYEAR('Calendar'[Date]))
```

## 12) Gross Profit LY

```DAX
Gross Profit LY = CALCULATE([Gross Profit], SAMEPERIODLASTYEAR('Calendar'[Date]))
```

## 13) Revenue YTD LY

```DAX
Revenue YTD LY =
CALCULATE(
    [Revenue YTD],
    SAMEPERIODLASTYEAR('Calendar'[Date])
)
```

## 14) Gross Profit YTD LY

```DAX
Gross Profit YTD LY =
CALCULATE(
    [Gross Profit YTD],
    SAMEPERIODLASTYEAR('Calendar'[Date])
)
```

## 15) Revenue YoY %

```DAX
Revenue YoY % =
DIVIDE(
    [Revenue] - [Revenue LY],
    [Revenue LY],
    0
)
```

## 16) Gross Profit YoY %

```DAX
Gross Profit YoY % =
DIVIDE(
    [Gross Profit] - [Gross Profit LY],
    [Gross Profit LY],
    0
)
```
