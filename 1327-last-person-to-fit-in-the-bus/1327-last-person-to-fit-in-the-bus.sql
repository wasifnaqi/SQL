# Write your MySQL query statement below
WITH final AS
(
SELECT *,
       SUM(weight) OVER (ORDER BY turn) AS total_weight
FROM queue
ORDER BY 4)

SELECT person_name 
FROM final
WHERE total_weight<=1000
ORDER BY total_weight DESC
LIMIT 1