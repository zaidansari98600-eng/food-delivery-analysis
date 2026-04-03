CREATE DATABASE food_analysis;
USE food_analysis;

CREATE TABLE food_orders (
    order_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    cuisine_type VARCHAR(50),
    city VARCHAR(50),
    meal_type VARCHAR(20),
    order_date DATE,
    order_time TIME,
    order_value INT,
    delivery_time_mins INT,
    rating DECIMAL(2,1),
    online_payment VARCHAR(5),
    discount_applied VARCHAR(5),
    discount_amount INT
);

USE food_analysis;
SELECT COUNT(*) FROM food_orders;
USE food_analysis;
SELECT COUNT(*) FROM food_delivery_data;
USE food_analysis;
SELECT * FROM food_delivery_data LIMIT 5;

SELECT city, 
       ROUND(AVG(order_value), 2) AS avg_order_value,
       COUNT(*) AS total_orders
FROM food_delivery_data
GROUP BY city
ORDER BY avg_order_value DESC;


SELECT cuisine_type,
       COUNT(*) AS total_orders,
       ROUND(AVG(order_value), 2) AS avg_order_value
FROM food_delivery_data
GROUP BY cuisine_type
ORDER BY total_orders DESC;

SELECT city,
       ROUND(AVG(delivery_time_mins), 1) AS avg_delivery_time,
       MIN(delivery_time_mins) AS fastest_delivery,
       MAX(delivery_time_mins) AS slowest_delivery
FROM food_delivery_data
GROUP BY city
ORDER BY avg_delivery_time ASC;

SELECT HOUR(order_time) AS hour_of_day,
       COUNT(*) AS total_orders,
       ROUND(AVG(order_value), 2) AS avg_order_value
FROM food_delivery_data
GROUP BY hour_of_day
ORDER BY total_orders DESC
LIMIT 10;

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
