# Write your MySQL query statement below
SELECT ROUND(SUM(CASE WHEN i.tiv_2015 IN (SELECT tiv_2015 FROM insurance i1 WHERE i1.pid<>i.pid) 
       AND CONCAT(i.lat,i.lon) NOT IN (SELECT CONCAT(i2.lat,i2.lon) FROM insurance i2 WHERE i2.pid<>i.pid)
       THEN tiv_2016 ELSE '0' END),2) AS tiv_2016
FROM insurance i