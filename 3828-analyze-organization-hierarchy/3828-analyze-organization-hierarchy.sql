# Write your MySQL query statement below

WITH RECURSIVE employee_hierarchy AS (
SELECT employee_id,
       employee_name,
       manager_id,
       salary,
       1 AS level
FROM Employees

UNION ALL

SELECT e1.employee_id,
       e1.employee_name,
       e2.manager_id,
       e1.salary AS salary,
       e1.level + 1 AS level
FROM Employees e2
INNER JOIN employee_hierarchy e1 ON e1.manager_id = e2.employee_id), 

final AS (
SELECT e.employee_id,
       e.employee_name,
       e.salary,
       h.level
FROM Employees e
JOIN 
(SELECT employee_id, 
        level 
FROM employee_hierarchy 
WHERE manager_id IS NULL) h
ON e.employee_id = h.employee_id)

SELECT f.employee_id,
       f.employee_name,
       f.level,
       COALESCE(eh.team_size, 0) AS team_size,
       f.salary + COALESCE(eh.budget,0) AS budget
FROM final f 
LEFT JOIN 
(SELECT manager_id AS employee_id,
       COUNT(*) AS team_size,
       SUM(salary) AS budget
FROM employee_hierarchy
WHERE manager_id IS NOT NULL
GROUP BY manager_id) eh
ON f.employee_id = eh.employee_id
ORDER BY level, budget DESC, employee_name ;

