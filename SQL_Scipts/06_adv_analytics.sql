# ============================
# 1 – Subqueries
# ============================

USE online_book_store;

# Books More Expensive Than the Average Price
SELECT
    Book_ID,
    Title,
    Price
FROM Books
WHERE Price > (
    SELECT AVG(Price)
    FROM Books
);

# Customers Who Spent More Than the Average Customer
SELECT
    Customer_ID,
    Name
FROM Customers
WHERE Customer_ID IN (
    SELECT Customer_ID
    FROM Orders
    GROUP BY Customer_ID
    HAVING SUM(Total_Amount) > (
        SELECT AVG(Customer_Total)
        FROM (
            SELECT
                SUM(Total_Amount) AS Customer_Total
            FROM Orders
            GROUP BY Customer_ID
        ) AS AvgTable
    )
);

# Books Never Sold
SELECT
    Title
FROM Books
WHERE Book_ID NOT IN (
    SELECT Book_ID
    FROM Orders
);

# Customers Who Never Purchased
SELECT
    Name
FROM Customers
WHERE Customer_ID NOT IN (
    SELECT Customer_ID
    FROM Orders
);

# ============================
# 2 – Common Table Expressions (CTEs)
# ============================

# Revenue by Genre
WITH GenreRevenue AS (
    SELECT
        b.Genre,
        SUM(o.Total_Amount) AS Revenue
    FROM Orders o
    JOIN Books b
        ON o.Book_ID = b.Book_ID
    GROUP BY b.Genre
)

SELECT *
FROM GenreRevenue
ORDER BY Revenue DESC;

# Top Spending Customers
WITH CustomerRevenue AS (
    SELECT
        c.Name,
        SUM(o.Total_Amount) AS Revenue
    FROM Customers c
    JOIN Orders o
        ON c.Customer_ID = o.Customer_ID
    GROUP BY c.Name
)

SELECT *
FROM CustomerRevenue
ORDER BY Revenue DESC;

# Monthly Revenue
WITH MonthlySales AS (
    SELECT
        YEAR(Order_Date) AS Year,
        MONTH(Order_Date) AS Month,
        SUM(Total_Amount) AS Revenue
    FROM Orders
    GROUP BY
        YEAR(Order_Date),
        MONTH(Order_Date)
)

SELECT *
FROM MonthlySales
ORDER BY
    Year,
    Month;

# ============================
# 3 – Window Functions
# ============================

# Rank Books by Revenue
SELECT
    b.Title,
    SUM(o.Total_Amount) AS Revenue,
    RANK() OVER (
        ORDER BY SUM(o.Total_Amount) DESC
    ) AS Revenue_Rank
FROM Orders o
JOIN Books b
    ON o.Book_ID = b.Book_ID
GROUP BY b.Title;

# Dense Rank Customers
SELECT
    c.Name,
    SUM(o.Total_Amount) AS Revenue,
    DENSE_RANK() OVER (
        ORDER BY SUM(o.Total_Amount) DESC
    ) AS Customer_Rank
FROM Customers c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
GROUP BY c.Name;

# Row Number
SELECT
    Book_ID,
    Title,
    ROW_NUMBER() OVER (
        ORDER BY Price DESC
    ) AS Row_No
FROM Books;

# Running Revenue
SELECT
    Order_Date,
    Total_Amount,
    SUM(Total_Amount) OVER (
        ORDER BY Order_Date
    ) AS Running_Revenue
FROM Orders;

# Running Quantity Sold
SELECT
    Order_Date,
    Quantity,
    SUM(Quantity) OVER (
        ORDER BY Order_Date
    ) AS Running_Quantity
FROM Orders;

# ============================
# 4 – PARTITION BY
# ============================

# Rank Books Within Each Genre
SELECT
    Genre,
    Title,
    Price,
    RANK() OVER (
        PARTITION BY Genre
        ORDER BY Price DESC
    ) AS Genre_Rank
FROM Books;

# Rank Customers by Country
SELECT
    Country,
    Name,
    ROW_NUMBER() OVER (
        PARTITION BY Country
        ORDER BY Name
    ) AS Country_Rank
FROM Customers;

# ============================
# 5 – Business Reports
# ============================

# Top 3 Books by Revenue
WITH RevenueReport AS (
    SELECT
        b.Title,
        SUM(o.Total_Amount) AS Revenue,
        RANK() OVER (
            ORDER BY SUM(o.Total_Amount) DESC
        ) AS Ranking
    FROM Orders o
    JOIN Books b
        ON o.Book_ID = b.Book_ID
    GROUP BY b.Title
)

SELECT *
FROM RevenueReport
WHERE Ranking <= 3;

# Top Customer in Each Country
WITH CustomerSales AS (
    SELECT
        c.Country,
        c.Name,
        SUM(o.Total_Amount) AS Revenue,
        ROW_NUMBER() OVER (
            PARTITION BY c.Country
            ORDER BY SUM(o.Total_Amount) DESC
        ) AS Ranking
    FROM Customers c
    JOIN Orders o
        ON c.Customer_ID = o.Customer_ID
    GROUP BY
        c.Country,
        c.Name
)

SELECT *
FROM CustomerSales
WHERE Ranking = 1;

# Monthly Revenue Ranking
WITH MonthlyRevenue AS (
    SELECT
        YEAR(Order_Date) AS Year,
        MONTH(Order_Date) AS Month,
        SUM(Total_Amount) AS Revenue
    FROM Orders
    GROUP BY
        YEAR(Order_Date),
        MONTH(Order_Date)
)

SELECT
    *,
    RANK() OVER (
        ORDER BY Revenue DESC
    ) AS Revenue_Rank
FROM MonthlyRevenue;

# Top Selling Genre
WITH GenreSales AS (
    SELECT
        b.Genre,
        SUM(o.Quantity) AS Books_Sold
    FROM Orders o
    JOIN Books b
        ON o.Book_ID = b.Book_ID
    GROUP BY b.Genre
)

SELECT *
FROM GenreSales
ORDER BY Books_Sold DESC
LIMIT 1;