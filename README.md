# food-delivery-analysis
SQL analysis of 2784 food delivery orders across 8 Indian cities


-- ================================================
-- FOOD DELIVERY OPERATIONS ANALYSIS
-- Tool: MySQL | Dataset: 2,784 orders | 8 Cities
-- Analyst: Zaid Ansari
-- ================================================

USE food_analysis;

-- QUERY 1: City-wise Average Order Value
-- Insight: Jaipur has highest avg order value at Rs.1003
SELECT city, 
       ROUND(AVG(order_value), 2) AS avg_order_value,
       COUNT(*) AS total_orders
FROM food_delivery_data
GROUP BY city
ORDER BY avg_order_value DESC;

-- QUERY 2: Cuisine-wise Order Volume and Revenue
-- Insight: Fast Food most ordered, Biryani highest avg value
SELECT cuisine_type,
       COUNT(*) AS total_orders,
       ROUND(AVG(order_value), 2) AS avg_order_value
FROM food_delivery_data
GROUP BY cuisine_type
ORDER BY total_orders DESC;

-- QUERY 3: Average Delivery Time by City
-- Insight: Delhi fastest at 47.1 mins average
SELECT city,
       ROUND(AVG(delivery_time_mins), 1) AS avg_delivery_time,
       MIN(delivery_time_mins) AS fastest_delivery,
       MAX(delivery_time_mins) AS slowest_delivery
FROM food_delivery_data
GROUP BY city
ORDER BY avg_delivery_time ASC;

-- QUERY 4: Peak Ordering Hours
-- Insight: 12PM lunch and 7PM dinner are busiest hours
SELECT HOUR(order_time) AS hour_of_day,
       COUNT(*) AS total_orders,
       ROUND(AVG(order_value), 2) AS avg_order_value
FROM food_delivery_data
GROUP BY hour_of_day
ORDER BY total_orders DESC
LIMIT 10;

-- QUERY 5: Top 10 Highest Rated Restaurants
-- Insight: Subway rated highest at 4.15 among 230+ orders
SELECT restaurant_name,
       cuisine_type,
       ROUND(AVG(rating), 2) AS avg_rating,
       COUNT(*) AS total_orders,
       ROUND(AVG(order_value), 2) AS avg_order_value
FROM food_delivery_data
GROUP BY restaurant_name, cuisine_type
HAVING total_orders > 50
ORDER BY avg_rating DESC
LIMIT 10;
