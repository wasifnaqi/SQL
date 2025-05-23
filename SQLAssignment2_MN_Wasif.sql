--SQL Assignement 2 submitted by M N Wasif 11-05-2025

CREATE DATABASE Assignment_2
USE  Assignment_2

SELECT * FROM Jomato

--1. Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. Eg: ‘Quick Chicken Bites’.

DROP FUNCTION dbo.quickchickenbites

CREATE FUNCTION dbo.quickchickenbites(@restauranttype VARCHAR(100))
RETURNS TABLE
AS
RETURN (
    SELECT *,
           STUFF(RestaurantType, CHARINDEX('Quick Bites', RestaurantType), LEN('Quick '), 'Quick Chicken') AS quickchickenbites
    FROM Jomato
    WHERE UPPER(RestaurantType) LIKE '%' + UPPER(@restauranttype) + '%'
);

SELECT * FROM dbo.quickchickenbites('quick bites');

--2. Use the function to display the restaurant name and cuisine type which has the maximum number of rating.

SELECT RestaurantName,
	   CuisinesType
FROM Jomato
WHERE Rating IN (SELECT MAX(Rating) FROM Jomato);

--3. Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4 star rating, ‘Good’ if it has above 3.5 
--and below 4 star rating, ‘Average’ if it is above 3
--and below 3.5 and ‘Bad’ if it is below 3 star rating 

SELECT *,
	   CASE WHEN Rating >= 4 THEN 'Excellent'
	   WHEN Rating BETWEEN 3.5 AND 4 THEN 'Good'
	   WHEN Rating BETWEEN 3 AND 3.5 THEN 'Average'
	   ELSE 'Bad' END AS Rating_Status
FROM Jomato;

--4. Find the Ceil, floor and absolute values of the rating column and display the current
--date and separately display the year, month_name and day.

SELECT CEILING(Rating) AS ceil_value,
	   FLOOR(Rating) AS floor_value,
	   ABS(Rating) AS abs_value
FROM Jomato;

SELECT CONVERT(DATE, SYSDATETIME())AS 'current_date',
       DATENAME(YEAR, GETDATE()) AS current_year,
	   DATENAME(MONTH, GETDATE()) AS current_month,
	   DATENAME(DAY, GETDATE()) AS current_day;

--5. Display the restaurant type and total average cost using rollup.

SELECT RestaurantType,
	   SUM(AverageCost) AS total_average_cost
FROM Jomato
GROUP BY ROLLUP(RestaurantType);