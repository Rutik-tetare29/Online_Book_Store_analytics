CREATE DATABASE Online_Book_Store;

USE Online_Book_Store;

CREATE TABLE Books (
    Book_ID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(150) NOT NULL,
    Genre VARCHAR(100) NOT NULL,
    Published_Year INT,
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT DEFAULT 0
);

CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    Phone VARCHAR(20),
    City VARCHAR(100),
    Country VARCHAR(100) NOT NULL
);

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Book_ID INT NOT NULL,
    Order_Date DATE NOT NULL,
    Quantity INT NOT NULL,
    Total_Amount DECIMAL(10, 2) NOT NULL,

    FOREIGN KEY (Customer_ID)
        REFERENCES Customers (Customer_ID),

    FOREIGN KEY (Book_ID)
        REFERENCES Books (Book_ID)
);

DESCRIBE Books;

DESCRIBE Customers;

DESCRIBE Orders;

SHOW CREATE TABLE Orders;