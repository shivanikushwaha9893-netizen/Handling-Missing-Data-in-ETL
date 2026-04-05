SET SQL_SAFE_UPDATES = 0;

DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50),
    Monthly_Sales INT,
    Income INT,
    Region VARCHAR(20)
);

INSERT INTO customers VALUES
(101, 'Rahul Mehta', 'Mumbai', 12000, 65000, 'West'),
(102, 'Anjali Rao', 'Bengaluru', NULL, NULL, 'South'),
(103, 'Suresh Iyer', 'Chennai', 15000, 72000, 'South'),
(104, 'Neha Singh', 'Delhi', NULL, NULL, 'North'),
(105, 'Amit Verma', 'Pune', 18000, 58000, NULL),
(106, 'Karan Shah', 'Ahmedabad', NULL, 61000, 'West'),
(107, 'Pooja Das', 'Kolkata', 14000, NULL, 'East'),
(108, 'Riya Kapoor', 'Jaipur', 16000, 69000, 'North');

UPDATE customers c
JOIN (SELECT AVG(Monthly_Sales) AS avg_sales FROM customers) t
SET c.Monthly_Sales = t.avg_sales
WHERE c.Monthly_Sales IS NULL;

UPDATE customers c
JOIN (SELECT AVG(Income) AS avg_income FROM customers) t
SET c.Income = t.avg_income
WHERE c.Income IS NULL;

UPDATE customers
SET Region = 'West'
WHERE City = 'Pune' AND Region IS NULL;

SELECT * FROM customers;