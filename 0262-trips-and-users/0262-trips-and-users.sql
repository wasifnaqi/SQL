# Write your MySQL query statement below
SELECT t.request_at AS Day,
       ROUND(SUM(IF (status <> 'completed', 1,0))/COUNT(*),2) AS "Cancellation Rate"
FROM Trips t
JOIN Users u  ON t.client_id = u.users_id 
JOIN  Users u1 ON t.driver_id = u1.users_id 
WHERE u.banned = 'No' AND u1.banned = 'No' 
AND request_at BETWEEN '2013-10-01' AND '2013-10-03' 
GROUP BY 1