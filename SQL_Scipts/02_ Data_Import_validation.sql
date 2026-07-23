SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE
    'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Books.csv'
INTO TABLE Books
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE
    'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Customers.csv'
INTO TABLE Customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE
    'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Orders.csv'
INTO TABLE Orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT *
FROM Books;

SELECT *
FROM Customers;

SELECT *
FROM Orders;

SELECT COUNT(*) AS Total_Books
FROM Books;

SELECT COUNT(*) AS Total_Customers
FROM Customers;

SELECT COUNT(*) AS Total_Orders
FROM Orders;

SELECT *
FROM Books
WHERE Title IS NULL
    OR Author IS NULL
    OR Genre IS NULL
    OR Price IS NULL;

SELECT *
FROM Customers
WHERE Name IS NULL
    OR Email IS NULL
    OR Country IS NULL;

SELECT *
FROM Orders
WHERE Customer_ID IS NULL
    OR Book_ID IS NULL
    OR Order_Date IS NULL
    OR Quantity IS NULL
    OR Total_Amount IS NULL;

SELECT
    Book_ID,
    COUNT(*)
FROM Books
GROUP BY Book_ID
HAVING COUNT(*) > 1;

SELECT
    Customer_ID,
    COUNT(*)
FROM Customers
GROUP BY Customer_ID
HAVING COUNT(*) > 1;

SELECT
    Order_ID,
    COUNT(*)
FROM Orders
GROUP BY Order_ID
HAVING COUNT(*) > 1;

SELECT *
FROM Orders o
LEFT JOIN Customers c
    ON o.Customer_ID = c.Customer_ID
WHERE c.Customer_ID IS NULL;

SELECT *
FROM Orders o
LEFT JOIN Books b
    ON o.Book_ID = b.Book_ID
WHERE b.Book_ID IS NULL;

SELECT *
FROM Books
WHERE Price < 0;

SELECT *
FROM Books
WHERE Stock < 0;

SELECT *
FROM Orders
WHERE Quantity <= 0;

SELECT *
FROM Orders
WHERE Total_Amount <= 0;

SELECT
    MIN(Order_Date) AS First_Order,
    MAX(Order_Date) AS Latest_Order
FROM Orders;

SELECT *
FROM Books
LIMIT 10;

SELECT *
FROM Customers
LIMIT 10;

SELECT *
FROM Orders
LIMIT 10;