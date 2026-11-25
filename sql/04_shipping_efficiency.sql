-- Business question: Which ship modes are cost-efficient and fast?
-- Computes average shipping cost per order, shipping cost as % of sales,
-- and average delivery lead time in days.
SELECT
    "Ship Mode"                                 AS ship_mode,
    COUNT(*)                                    AS line_items,
    ROUND(SUM("Shipping Cost"), 2)              AS total_shipping_cost,
    ROUND(AVG("Shipping Cost"), 2)              AS avg_shipping_cost,
    ROUND(SUM("Shipping Cost") / NULLIF(SUM("Sales"), 0) * 100, 2) AS shipping_cost_pct_of_sales,
    ROUND(AVG(julianday("Ship Date") - julianday("Order Date")), 1) AS avg_lead_time_days
FROM superstore
GROUP BY "Ship Mode"
ORDER BY avg_shipping_cost ASC;
