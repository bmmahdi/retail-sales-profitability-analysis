# User Stories — Retail Sales Performance & Profitability Analysis

Priorities follow **MoSCoW** (Must / Should / Could / Won't).

---

### US-01 — Headline KPIs
**As a** Sales Director **I want** a single view of total sales, profit and margin **so that** I can report performance to the board.
**Priority:** Must

```gherkin
Given the cleaned Superstore dataset
When the analyst opens the dashboard
Then total sales, total profit and profit margin are displayed
And the values match outputs/summary.json
```

### US-02 — Category profitability
**As a** Category Manager **I want** sales and profit broken down by product category **so that** I can prioritise the most profitable lines.
**Priority:** Must

```gherkin
Given the dataset grouped by Product Category
When I view the category chart
Then each category shows total sales and total profit
And categories are sorted by sales descending
```

### US-03 — Sub-category loss detection
**As a** Category Manager **I want** to see loss-making sub-categories **so that** I can reprice or discontinue them.
**Priority:** Must

```gherkin
Given sub-categories with negative total profit
When I run sql/05_top_subcategories.sql
Then loss-making sub-categories are flagged with status 'Loss-making'
```

### US-04 — Regional profit
**As a** Sales Director **I want** profit by region **so that** I can rebalance promotions geographically.
**Priority:** Must

```gherkin
Given the dataset grouped by Region
When I view the region chart
Then each region shows total profit
And negative-profit regions are highlighted
```

### US-05 — Discount impact
**As a** Finance Analyst **I want** to see profit margin by discount band **so that** I can set a maximum discount policy.
**Priority:** Must

```gherkin
Given orders bucketed into discount bands
When I view the discount chart
Then each band shows its profit margin
And bands above 15% show negative margin
```

### US-06 — Discount cap recommendation
**As a** Finance Analyst **I want** a recommended maximum discount per category **so that** margin erosion is controlled.
**Priority:** Should

```gherkin
Given the discount impact analysis
When the analyst reviews the recommendations
Then a maximum discount threshold is proposed per category
And the rationale is documented
```

### US-07 — Shipping cost efficiency
**As an** Operations Manager **I want** shipping cost as a % of sales by ship mode **so that** I can negotiate carrier rates.
**Priority:** Must

```gherkin
Given the dataset grouped by Ship Mode
When I view the shipping chart
Then each mode shows average shipping cost and cost as % of sales
```

### US-08 — Delivery lead time
**As an** Operations Manager **I want** average lead time by ship mode **so that** I can align service promises with cost.
**Priority:** Should

```gherkin
Given Ship Date and Order Date
When lead time is computed in days
Then each ship mode shows its average lead time
```

### US-09 — Ship-mode policy
**As an** Operations Manager **I want** a recommended ship-mode policy **so that** we use the cheapest adequate mode.
**Priority:** Should

```gherkin
Given the shipping efficiency analysis
When the analyst reviews recommendations
Then a default ship mode is proposed per order priority
```

### US-10 — Monthly trend
**As a** Sales Director **I want** a monthly sales and profit trend **so that** I can spot seasonality.
**Priority:** Should

```gherkin
Given orders grouped by month
When I view the trend chart
Then sales and profit are plotted over time
```

### US-11 — Excel model
**As a** Finance Analyst **I want** an Excel model with inputs and formulas **so that** I can run what-if scenarios.
**Priority:** Could

```gherkin
Given the Excel model
When I change the discount cap input
Then the projected profit recalculates via formulas
```

### US-12 — Stakeholder deck
**As a** Sales Director **I want** a short slide deck summarising findings **so that** I can present to leadership.
**Priority:** Must

```gherkin
Given the analysis is complete
When I open slides.json
Then it contains 6-8 slides covering problem, data, method, findings, recommendations and next steps
```
