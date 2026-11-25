# Retail Sales Performance & Profitability Analysis

[![Analysis](https://github.com/bmmahdi/retail-sales-profitability-analysis/actions/workflows/analysis.yml/badge.svg)](https://github.com/bmmahdi/retail-sales-profitability-analysis/actions/workflows/analysis.yml) ![Python](https://img.shields.io/badge/Python-pandas-1f4e79?style=flat-square) ![SQL](https://img.shields.io/badge/SQL-SQLite-1f4e79?style=flat-square) ![Business Analysis](https://img.shields.io/badge/Business-Analysis-1f4e79?style=flat-square)

## Business problem

A retail company sells Office Supplies, Technology and Furniture across Canadian
provinces. Sales are growing, but profitability is uneven: some categories,
regions and discount levels erode margin, and ship-mode choices are made by
habit rather than by cost or priority.

**Business question:** Which product categories and regions drive sales and
profit, and how can a retail company optimize discounting and shipping
strategies to improve profitability?

## Dataset

- **Source:** Superstore sales dataset (public, widely used for BI practice).
- **Size:** 8,399 order lines, 21 columns, 2010–2012.
- **Key fields:** Sales, Profit, Discount, Shipping Cost, Ship Mode, Order
  Priority, Region, Province, Product Category, Product Sub-Category.
- **Licence:** Public dataset distributed for educational and portfolio use.
  No personally identifying information is used beyond customer names already
  present in the public file.

## Approach

1. **SQL** (`sql/`) — 5 SQLite queries answering category, region, discount,
   shipping and sub-category questions.
2. **Python** (`notebooks/analysis.py`) — pandas cleaning, calculated fields
   (profit margin, shipping cost ratio, lead time), KPI computation,
   matplotlib charts, JSON exports.
3. **Excel model** (`excel_model.json`) — inputs, formulas and a summary sheet
   for what-if discount-cap scenarios.
4. **Dashboard** (`docs/index.html`) — reads `docs/dashboard.json` and
   `docs/data/*.json`.
5. **Stakeholder deck** (`slides.json`) — 8 slides for leadership.

## Repository structure

```
retail-sales-profitability-analysis/
├── data/
│   └── superstore.csv
├── sql/
│   ├── 01_sales_profit_by_category.sql
│   ├── 02_profit_by_region.sql
│   ├── 03_discount_impact.sql
│   ├── 04_shipping_efficiency.sql
│   └── 05_top_subcategories.sql
├── notebooks/
│   └── analysis.py
├── scripts/
│   ├── run_sql.py
│   └── check_outputs.py
├── outputs/
│   ├── charts/
│   ├── sql/
│   └── summary.json
├── docs/
│   ├── index.html
│   ├── dashboard.json
│   ├── BRD.md
│   ├── user_stories.md
│   ├── process_map.md
│   └── data/
├── excel_model.json
├── slides.json
├── requirements.txt
└── README.md
```

## How to run

```bash
# 1. Install dependencies
pip install -r requirements.txt

# 2. Run SQL queries (writes outputs/sql/*.csv)
python scripts/run_sql.py

# 3. Run the analysis notebook (writes charts, summary.json, docs/data/*.json)
jupyter nbconvert --to notebook --execute notebooks/analysis.py --output analysis.ipynb

# 4. Validate outputs
python scripts/check_outputs.py

# 5. Open the dashboard
#    Serve docs/ with any static server, e.g.:
python -m http.server 8000 --directory docs
```

## Key findings

_The analysis runs automatically with GitHub Actions; findings appear here when it finishes._

## Dashboard

📊 Dashboard: published with the project.

## Skills demonstrated

- **SQL** — multi-table aggregation, CASE bucketing, date arithmetic in SQLite.
- **Python / pandas** — data cleaning, calculated fields, groupby aggregations.
- **Data visualization** — matplotlib charts, dashboard JSON contract.
- **Excel modelling** — inputs, formulas, what-if summary.
- **Business analysis** — BRD, user stories with Gherkin, AS-IS/TO-BE process maps.
- **Communication** — stakeholder deck, README, dashboard.
- **Stakeholder management** — requirements traced from BR to FR to KPI.

## Author

**Mohamed El Mahdi Benchouikh** · [Portfolio](https://bmmahdi.github.io/)
