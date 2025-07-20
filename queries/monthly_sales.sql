SELECT 
    DATE_TRUNC('month', o.order_date) AS month,
    COUNT(o.order_id) AS total_orders,
    ROUND(SUM(o.total_amount), 2) AS total_revenue
FROM orders o
GROUP BY month
ORDER BY month;
