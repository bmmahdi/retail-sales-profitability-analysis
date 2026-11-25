# Business Requirements Document
## Retail Sales Performance & Profitability Analysis

| Field | Value |
|---|---|
| Document version | 1.0 |
| Status | Approved for analysis |
| Owner | Sales Director |
| Analyst | Business Analyst / Data Analyst |
| Country context | Canada |
| Dataset | Superstore sales dataset (public) |

---

## 1. Context

The retail company sells Office Supplies, Technology and Furniture products across
multiple Canadian provinces and regions. Sales are growing, but profitability is
uneven: some categories, regions and discount levels erode margin. Management
needs a data-driven view of **where profit is made and lost**, and clear guidance
on **discounting** and **shipping** policies.

## 2. Objectives

1. Quantify sales, profit and margin by product category and region.
2. Measure the impact of discounting on profitability.
3. Assess shipping cost efficiency and delivery lead time by ship mode.
4. Recommend discount caps and shipping policy changes that improve margin.

## 3. Scope

**In scope**
- Historical order-line data from the Superstore dataset (2010–2012).
- Product Category / Sub-Category, Region / Province, Customer Segment.
- Discount, Shipping Cost, Ship Mode, Order Priority, lead time.
- Descriptive analytics, KPI reporting, dashboard and recommendations.

**Out of scope**
- Forecasting / predictive modelling.
- Customer lifetime value and churn.
- Marketing attribution.
- Real-time data pipelines.

## 4. Stakeholders

| Stakeholder | Interest | Influence |
|---|---|---|
| Sales Director | Overall revenue and margin | High |
| Category Managers | Category-level profitability | High |
| Operations Manager | Shipping cost and lead time | Medium |
| Finance Analyst | Margin accuracy, discount policy | High |

## 5. Business Requirements

- **BR-01** — Provide a single view of total sales, total profit and profit margin.
- **BR-02** — Break down sales and profit by product category and sub-category.
- **BR-03** — Break down profit by region and province.
- **BR-04** — Quantify the relationship between discount level and profit margin.
- **BR-05** — Measure shipping cost efficiency (cost per order, % of sales) by ship mode.
- **BR-06** — Measure average delivery lead time by ship mode.
- **BR-07** — Identify loss-making sub-categories and regions.
- **BR-08** — Recommend a maximum discount threshold per category.
- **BR-09** — Recommend a ship-mode policy balancing cost and speed.
- **BR-10** — Deliver results via a self-service dashboard and a stakeholder deck.

## 6. Functional Requirements

- **FR-01** — The solution shall load the Superstore CSV and clean invalid rows.
- **FR-02** — The solution shall compute profit margin = Profit / Sales.
- **FR-03** — The solution shall compute shipping cost ratio = Shipping Cost / Sales.
- **FR-04** — The solution shall compute lead time = Ship Date − Order Date (days).
- **FR-05** — The solution shall bucket discounts into bands (0%, 1-5%, 6-10%, 11-15%, 16-20%, 20%+).
- **FR-06** — The solution shall expose 5 SQL queries answering BR-02 to BR-06.
- **FR-07** — The solution shall export dashboard data as JSON records.
- **FR-08** — The solution shall export a flat `summary.json` of headline KPIs.
- **FR-09** — The solution shall produce at least 4 PNG charts.
- **FR-10** — The solution shall include an Excel model with inputs, formulas and summary.

## 7. KPIs

| KPI | Definition | Target |
|---|---|---|
| Total Sales | SUM(Sales) | Growth vs prior period |
| Total Profit | SUM(Profit) | Positive |
| Profit Margin % | Profit / Sales | ≥ 12% |
| Average Discount % | AVG(Discount) | ≤ 10% |
| Sales by Category | SUM(Sales) per category | Balanced mix |
| Profit by Region | SUM(Profit) per region | All regions positive |
| Shipping Cost Efficiency | Shipping Cost / Sales | ≤ 5% |

## 8. Assumptions

- The Superstore dataset is representative of the company's order mix.
- Discounts are recorded as fractions (0.10 = 10%).
- Shipping cost is fully attributable to the order line.
- Currency is CAD; no FX conversion required.

## 9. Risks

| Risk | Impact | Mitigation |
|---|---|---|
| Data quality issues (missing dates) | Medium | Cleaning step drops invalid rows |
| Discount policy change disrupts sales | High | Pilot on one category first |
| Shipping cost data incomplete | Medium | Flag and exclude nulls from ratios |
| Stakeholder misalignment on targets | Medium | Review KPIs in kickoff |
| Over-fitting recommendations to 2010–2012 | Medium | Re-validate quarterly |
