# View All Books
SELECT *
FROM Books;

# Count Total Books
SELECT COUNT(*) AS Total_Books
FROM Books;

# List Unique Genres
SELECT DISTINCT Genre
FROM Books;

# List Unique Authors
SELECT DISTINCT Author
FROM Books;

# Price Range
SELECT
    MIN(Price) AS Cheapest_Book,
    MAX(Price) AS Costliest_Book
FROM Books;

# Average Book Price
SELECT
    ROUND(AVG(Price), 2) AS Average_Price
FROM Books;

# Total Inventory
SELECT
    SUM(Stock) AS Total_Stock
FROM Books;

# Books Out of Stock
SELECT *
FROM Books
WHERE Stock = 0;

# Top 10 Most Expensive Books
SELECT *
FROM Books
ORDER BY Price DESC
LIMIT 10;

# Top 10 Cheapest Books
SELECT *
FROM Books
ORDER BY Price
LIMIT 10;

# View Customers
SELECT *
FROM Customers;

# Count Total Customers
SELECT COUNT(*) AS Total_Customers
FROM Customers;

# Countries Available
SELECT DISTINCT Country
FROM Customers;

# Cities Available
SELECT DISTINCT City
FROM Customers;

# Customers by Country
SELECT
    Country,
    COUNT(*) AS Total_Customers
FROM Customers
GROUP BY Country
ORDER BY Total_Customers DESC;

# Customers by City
SELECT
    City,
    COUNT(*) AS Customers
FROM Customers
GROUP BY City
ORDER BY Customers DESC;

# View Orders
SELECT *
FROM Orders;

# Count Total Orders
SELECT COUNT(*) AS Total_Orders
FROM Orders;

# First and Last Order
SELECT
    MIN(Order_Date) AS First_Order,
    MAX(Order_Date) AS Latest_Order
FROM Orders;

# Total Revenue
SELECT
    ROUND(SUM(Total_Amount), 2) AS Revenue
FROM Orders;

# Average Order Value
SELECT
    ROUND(AVG(Total_Amount), 2) AS Average_Order_Value
FROM Orders;

# Total Quantity Sold
SELECT
    SUM(Quantity) AS Books_Sold
FROM Orders;

# Largest Order
SELECT *
FROM Orders
ORDER BY Total_Amount DESC
LIMIT 1;

# Smallest Order
SELECT *
FROM Orders
ORDER BY Total_Amount
LIMIT 1;

# Check Duplicate Books
SELECT
    Book_ID,
    COUNT(*)
FROM Books
GROUP BY Book_ID
HAVING COUNT(*) > 1;

# Check Duplicate Customers
SELECT
    Customer_ID,
    COUNT(*)
FROM Customers
GROUP BY Customer_ID
HAVING COUNT(*) > 1;

# Check Duplicate Orders
SELECT
    Order_ID,
    COUNT(*)
FROM Orders
GROUP BY Order_ID
HAVING COUNT(*) > 1;

# Check Null Values in Books
SELECT *
FROM Books
WHERE Title IS NULL
    OR Author IS NULL
    OR Price IS NULL;