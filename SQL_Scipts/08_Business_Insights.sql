# ============================
# Final Business Insights Report
# ============================

USE online_book_store;

# ==========================================
# 1. Overall Business Performance
# ==========================================

SELECT
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    ROUND(SUM(Total_Amount),2) AS Total_Revenue,
    SUM(Quantity) AS Total_Books_Sold
FROM Orders;

# ==========================================
# 2. Top 5 Best Selling Books
# ==========================================

SELECT
    b.Title,
    b.Author,
    SUM(o.Quantity) AS Books_Sold,
    ROUND(SUM(o.Total_Amount),2) AS Revenue
FROM Orders o
JOIN Books b
    ON o.Book_ID = b.Book_ID
GROUP BY
    b.Title,
    b.Author
ORDER BY Revenue DESC
LIMIT 5;

# ==========================================
# 3. Top 5 Customers
# ==========================================

SELECT
    c.Name,
    c.Country,
    COUNT(o.Order_ID) AS Total_Orders,
    ROUND(SUM(o.Total_Amount),2) AS Total_Spent
FROM Customers c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
GROUP BY
    c.Name,
    c.Country
ORDER BY Total_Spent DESC
LIMIT 5;

# ==========================================
# 4. Revenue by Genre
# ==========================================

SELECT
    b.Genre,
    SUM(o.Quantity) AS Books_Sold,
    ROUND(SUM(o.Total_Amount),2) AS Revenue
FROM Orders o
JOIN Books b
    ON o.Book_ID = b.Book_ID
GROUP BY b.Genre
ORDER BY Revenue DESC;

# ==========================================
# 5. Revenue by Author
# ==========================================

SELECT
    b.Author,
    ROUND(SUM(o.Total_Amount),2) AS Revenue
FROM Orders o
JOIN Books b
    ON o.Book_ID = b.Book_ID
GROUP BY b.Author
ORDER BY Revenue DESC;

# ==========================================
# 6. Monthly Revenue
# ==========================================

SELECT
    YEAR(Order_Date) AS Year,
    MONTH(Order_Date) AS Month,
    ROUND(SUM(Total_Amount),2) AS Revenue
FROM Orders
GROUP BY
    YEAR(Order_Date),
    MONTH(Order_Date)
ORDER BY
    Year,
    Month;

# ==========================================
# 7. Inventory Status
# ==========================================

SELECT
    Title,
    Stock
FROM Books
WHERE Stock < 10
ORDER BY Stock;

# ==========================================
# 8. Unsold Books
# ==========================================

SELECT
    b.Book_ID,
    b.Title,
    b.Author
FROM Books b
LEFT JOIN Orders o
    ON b.Book_ID = o.Book_ID
WHERE o.Book_ID IS NULL;

# ==========================================
# 9. Customers Without Orders
# ==========================================

SELECT
    c.Customer_ID,
    c.Name,
    c.Country
FROM Customers c
LEFT JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
WHERE o.Customer_ID IS NULL;

# ==========================================
# 10. Business Recommendations Dataset
# ==========================================

SELECT
    b.Genre,
    COUNT(DISTINCT b.Book_ID) AS Total_Books,
    SUM(o.Quantity) AS Books_Sold,
    ROUND(SUM(o.Total_Amount),2) AS Revenue,
    ROUND(AVG(b.Price),2) AS Avg_Price
FROM Books b
LEFT JOIN Orders o
    ON b.Book_ID = o.Book_ID
GROUP BY b.Genre
ORDER BY Revenue DESC;