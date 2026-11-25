-- Business question: Which regions generate profit, and how efficient are they?
-- Output: one row per region with sales, profit, margin and average discount.
SELECT
    "Region"                                    AS region,
    COUNT(DISTINCT "Order ID")                  AS orders,
    ROUND(SUM("Sales"), 2)                      AS total_sales,
    ROUND(SUM("Profit"), 2)                     AS total_profit,
    ROUND(SUM("Profit") / NULLIF(SUM("Sales"), 0) * 100, 2) AS profit_margin_pct,
    ROUND(AVG("Discount") * 100, 2)             AS avg_discount_pct
FROM superstore
GROUP BY "Region"
ORDER BY total_profit DESC;
