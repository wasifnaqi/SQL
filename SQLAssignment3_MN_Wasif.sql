--SQL Assignment 2 Submitted By M N Wasif 11-05-2025

USE Assignment_2

SELECT * FROM Jomato

--1. Create a stored procedure to display the restaurant name, type and cuisine where the table booking is not zero.

CREATE PROCEDURE table_booking AS 
SELECT RestaurantName,
       RestaurantType,
       CuisinesType
FROM Jomato
WHERE tablebooking <> 0

EXEC table_Booking

--2. Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result and rollback it.

Begin transaction
UPDATE Jomato
SET CuisinesType = 'Cafeteria'
WHERE CuisinesType = 'Cafe';

SELECT * 
FROM Jomato
WHERE CuisinesType = 'Cafeteria'

ROLLBACK TRANSACTION 

--3. Generate a row number column and find the top 5 areas with the highest rating of restaurants.

SELECT TOP 5 DENSE_RANK () OVER (ORDER BY Rating DESC) as Row_Number,
       Area
FROM Jomato

--4. Use the while loop to display the 1 to 50.

DECLARE @Count INT
SET @Count = 1
WHILE (@Count<=50)
BEGIN
PRINT @Count
SET @Count = @count+1 
END

--5. Write a query to Create a Top rating view to store the generated top 5 highest rating of restaurants.

CREATE VIEW top_rating AS
SELECT	TOP(5) DENSE_RANK() OVER (ORDER BY rating DESC) as Ranking,
	    *
FROM Jomato
    
SELECT * FROM top_rating


--6. Create a trigger that give an message whenever a new record is inserted.

CREATE TRIGGER RestaurantInsertedTrigger
ON Jomato
AFTER INSERT
AS
BEGIN
    PRINT 'A new record has been inserted into the Jomato1 table.';
END;
