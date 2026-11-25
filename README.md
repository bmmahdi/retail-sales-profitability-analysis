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

- Technology leads with $5.98M sales and 14.81% profit margin, while Furniture has $5.18M sales but only 2.27% margin.
- Ontario and Prarie have the highest profit margins at 11.32%, whereas West (8.26%) and Nunavut (2.44%) lag.
- Discounts above 6% severely erode profitability: 6-10% band margin is 7.8%, and 20%+ band is -49.76%.
- Shipping costs are 0.72% of sales; Delivery Truck has the highest cost per line ($45.35) and cost percentage (0.83%).
- Four loss-making subcategories exist, but top subcategories like Binders (30.05% margin) and Telephones (16.78%) drive profit.
- Average lead time is 2 days, with Express Air and Regular Air having similar shipping cost percentages (0.66% and 0.64%).

**Recommendations**
- Cap discounts at 5% for most products, especially in Furniture, to prevent margin erosion; review and eliminate loss-making subcategories.
- Investigate and reduce shipping costs for Delivery Truck, which has a much higher cost per line, and optimize shipping mode selection.
- Focus marketing and inventory efforts on high-margin subcategories like Binders (30.05%) and Telephones (16.78%) to boost overall profitability.

<details><summary>🇫🇷 Résumé en français</summary>

Cette analyse examine les ventes et la rentabilité par catégorie de produits et par région, révélant que la Technologie génère le plus de profit tandis que le Meuble souffre de faibles marges. Les remises supérieures à 6% réduisent considérablement la rentabilité, et les coûts d'expédition varient selon le mode, le camion de livraison étant le plus coûteux par ligne.

- La Technologie domine avec 5,98 M$ de ventes et une marge de 14,81%, tandis que le Meuble génère 5,18 M$ mais seulement 2,27% de marge.
- L'Ontario et les Prairies affichent les meilleures marges (11,32%), suivis de l'Atlantique (11,86%), alors que l'Ouest (8,26%) et le Nunavut (2,44%) sont à la traîne.
- Les remises supérieures à 6% érodent fortement la rentabilité : la marge de la tranche 6-10% est de 7,8%, et celle de 20%+ est de -49,76%.
- Les coûts d'expédition représentent 0,72% des ventes ; le camion de livraison a le coût par ligne le plus élevé (45,35$) et le pourcentage le plus élevé (0,83%).
- Quatre sous-catégories sont déficitaires, mais les meilleures comme les classeurs (marge 30,05%) et les téléphones (16,78%) génèrent du profit.
- Le délai de livraison moyen est de 2 jours, avec des pourcentages de coût d'expédition similaires pour Express Air (0,66%) et Regular Air (0,64%).

</details>

## Dashboard

📊 **Interactive dashboard:** https://bmmahdi.github.io/retail-sales-profitability-analysis/

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
