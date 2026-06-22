# financial-performance-analysis
Financial performance analysis of AdventureWorks data using SQL and Power BI to uncover loss-making product lines and profitability trends.

## 1. Overview
Analyzed AdventureWorks sales and product data to evaluate financial performance, uncover loss-making product lines, and identify the key drivers behind declining profitability over time.

## 2. Business Problem
The business was generating strong revenue, but profitability remained weak and even turned negative in several periods.

The main stakeholder questions were:

- Which product categories and subcategories are driving revenue but hurting profit?
- Is the business consistently unprofitable, or are losses concentrated in specific years or months?
- Which product lines should the business scale, fix, or deprioritize to improve financial performance?

---

## 3. Tools & Process

### SQL
- Joined transactional sales data with product, subcategory, and category tables
- Aggregated revenue, orders, quantity sold, and customer counts
- Calculated product-level and category-level revenue, cost, and gross profit
- Performed root cause analysis to identify loss-making categories and subcategories

### Python
- Used for initial data inspection and validation of dataset structure
- Checked row counts, date ranges, and consistency across related tables before modeling

### Power BI
- Built a star schema using fact and dimension tables
- Created DAX measures for Revenue, Cost, Gross Profit, Gross Margin %, Average Order Value, YTD, and YoY metrics
- Designed dashboards for executive overview, product profitability analysis, and time intelligence
- Visualized monthly revenue and profit trends to detect seasonality and profit deterioration over time

---

## 4. Key Findings

- The business generated **$80.49M in total revenue** but ended with **-$2.32M gross profit**, resulting in an overall **gross margin of -2.88%**.
- **Bikes** accounted for **$66.33M in revenue** (about **82% of total revenue**) but produced **-$3.18M in gross profit**, making it the primary driver of the company’s losses.
- At the subcategory level, **Road Bikes** generated **$29.39M in revenue** but lost **-$2.49M**, while **Touring Bikes** generated **$10.45M** but lost **-$1.24M**.
- In contrast, **Mountain Bikes** delivered **$26.49M in revenue** and **$552K in profit**, making it the strongest-performing subcategory within the Bikes category.
- Revenue increased significantly from **$8.78M in 2011** to **$32.89M in 2013**, but profit did not scale with revenue. Gross margin fell from **0.97% in 2011** to **-5.29% in 2012**, showing that revenue growth was not translating into financial health.
- Other categories were profitable but too small to offset bike-related losses:
  - **Components:** **$11.80M revenue**, **$490K profit**
  - **Clothing:** **$1.78M revenue**, **$172K profit**
  - **Accessories:** **$571K revenue**, **$198K profit**

---

## 5. Dashboard Preview

### Executive Overview
![Financial Performance Dashboard](images/dashboard-overview.png)

---

## 6. Recommendations

### 1) Review pricing and cost structure for Bikes
Since Bikes generate the majority of revenue but also drive most of the losses, pricing strategy, discounting, and cost structure should be reviewed—especially for **Road Bikes** and **Touring Bikes**.

### 2) Prioritize profitable product lines
The business should focus more heavily on product lines with proven profitability, such as **Mountain Bikes**, **Components**, and **Accessories**, through stronger promotion, inventory support, and sales focus.

### 3) Track profitability at the subcategory level, not just total revenue
If management only monitors revenue, loss-making products can remain hidden inside strong top-line performance. Profit and gross margin should be monitored regularly by **category**, **subcategory**, and **time period**.

### 4) Build a recurring financial performance dashboard
A monthly dashboard should track:
- Revenue
- Cost
- Gross Profit
- Gross Margin %
- YTD vs Prior Year performance
- Top loss-making products

This would help stakeholders identify profitability issues earlier and make faster decisions around pricing, product mix, and cost control.

---

## 7. Project Structure

```text
financial-performance-analysis/
│
├─ README.md
├─ sql/
│  ├─ financial_kpis.sql
│  ├─ category_profitability.sql
│  ├─ subcategory_profitability.sql
│  └─ yearly_profit_trend.sql
│
├─ powerbi/
│  └─ financial_performance_dashboard.pbix
│
├─ images/
│  ├─ dashboard-overview.png
│  ├─ product-profitability.png
│  └─ time-intelligence.png
│
└─ docs/
   ├─ star_schema.md
   └─ dax_measures.md
```

---

## 8. Skills Demonstrated
- SQL joins and aggregation
- Product and category profitability analysis
- Financial KPI development
- Power BI dashboard design
- DAX measures and time intelligence
- Root cause analysis and business recommendations
