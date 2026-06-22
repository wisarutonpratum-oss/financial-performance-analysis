# Star Schema

## Overview

This project uses a **star schema** in Power BI to support financial analysis across revenue, cost, profit, product hierarchy, and time-based performance.

The model is designed to answer business questions such as:

- Which product categories and subcategories are driving revenue?

- Which products are hurting profitability?

- How do revenue and profit change over time?

- How does current performance compare with previous periods?

Using a star schema makes it easier to build clean DAX measures, improve report performance, and analyze financial KPIs consistently across multiple dashboard views.

---

## Data Model Structure

### Fact Table

#### `orders`

This is the central fact table containing transactional sales data at the order-line level.

**Key columns used in analysis**

- `SalesOrderID` – order identifier

- `SalesOrderDetailID` – order line identifier

- `OrderDate` – transaction date

- `CustomerID` – customer identifier

- `ProductID` – product identifier

- `OrderQty` – quantity sold

- `LineTotal` – revenue generated from the order line

This table is used to calculate:

- Revenue

- Orders

- Quantity sold

- Customers

- Average Order Value

- Time-based financial metrics

---

### Dimension Table

#### `products`

This table provides product-level attributes and cost information.

**Key columns used in analysis**

- `ProductID`

- `ProductName`

- `ModelName`

- `StandardCost`

- `ListPrice`

- `SubCategoryID`

This table is used to:

- calculate product cost

- calculate gross profit

- analyze performance by product and model

- connect transactions to product hierarchy

---

### Dimension Table

#### `product_sub_categories`

This table groups products into subcategories.

**Key columns**

- `SubCategoryID`

- `SubCategoryName`

- `CategoryID`

This table supports analysis such as:

- Which subcategories generate the most revenue?

- Which subcategories are loss-making?

- Which product lines should be prioritized or reviewed?

Examples:

- Road Bikes

- Touring Bikes

- Mountain Bikes

- Jerseys

- Helmets

---

### Dimension Table

#### `product_categories`

This table groups subcategories into broader business categories.

**Key columns**

- `CategoryID`

- `CategoryName`

This table supports high-level category analysis, such as:

- Bikes

- Components

- Clothing

- Accessories

---

## Calendar Table

A separate **Calendar table** was created in Power BI and linked to `orders[OrderDate]`.

This table is required for:

- Year-to-Date (YTD) calculations

- Previous Year comparisons

- Monthly trend analysis

- Year-over-Year growth analysis

- Time-based slicing in the dashboard

**Typical fields included in the Calendar table**

- Date

- Year

- Month Number

- Month Name

- Quarter

- Year-Month

---

## Relationships

The model follows a star schema with `orders` at the center.

### Relationship structure

- `orders[ProductID]` → `products[ProductID]`

- `products[SubCategoryID]` → `product_sub_categories[SubCategoryID]`

- `product_sub_categories[CategoryID]` → `product_categories[CategoryID]`

- `orders[OrderDate]` → `calendar[Date]`

---

## Schema Diagram (Logical View)

```text
product_categories

        │

        ▼

product_sub_categories

        │

        ▼

products

        │

        ▼

orders  ◀──────── calendar
