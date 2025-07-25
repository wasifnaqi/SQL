# Write your MySQL query statement below
SELECT id FROM (
SELECT *,
       LAG(temperature,1) OVER (ORDER bY recordDate) AS prevtemp,
       LAG(recordDate,1) OVER (ORDER bY recordDate) AS prevday
FROM weather) t
WHERE t.temperature > t.prevtemp AND DATEDIFF(t.recordDATE, prevday) = 1
