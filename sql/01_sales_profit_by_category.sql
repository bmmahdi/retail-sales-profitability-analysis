-- Business question: Which product categories drive sales and profit?
-- Output: one row per product category with sales, profit, margin and order count.
SELECT
    "Product Category"                          AS product_category,
    COUNT(DISTINCT "Order ID")                  AS orders,
    ROUND(SUM("Sales"), 2)                      AS total_sales,
    ROUND(SUM("Profit"), 2)                     AS total_profit,
    ROUND(SUM("Profit") / NULLIF(SUM("Sales"), 0) * 100, 2) AS profit_margin_pct,
    ROUND(AVG("Discount") * 100, 2)             AS avg_discount_pct
FROM superstore
GROUP BY "Product Category"
ORDER BY total_sales DESC;
