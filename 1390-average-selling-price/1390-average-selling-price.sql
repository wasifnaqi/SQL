# Write your MySQL query statement below
SELECT p.product_id,
       CASE WHEN SUM(u.units) = 0 THEN 0       
       ELSE IFNULL(ROUND(SUM(p.price*u.units)/SUM(u.units),2),0) END AS average_price
FROM Prices p
LEFT JOIN UnitsSold u ON p.product_id = u.product_id
AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id
