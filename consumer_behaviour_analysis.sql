-- Total Sales Revenue: Provides an overall view of the sales performance.
SELECT sum(purchase_amount) AS Total_Sales FROM shopping_behaviour;

-- Customer Retention Rate: Helps identify the proportion of repeat customers, indicating loyalty.
SELECT 
(COUNT(CASE WHEN previous_purchases > 0 THEN customer_id END) / COUNT(customer_id)) * 100 AS customer_retention_rate
FROM shopping_behaviour;

-- Average Purchase Amount: Shows the typical spending per transaction, which can indicate customer value.
SELECT AVG(purchase_amount) AS Average_Purchase_Amount FROM shopping_behaviour;

-- Discount Utilisation Rate: Reveals how often customers use discounts, which may suggest price sensitivity.
SELECT 
    (COUNT(CASE WHEN discount_applied = 'YES' THEN customer_id END) / COUNT(customer_id)) * 100 AS Discount_Utilisation_Rate
FROM shopping_behaviour;

-- Top Product by Revenue: Identifies the single product generating the highest sales, highlighting key revenue drivers.
SELECT item_purchased, 
SUM(purchase_amount) AS Total_Revenue
FROM shopping_behaviour
GROUP BY item_purchased
ORDER BY Total_Revenue DESC
LIMIT 1;

-- Average Review Rating: Shows overall customer satisfaction, providing insight into product quality and customer experience.
SELECT AVG(review_rating) FROM shopping_behaviour;


-- Total Sales by Category

SELECT category, SUM(purchase_amount) AS Total_Sales FROM shopping_behaviour
GROUP BY category;

-- Average Purchase Amount by Season

SELECT season, AVG(purchase_amount) AS Avg_Purchase_Amount FROM shopping_behaviour
GROUP BY season
ORDER BY Avg_Purchase_Amount ASC;

-- Discount Utilisation Rate by Category

SELECT 
    category, (COUNT(CASE WHEN discount_applied = 'YES' THEN customer_id END) / COUNT(customer_id)) * 100 AS Discount_Utilisation_Rate
FROM shopping_behaviour
GROUP BY category;

-- Top 5 Products by Revenue

SELECT item_purchased, 
SUM(purchase_amount) AS Total_Revenue
FROM shopping_behaviour
GROUP BY item_purchased
ORDER BY Total_Revenue DESC
LIMIT 5; 

-- Average Review Rating by Category

SELECT category, AVG(review_rating) AS Avg_Review_Rating FROM shopping_behaviour
GROUP BY category;