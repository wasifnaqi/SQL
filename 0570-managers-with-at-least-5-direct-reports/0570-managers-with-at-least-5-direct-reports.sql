# Write your MySQL query statement below
SELECT name
FROM Employee e
WHERE id IN (SELECT managerID 
             FROM Employee
             GROUP BY managerId HAVING COUNT(*) >= 5)
  
