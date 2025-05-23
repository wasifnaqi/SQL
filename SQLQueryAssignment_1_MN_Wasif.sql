CREATE DATABASE Assignment_1
USE Assignment_1

SELECT * FROM Salesman
SELECT * FROM Customer
SELECT * FROM Orders
--Salesman table creation
CREATE TABLE Salesman 
(
SalesmanId INT,
Name VARCHAR(255),
Commission DECIMAL(10, 2),
City VARCHAR(255),
Age INT
);

--Salesman record insertion
INSERT INTO Salesman (SalesmanId, Name, Commission, City, Age)
VALUES
(101, 'Joe', 50, 'California', 17),
(102, 'Simon', 75, 'Texas', 25),
(103, 'Jessie', 105, 'Florida', 35),
(104, 'Danny', 100, 'Texas', 22),
(105, 'Lia', 65, 'New Jersey', 30);

--Customer table creation
CREATE TABLE Customer 
(
SalesmanId INT,
CustomerId INT,
CustomerName VARCHAR(255),
PurchaseAmount INT,
);

--Customer record insertion
INSERT INTO Customer (SalesmanId, CustomerId, CustomerName, PurchaseAmount)
VALUES
(101, 2345, 'Andrew', 550),
(103, 1575, 'Lucky', 4500),
(104, 2345, 'Andrew', 4000),
(107, 3747, 'Remona', 2700),
(110, 4004, 'Julia', 4545);

--Orders table creation
CREATE TABLE Orders 
(
OrderId int, 
CustomerId int, 
SalesmanId int, 
Orderdate Date, 
Amount money
)

--Orders record insertion
INSERT INTO Orders 
Values
(5001,2345,101,'2021-07-01',550),
(5003,1234,105,'2022-02-15',1500);

--1. Insert a new record in your Orders table.
INSERT INTO Orders 
Values
(5002,1575,103,'2023-04-16',4500);

--2. Add Primary key constraint for SalesmanId column in Salesman table. Add default
--	 constraint for City column in Salesman table. Add Foreign key constraint for SalesmanId
--	 column in Customer table. Add not null constraint in Customer_name column for the
--	 Customer table.
--Add Primary key constraint for SalesmanId column in Salesman table.

ALTER TABLE Salesman
ALTER COLUMN SalesmanID INT NOT NULL;

ALTER TABLE Salesman
ADD Primary Key (SalesmanId);

--Add default constraint for City column in Salesman table.

ALTER TABLE Salesman
ALTER COLUMN City VARCHAR(255) NOT NULL;

--Add Foreign key constraint for SalesmanId column in Customer table. 

ALTER TABLE Customer
ADD FOREIGN KEY (SalesmanId) REFERENCES Salesman(SalesmanId); 

--Add not null constraint in Customer_name column for the Customer table.
ALTER TABLE Customer
ALTER COLUMN CustomerName VARCHAR(255) NOT NULL;

--3. Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase
--	 amount value greater than 500.
--Fetch the data where the Customer’s name is ending with ‘N’  
SELECT *
FROM Customer
WHERE CustomerName LIKE '%n';
--Get the purchase amount value greater than 500.
SELECT *
FROM Customer
WHERE PurchaseAmount > 500;

--4.	Using SET operators, retrieve the first result with unique SalesmanId values from two tables, 
--	    and the other result containing SalesmanId with duplicates from two tables.
SELECT SalesmanID 
FROM Salesman
UNION
Select SalesmanID 
FROM Customer
ORDER BY SalesmanId;

SELECT SalesmanID 
FROM Salesman
UNION ALL
Select SalesmanID 
FROM Customer
ORDER BY SalesmanId;

--5.	Display the below columns which has the matching data.Orderdate, Salesman Name, Customer Name, Commission, and City which has the range of Purchase Amount between 500 to 1500.
SELECT o.Orderdate, 
	   s.Name, 
	   c.CustomerName, 
	   s.Commission,
	   s.City
FROM Salesman s 
INNER JOIN Customer c ON s.SalesmanId = c.SalesmanId
INNER JOIN Orders o ON o.CustomerId = c.CustomerId
WHERE c.PurchaseAmount >= 500 AND c.PurchaseAmount <= 1500;

--6.	Using right join fetch all the results from Salesman and Orders table.
SELECT *
FROM Salesman s1
RIGHT JOIN Orders o1 ON s1.SalesmanId = o1.SalesmanId;



