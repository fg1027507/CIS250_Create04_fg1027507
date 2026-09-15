-- Exercise 1
SELECT   c.first_name,
         c.last_name,
         count(*) AS total_orders
FROM     gs_customers AS c
         INNER JOIN
         gs_orders AS o
         ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY c.last_name, c.first_name;

-- Exercise 2
SELECT   c.first_name,
         c.last_name,
         c.email_address
FROM     gs_customers AS c
         INNER JOIN
         gs_orders AS o
         ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.email_address
HAVING   count(*) > 1
ORDER BY c.first_name, c.last_name;

-- Exercise 3
SELECT   p.product_name,
         sum(oi.quantity) AS total_ordered
FROM     gs_products AS p
         INNER JOIN
         gs_order_items AS oi
         ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY p.product_name;

-- Exercise 4
SELECT   a.state_code,
         count(*) AS total_customers
FROM     gs_customers AS c
         INNER JOIN
         gs_addresses AS a
         ON c.shipping_address_id = a.address_id
GROUP BY a.state_code
ORDER BY a.state_code;

-- Scenario
SELECT   o.order_id,
         c.first_name,
         c.last_name,
         c.email_address,
         sum((oi.item_price - oi.discount_amount) * oi.quantity) AS order_total
FROM     gs_orders AS o
         INNER JOIN
         gs_customers AS c
         ON o.customer_id = c.customer_id
         INNER JOIN
         gs_order_items AS oi
         ON o.order_id = oi.order_id
GROUP BY o.order_id, c.customer_id, c.first_name, c.last_name, c.email_address
ORDER BY order_total;