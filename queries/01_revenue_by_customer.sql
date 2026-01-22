SELECT
  c.full_name,
  SUM(oi.quantity * oi.unit_price) AS total_spent
FROM retail.customers c
JOIN retail.orders o ON c.customer_id = o.customer_id
JOIN retail.order_items oi ON o.order_id = oi.order_id
GROUP BY c.full_name;
