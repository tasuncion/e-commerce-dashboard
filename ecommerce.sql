USE project1;

/**
-- revenue and growth
**/

-- what is olist's overall revenue?
SELECT 
    ROUND(SUM(p.payment_value), 2) AS total_revenue
FROM payments p
JOIN orders o ON p.order_id = o.order_id
WHERE o.order_status = 'delivered';

-- what is the monthly revenue with growth %?
SELECT 
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    ROUND(SUM(p.payment_value), 2) AS monthly_revenue,
    ROUND(
        (SUM(p.payment_value) - LAG(SUM(p.payment_value)) OVER (ORDER BY DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m')))
        / LAG(SUM(p.payment_value)) OVER (ORDER BY DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m')) * 100, 
    2) AS growth_pct
FROM payments p
JOIN orders o ON p.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY month
ORDER BY month;

-- what is the total value of goods sold (Gross Merchandise Value)
SELECT ROUND(SUM(payment_value), 2) AS gmv
FROM payments p
JOIN orders o ON p.order_id = o.order_id
WHERE o.order_status = 'delivered';

-- what are the top 10 product categories by revenue & order volume? 
-- also include the average item price for each product category.
SELECT 
    ct.product_category_name_english AS category,
    COUNT(DISTINCT oi.order_id) AS num_orders,
    ROUND(SUM(oi.price), 2) AS revenue,
    ROUND(AVG(oi.price), 2) AS avg_item_price
FROM orderitems oi
JOIN products pr 
    ON oi.product_id = pr.product_id
LEFT JOIN cattranslation ct 
    ON pr.product_category_name = ct.product_category_name
GROUP BY ct.product_category_name_english
ORDER BY revenue DESC
LIMIT 10;

-- what $ of revenue comes from each state?
SELECT 
    c.customer_state,
    ROUND(SUM(p.payment_value), 2) AS total_revenue,
    ROUND(SUM(p.payment_value) / (SELECT SUM(payment_value) FROM payments) * 100, 2) AS pct_revenue
FROM orders o
JOIN payments p ON o.order_id = p.order_id
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_state
ORDER BY pct_revenue DESC;

-- what is the revenue by review score?
SELECT 
    r.review_score,
    COUNT(DISTINCT r.order_id) AS num_orders,
    ROUND(SUM(p.payment_value), 2) AS total_revenue,
    ROUND(AVG(p.payment_value), 2) AS avg_order_value
FROM reviews r
JOIN payments p ON r.order_id = p.order_id
JOIN orders o ON r.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY r.review_score
ORDER BY r.review_score DESC;

-- what is the monthly order seasonality?
SELECT 
    DATE_FORMAT(order_purchase_timestamp, '%Y-%m') AS month,
    COUNT(order_id) AS num_orders
FROM orders
WHERE order_status = 'delivered'
GROUP BY month
ORDER BY month;

/**
-- average order value
**/

-- what is olist's overall average order value?
SELECT 
    ROUND(SUM(p.payment_value) / COUNT(DISTINCT o.order_id), 2) AS avg_order_value
FROM orders o
JOIN payments p ON o.order_id = p.order_id
WHERE o.order_status = 'delivered';

-- what about average order value by month?
SELECT 
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    ROUND(SUM(p.payment_value) / COUNT(DISTINCT o.order_id), 2) AS avg_order_value
FROM payments p
JOIN orders o ON p.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY month
ORDER BY month;

-- what is olist's average order value by product category?
SELECT 
    ct.product_category_name_english AS category,
    ROUND(SUM(oi.price) / COUNT(DISTINCT oi.order_id), 2) AS avg_order_value
FROM orderitems oi
JOIN products pr ON oi.product_id = pr.product_id
LEFT JOIN cattranslation ct 
       ON pr.product_category_name = ct.product_category_name
GROUP BY ct.product_category_name_english
ORDER BY avg_order_value DESC
LIMIT 10;

-- what about the average order value by payment method?
SELECT 
    p.payment_type,
    ROUND(SUM(p.payment_value) / COUNT(DISTINCT o.order_id), 2) AS avg_order_value
FROM payments p
JOIN orders o ON p.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY p.payment_type
ORDER BY avg_order_value DESC;

/**
-- customer metrics
**/

-- how many repeat customers are there?
SELECT customer_id, COUNT(DISTINCT order_id) as orders
FROM orders
WHERE order_status = 'delivered'
GROUP BY customer_id
HAVING COUNT(DISTINCT order_id) > 1;

-- what is the customer density by state?
SELECT 
    c.customer_state,
    COUNT(DISTINCT c.customer_id) AS num_customers
FROM customers c
GROUP BY c.customer_state
ORDER BY num_customers DESC;

/**
seller metrics
**/

-- how many sellers are active by each month with growth %?
SELECT 
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    COUNT(DISTINCT oi.seller_id) AS active_sellers,
    ROUND(
        (
            COUNT(DISTINCT oi.seller_id) -
            LAG(COUNT(DISTINCT oi.seller_id)) OVER (ORDER BY DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m'))
        ) / LAG(COUNT(DISTINCT oi.seller_id)) OVER (ORDER BY DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m')) * 100,
    2) AS growth_pct
FROM orders o
JOIN orderitems oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY month
ORDER BY month;

-- which sellers have the highest revenue?
SELECT 
    oi.seller_id,
    ROUND(SUM(oi.price), 2) AS total_revenue,
    COUNT(DISTINCT oi.order_id) AS num_orders
FROM orderitems oi
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY oi.seller_id
ORDER BY total_revenue DESC
LIMIT 10;

-- what about by category?
SELECT 
    oi.seller_id,
    ct.product_category_name_english AS category,
    ROUND(SUM(oi.price), 2) AS total_revenue,
    COUNT(DISTINCT oi.order_id) AS num_orders
FROM orderitems oi
JOIN products pr ON oi.product_id = pr.product_id
LEFT JOIN cattranslation ct 
       ON pr.product_category_name = ct.product_category_name
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY oi.seller_id, category
ORDER BY total_revenue DESC
LIMIT 15;

/** 
logistics and operations
**/

-- what is the average delivery time in days?
SELECT 
    ROUND(AVG(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp)), 2) AS avg_delivery_days
FROM orders
WHERE order_status = 'delivered';

-- what is the cancellation rate? (% of orders not fulfilled)
SELECT 
    ROUND(SUM(CASE WHEN order_status IN ('canceled','unavailable') THEN 1 ELSE 0 END) 
				/ COUNT(*) * 100, 2) AS cancellation_rate
FROM orders;

-- what is the average delivery days per customer state?
SELECT 
    c.customer_state,
    ROUND(AVG(DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp)), 2) AS avg_delivery_days
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_state
ORDER BY avg_delivery_days DESC;

-- do delivery speeds affect customer satisfaction by state?
SELECT 
    c.customer_state,
    ROUND(AVG(DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp)), 2) AS avg_delivery_days,
    ROUND(AVG(r.review_score), 2) AS avg_review_score
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN reviews r ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_state
ORDER BY avg_delivery_days DESC;

-- what is the late delivery rate?
SELECT 
    ROUND(SUM(CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1 ELSE 0 END) 
          / COUNT(*) * 100, 2) AS late_delivery_rate
FROM orders o
WHERE o.order_status = 'delivered';

-- what is the % of orders delivered on time?
SELECT 
    ROUND(SUM(CASE WHEN o.order_delivered_customer_date <= o.order_estimated_delivery_date THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS on_time_delivery_rate
FROM orders o
WHERE o.order_status = 'delivered';

-- % of late deliveries by state?
SELECT 
    c.customer_state,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1 ELSE 0 END) AS late_orders,
    ROUND(SUM(CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS late_delivery_pct
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_state
ORDER BY late_delivery_pct DESC;

/**
payments
**/

-- how are the payment methods distributed?
SELECT 
    p.payment_type,
    COUNT(*) AS num_payments,
    ROUND(COUNT(*) / (SELECT COUNT(*) FROM payments) * 100, 2) AS pct_of_total
FROM payments p
GROUP BY p.payment_type
ORDER BY num_payments DESC;

-- what about by product category?
SELECT 
    ct.product_category_name_english AS category,
    p.payment_type,
    COUNT(*) AS num_payments,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY ct.product_category_name_english),
    2) AS pct_within_category
FROM payments p
JOIN orders o ON p.order_id = o.order_id
JOIN orderitems oi ON o.order_id = oi.order_id
JOIN products pr ON oi.product_id = pr.product_id
LEFT JOIN cattranslation ct 
       ON pr.product_category_name = ct.product_category_name
WHERE o.order_status = 'delivered'
GROUP BY category, p.payment_type
ORDER BY category, pct_within_category DESC;

-- what is the payment usage by state (with percentages)
SELECT 
    c.customer_state,
    p.payment_type,
    COUNT(*) AS num_payments,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY c.customer_state),
    2) AS pct_within_state
FROM payments p
JOIN orders o ON p.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_state, p.payment_type
ORDER BY c.customer_state, pct_within_state DESC;

/** 
products and categories
**/

-- what are the top 10 products overall by total revenue?
SELECT 
    oi.product_id,
    ct.product_category_name_english AS category,
    ROUND(SUM(oi.price), 2) AS total_revenue,
    COUNT(DISTINCT oi.order_id) AS num_orders
FROM orderitems oi
JOIN products pr ON oi.product_id = pr.product_id
LEFT JOIN cattranslation ct 
       ON pr.product_category_name = ct.product_category_name
GROUP BY oi.product_id, ct.product_category_name_english
ORDER BY total_revenue DESC
LIMIT 10;

-- what is the product performance by average rating?
SELECT 
    pr.product_id,
    ct.product_category_name_english AS category,
    ROUND(AVG(r.review_score), 2) AS avg_review_score,
    COUNT(DISTINCT oi.order_id) AS num_orders,
    ROUND(SUM(oi.price), 2) AS revenue
FROM orderitems oi
JOIN products pr ON oi.product_id = pr.product_id
LEFT JOIN cattranslation ct ON pr.product_category_name = ct.product_category_name
JOIN reviews r ON oi.order_id = r.order_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY pr.product_id, category
HAVING COUNT(DISTINCT oi.order_id) >= 10 -- only keep products with 10+ sales...
ORDER BY avg_review_score DESC, revenue DESC
LIMIT 20;

-- what is the average profit margin per category?
SELECT 
    ct.product_category_name_english AS category,
    ROUND(SUM(oi.price - oi.freight_value), 2) AS total_margin,
    ROUND(AVG(oi.price - oi.freight_value), 2) AS avg_margin_per_item,
    ROUND(SUM(oi.price - oi.freight_value) / SUM(oi.price) * 100, 2) AS margin_pct
FROM orderitems oi
JOIN products pr ON oi.product_id = pr.product_id
LEFT JOIN cattranslation ct ON pr.product_category_name = ct.product_category_name
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY category
ORDER BY margin_pct DESC
LIMIT 15;

-- which product categories have the most inconsistent profit?
SELECT 
    ct.product_category_name_english AS category,
    ROUND(STDDEV_SAMP((oi.price - oi.freight_value) / oi.price * 100), 2) AS margin_volatility,
    ROUND(AVG((oi.price - oi.freight_value) / oi.price * 100), 2) AS avg_margin_pct
FROM orderitems oi
JOIN products pr ON oi.product_id = pr.product_id
LEFT JOIN cattranslation ct ON pr.product_category_name = ct.product_category_name
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY category
ORDER BY margin_volatility DESC
LIMIT 15;

-- what is the monthly profit trend by category?
SELECT 
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    ct.product_category_name_english AS category,
    ROUND(SUM(oi.price - oi.freight_value), 2) AS total_margin,
    ROUND(SUM(oi.price - oi.freight_value) / SUM(SUM(oi.price - oi.freight_value)) OVER (PARTITION BY DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m')) * 100, 2) AS margin_share
FROM orderitems oi
JOIN products pr ON oi.product_id = pr.product_id
LEFT JOIN cattranslation ct ON pr.product_category_name = ct.product_category_name
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY month, category
ORDER BY month, total_margin DESC;

-- what is the average freight cost? how does it vary by category?
SELECT 
    ct.product_category_name_english AS category,
    ROUND(AVG(oi.freight_value), 2) AS avg_freight,
    ROUND(AVG(oi.price), 2) AS avg_price,
    ROUND(AVG(oi.freight_value) / AVG(oi.price) * 100, 2) AS freight_pct_of_price
FROM orderitems oi
JOIN products pr ON oi.product_id = pr.product_id
LEFT JOIN cattranslation ct ON pr.product_category_name = ct.product_category_name
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY category
ORDER BY freight_pct_of_price DESC
LIMIT 15;

-- how do product return/cancellation rates vary by category?
SELECT 
    ct.product_category_name_english AS category,
    ROUND(SUM(CASE WHEN o.order_status IN ('canceled','unavailable') THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS cancellation_rate
FROM orders o
JOIN orderitems oi ON o.order_id = oi.order_id
JOIN products pr ON oi.product_id = pr.product_id
LEFT JOIN cattranslation ct ON pr.product_category_name = ct.product_category_name
GROUP BY category
ORDER BY cancellation_rate DESC
LIMIT 15;


