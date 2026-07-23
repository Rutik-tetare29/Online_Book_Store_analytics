# ============================
# Views
# ============================

USE online_book_store;

# Customer Orders View
CREATE VIEW vw_CustomerOrders AS
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
    ON o.Book_ID = b.Book_ID;

# View Customer Orders
SELECT *
FROM vw_CustomerOrders;

# Genre Revenue View
CREATE VIEW vw_GenreRevenue AS
SELECT
    b.Genre,
    SUM(o.Total_Amount) AS Revenue
FROM Orders o
INNER JOIN Books b
    ON o.Book_ID = b.Book_ID
GROUP BY b.Genre;

# View Genre Revenue
SELECT *
FROM vw_GenreRevenue
ORDER BY Revenue DESC;

# Customer Spending View
CREATE VIEW vw_CustomerSpending AS
SELECT
    c.Customer_ID,
    c.Name,
    SUM(o.Total_Amount) AS Total_Spent
FROM Customers c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
GROUP BY
    c.Customer_ID,
    c.Name;

# View Customer Spending
SELECT *
FROM vw_CustomerSpending
ORDER BY Total_Spent DESC;

# Best Selling Books View
CREATE VIEW vw_BestSellingBooks AS
SELECT
    b.Title,
    SUM(o.Quantity) AS Books_Sold
FROM Orders o
JOIN Books b
    ON o.Book_ID = b.Book_ID
GROUP BY b.Title;

# View Best Selling Books
SELECT *
FROM vw_BestSellingBooks
ORDER BY Books_Sold DESC;

# Monthly Sales View
CREATE VIEW vw_MonthlySales AS
SELECT
    YEAR(Order_Date) AS Year,
    MONTH(Order_Date) AS Month,
    SUM(Total_Amount) AS Revenue
FROM Orders
GROUP BY
    YEAR(Order_Date),
    MONTH(Order_Date);

# View Monthly Sales
SELECT *
FROM vw_MonthlySales
ORDER BY
    Year,
    Month;

# Top Customers View
CREATE VIEW vw_TopCustomers AS
SELECT
    c.Name,
    SUM(o.Total_Amount) AS Revenue
FROM Customers c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
GROUP BY c.Name;

# View Top Customers
SELECT *
FROM vw_TopCustomers
ORDER BY Revenue DESC;

# ============================
# Stored Procedures
# ============================

# Procedure: Get Orders By Customer
DELIMITER $$

CREATE PROCEDURE GetCustomerOrders(
    IN customer_id INT
)
BEGIN

    SELECT
        o.Order_ID,
        b.Title,
        o.Quantity,
        o.Total_Amount,
        o.Order_Date
    FROM Orders o
    JOIN Books b
        ON o.Book_ID = b.Book_ID
    WHERE o.Customer_ID = customer_id;

END $$

DELIMITER ;

# Execute Procedure
CALL GetCustomerOrders(13);

# Procedure: Get Books By Genre
DELIMITER $$

CREATE PROCEDURE GetBooksByGenre(
    IN genre_name VARCHAR(100)
)
BEGIN

    SELECT *
    FROM Books
    WHERE Genre = genre_name;

END $$

DELIMITER ;

# Execute Procedure
CALL GetBooksByGenre('Fantasy');

# Procedure: Monthly Revenue
DELIMITER $$

CREATE PROCEDURE MonthlyRevenue()
BEGIN

    SELECT
        YEAR(Order_Date) AS Year,
        MONTH(Order_Date) AS Month,
        SUM(Total_Amount) AS Revenue
    FROM Orders
    GROUP BY
        YEAR(Order_Date),
        MONTH(Order_Date)
    ORDER BY
        Year,
        Month;

END $$

DELIMITER ;

# Execute Procedure
CALL MonthlyRevenue();

# ============================
# Indexes
# ============================

# Index on Customer_ID
CREATE INDEX idx_customer
ON Orders(Customer_ID);

# Index on Book_ID
CREATE INDEX idx_book
ON Orders(Book_ID);

# Composite Index
CREATE INDEX idx_customer_date
ON Orders(Customer_ID, Order_Date);

# Index on Genre
CREATE INDEX idx_genre
ON Books(Genre);

# Index on Author
CREATE INDEX idx_author
ON Books(Author);

# ============================
# Query Optimization
# ============================

# Check Query Execution Plan
EXPLAIN
SELECT *
FROM Orders
WHERE Customer_ID = 10;

# Optimized Query (Avoid SELECT *)
SELECT
    Order_ID,
    Customer_ID,
    Total_Amount
FROM Orders;

# Explain Optimized Query
EXPLAIN
SELECT
    Order_ID,
    Customer_ID,
    Total_Amount
FROM Orders
WHERE Customer_ID = 10;

# ============================
# Database Maintenance
# ============================

# Show All Views
SHOW FULL TABLES
WHERE Table_type = 'VIEW';

# Show Stored Procedures
SHOW PROCEDURE STATUS
WHERE Db = 'online_book_store';

# Show Indexes on Orders Table
SHOW INDEX
FROM Orders;

# Show Indexes on Books Table
SHOW INDEX
FROM Books;

# ============================
# Drop Objects (Optional)
# ============================

# Drop View
DROP VIEW IF EXISTS vw_TopCustomers;

# Drop Procedure
DROP PROCEDURE IF EXISTS GetCustomerOrders;

# Drop Indexes (if required)

DROP INDEX idx_customer ON Orders;

DROP INDEX idx_book ON Orders;

DROP INDEX idx_customer_date ON Orders;

DROP INDEX idx_genre ON Books;

DROP INDEX idx_author ON Books;