# ============================
# Sales Analysis
# ============================

# Total Revenue Generated
SELECT
    ROUND(SUM(Total_Amount), 2) AS Total_Revenue
FROM Orders;

# Total Books Sold
SELECT
    SUM(Quantity) AS Total_Books_Sold
FROM Orders;

# Average Order Value
SELECT
    ROUND(AVG(Total_Amount), 2) AS Average_Order_Value
FROM Orders;

# Largest Order
SELECT *
FROM Orders
ORDER BY Total_Amount DESC
LIMIT 1;

# ============================
# Inventory Analysis
# ============================

# Books Out of Stock
SELECT
    Book_ID,
    Title,
    Stock
FROM Books
WHERE Stock = 0;

# Low Stock Books
SELECT
    Book_ID,
    Title,
    Stock
FROM Books
WHERE Stock < 10
ORDER BY Stock;

# Most Expensive Books
SELECT
    Title,
    Author,
    Price
FROM Books
ORDER BY Price DESC
LIMIT 10;

# Cheapest Books
SELECT
    Title,
    Author,
    Price
FROM Books
ORDER BY Price ASC
LIMIT 10;

# ============================
# Customer Analysis
# ============================

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
    COUNT(*) AS Total_Customers
FROM Customers
GROUP BY City
ORDER BY Total_Customers DESC;

# Customers Without Email
SELECT *
FROM Customers
WHERE Email IS NULL;

# ============================
# Product Analysis
# ============================

# Books by Genre
SELECT
    Genre,
    COUNT(*) AS Total_Books
FROM Books
GROUP BY Genre
ORDER BY Total_Books DESC;

# Books by Author
SELECT
    Author,
    COUNT(*) AS Books_Written
FROM Books
GROUP BY Author
ORDER BY Books_Written DESC;

# Average Price by Genre
SELECT
    Genre,
    ROUND(AVG(Price), 2) AS Average_Price
FROM Books
GROUP BY Genre
ORDER BY Average_Price DESC;

# Inventory Value by Genre
SELECT
    Genre,
    ROUND(SUM(Price * Stock), 2) AS Inventory_Value
FROM Books
GROUP BY Genre
ORDER BY Inventory_Value DESC;

# ============================
# Order Trend Analysis
# ============================

# Orders by Date
SELECT
    Order_Date,
    COUNT(*) AS Orders
FROM Orders
GROUP BY Order_Date
ORDER BY Order_Date;

# Revenue by Date
SELECT
    Order_Date,
    ROUND(SUM(Total_Amount), 2) AS Daily_Revenue
FROM Orders
GROUP BY Order_Date
ORDER BY Order_Date;

# Orders with Quantity Greater Than 2
SELECT *
FROM Orders
WHERE Quantity > 2;

# ============================
# Business Filters
# ============================

# Books Published After 2020
SELECT *
FROM Books
WHERE Published_Year > 2020;

# Books Between $10 and $20
SELECT
    Title,
    Price
FROM Books
WHERE Price BETWEEN 10 AND 20;

# Fantasy Books
SELECT *
FROM Books
WHERE Genre = 'Fantasy';

# Books Starting with 'A'
SELECT *
FROM Books
WHERE Title LIKE 'A%';

# Authors Containing "John"
SELECT *
FROM Books
WHERE Author LIKE '%John%';

# ============================
# Aggregate Analysis
# ============================

# Number of Books per Publication Year
SELECT
    Published_Year,
    COUNT(*) AS Books
FROM Books
GROUP BY Published_Year
ORDER BY Published_Year;

# Genres Having More Than 5 Books
SELECT
    Genre,
    COUNT(*) AS Total_Books
FROM Books
GROUP BY Genre
HAVING COUNT(*) > 5;

# Authors with Average Book Price Greater Than $20
SELECT
    Author,
    ROUND(AVG(Price), 2) AS Avg_Price
FROM Books
GROUP BY Author
HAVING AVG(Price) > 20;

# Price Statistics
SELECT
    MIN(Price) AS Min_Price,
    MAX(Price) AS Max_Price,
    ROUND(AVG(Price), 2) AS Avg_Price
FROM Books;