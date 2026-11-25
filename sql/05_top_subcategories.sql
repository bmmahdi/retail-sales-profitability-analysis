-- Business question: Which sub-categories are the biggest profit drivers and losers?
-- Ranks sub-categories by total profit and flags loss-making ones.
SELECT
    "Product Category"                          AS product_category,
    "Product Sub-Category"                      AS product_sub_category,
    ROUND(SUM("Sales"), 2)                      AS total_sales,
    ROUND(SUM("Profit"), 2)                     AS total_profit,
    ROUND(SUM("Profit") / NULLIF(SUM("Sales"), 0) * 100, 2) AS profit_margin_pct,
    CASE WHEN SUM("Profit") < 0 THEN 'Loss-making' ELSE 'Profitable' END AS status
FROM superstore
GROUP BY "Product Category", "Product Sub-Category"
ORDER BY total_profit DESC;
