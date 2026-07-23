# ============================
# 1 – Basic INNER JOIN
# ============================

USE online_book_store;

# Show Every Order with Book Details
SELECT
    o.Order_ID,
    b.Title,
    b.Author,
    o.Quantity,
    o.Total_Amount
FROM Orders o
INNER JOIN Books b
    ON o.Book_ID = b.Book_ID;

# Show Customer Name with Every Order
SELECT
    o.Order_ID,
    c.Name,
    o.Order_Date,
    o.Total_Amount
FROM Orders o
INNER JOIN Customers c
    ON o.Customer_ID = c.Customer_ID;

# Complete Order Report
SELECT
    o.Order_ID,
    c.Name AS Customer_Name,
    b.Title AS Book_Title,
    b.Author,
    o.Quantity,
    o.Total_Amount,
    o.Order_Date
FROM Orders o
INNER JOIN Customers c
    ON o.Customer_ID = c.Customer_ID
INNER JOIN Books b
    ON o.Book_ID = b.Book_ID
ORDER BY o.Order_Date;

# ============================
# 2 – Revenue Analysis
# ============================

# Revenue by Book
SELECT
    b.Title,
    ROUND(SUM(o.Total_Amount), 2) AS Revenue
FROM Orders o
INNER JOIN Books b
    ON o.Book_ID = b.Book_ID
GROUP BY b.Title
ORDER BY Revenue DESC;

# Revenue by Author
SELECT
    b.Author,
    ROUND(SUM(o.Total_Amount), 2) AS Revenue
FROM Orders o
INNER JOIN Books b
    ON o.Book_ID = b.Book_ID
GROUP BY b.Author
ORDER BY Revenue DESC;

# Revenue by Genre
SELECT
    b.Genre,
    ROUND(SUM(o.Total_Amount), 2) AS Revenue
FROM Orders o
INNER JOIN Books b
    ON o.Book_ID = b.Book_ID
GROUP BY b.Genre
ORDER BY Revenue DESC;

# ============================
# 3 – Customer Analysis
# ============================

# Top 10 Customers by Spending
SELECT
    c.Name,
    ROUND(SUM(o.Total_Amount), 2) AS Total_Spent
FROM Customers c
INNER JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
GROUP BY c.Name
ORDER BY Total_Spent DESC
LIMIT 10;

# Customers with Multiple Orders
SELECT
    c.Name,
    COUNT(o.Order_ID) AS Total_Orders
FROM Customers c
INNER JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
GROUP BY c.Name
HAVING COUNT(o.Order_ID) > 1
ORDER BY Total_Orders DESC;

# Books Purchased by Each Customer
SELECT
    c.Name,
    b.Title,
    o.Quantity
FROM Orders o
INNER JOIN Customers c
    ON o.Customer_ID = c.Customer_ID
INNER JOIN Books b
    ON o.Book_ID = b.Book_ID
ORDER BY c.Name;

# ============================
# 4 – Sales Analysis
# ============================

# Most Sold Books
SELECT
    b.Title,
    SUM(o.Quantity) AS Books_Sold
FROM Orders o
INNER JOIN Books b
    ON o.Book_ID = b.Book_ID
GROUP BY b.Title
ORDER BY Books_Sold DESC;

# Most Sold Authors
SELECT
    b.Author,
    SUM(o.Quantity) AS Books_Sold
FROM Orders o
INNER JOIN Books b
    ON o.Book_ID = b.Book_ID
GROUP BY b.Author
ORDER BY Books_Sold DESC;

# Most Sold Genres
SELECT
    b.Genre,
    SUM(o.Quantity) AS Books_Sold
FROM Orders o
INNER JOIN Books b
    ON o.Book_ID = b.Book_ID
GROUP BY b.Genre
ORDER BY Books_Sold DESC;

# ============================
# 5 – LEFT JOIN
# ============================

# Books Never Ordered
SELECT
    b.Book_ID,
    b.Title
FROM Books b
LEFT JOIN Orders o
    ON b.Book_ID = o.Book_ID
WHERE o.Order_ID IS NULL;

# Customers Who Never Placed an Order
SELECT
    c.Customer_ID,
    c.Name
FROM Customers c
LEFT JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
WHERE o.Order_ID IS NULL;

# ============================
# 6 – Advanced Business Analysis
# ============================

# Average Order Value by Customer
SELECT
    c.Name,
    ROUND(AVG(o.Total_Amount), 2) AS Average_Order_Value
FROM Customers c
INNER JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
GROUP BY c.Name
ORDER BY Average_Order_Value DESC;

# Highest Revenue Customer
SELECT
    c.Name,
    ROUND(SUM(o.Total_Amount), 2) AS Revenue
FROM Customers c
INNER JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
GROUP BY c.Name
ORDER BY Revenue DESC
LIMIT 1;

# Highest Revenue Book
SELECT
    b.Title,
    ROUND(SUM(o.Total_Amount), 2) AS Revenue
FROM Books b
INNER JOIN Orders o
    ON b.Book_ID = o.Book_ID
GROUP BY b.Title
ORDER BY Revenue DESC
LIMIT 1;

# Monthly Revenue
SELECT
    YEAR(o.Order_Date) AS Year,
    MONTH(o.Order_Date) AS Month,
    ROUND(SUM(o.Total_Amount), 2) AS Revenue
FROM Orders o
GROUP BY
    YEAR(o.Order_Date),
    MONTH(o.Order_Date)
ORDER BY
    Year,
    Month;