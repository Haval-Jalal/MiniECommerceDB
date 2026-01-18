IF NOT EXISTS (
    SELECT name 
    FROM sys.databases 
    WHERE name = 'MiniECommerceDB'
)

CREATE DATABASE MiniECommerceDB;


USE MiniECommerceDB;



--CREATE TABLE Category (
--    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
--    Name NVARCHAR(100) NOT NULL,
--    Description NVARCHAR(255),
--    CONSTRAINT UQ_Category_Name UNIQUE (Name)
--);

--CREATE TABLE Customer (
--    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
--    Email NVARCHAR(255) NOT NULL,
--    FirstName NVARCHAR(100) NOT NULL,
--    LastName NVARCHAR(100) NOT NULL,
--    CONSTRAINT UQ_Customer_Email UNIQUE (Email)
--);

--CREATE TABLE Product (
--    ProductID INT IDENTITY(1,1) PRIMARY KEY,
--    CategoryID INT NOT NULL,
--    Name NVARCHAR(150) NOT NULL,
--    Description NVARCHAR(255),
--    IsActive BIT NOT NULL DEFAULT 1,
--    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
--    CONSTRAINT FK_Product_Category 
--        FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
--);

--CREATE TABLE Inventory (
--    InventoryID INT IDENTITY(1,1) PRIMARY KEY,
--    ProductID INT NOT NULL,
--    CONSTRAINT UQ_Inventory_Product UNIQUE (ProductID),
--    CONSTRAINT FK_Inventory_Product 
--        FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
--);

--CREATE TABLE [Order] (
--    OrderID INT IDENTITY(1,1) PRIMARY KEY,
--    CustomerID INT NOT NULL,
--    OrderDate DATETIME NOT NULL DEFAULT GETDATE(),
--    Status NVARCHAR(50) NOT NULL,
--    TotalAmount DECIMAL(10,2) NOT NULL CHECK (TotalAmount >= 0),
--    CONSTRAINT FK_Order_Customer 
--        FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
--);

--CREATE TABLE OrderItem (
--    OrderItemID INT IDENTITY(1,1) PRIMARY KEY,
--    OrderID INT NOT NULL,
--    ProductID INT NOT NULL,
--    Quantity INT NOT NULL CHECK (Quantity > 0),
--    UnitPrice DECIMAL(10,2) NOT NULL CHECK (UnitPrice >= 0),
--    CONSTRAINT FK_OrderItem_Order 
--        FOREIGN KEY (OrderID) REFERENCES [Order](OrderID),
--    CONSTRAINT FK_OrderItem_Product 
--        FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
--    CONSTRAINT UQ_OrderItem UNIQUE (OrderID, ProductID)
--);

--CREATE TABLE Payment (
--    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
--    OrderID INT NOT NULL,
--    CONSTRAINT UQ_Payment_Order UNIQUE (OrderID),
--    CONSTRAINT FK_Payment_Order 
--        FOREIGN KEY (OrderID) REFERENCES [Order](OrderID)
--);


--INSERT INTO Category (Name, Description) VALUES
--('Shoes', 'All types of shoes'),
--('Shirts', 'Casual and formal shirts'),
--('Accessories', 'Belts, caps and bags'),
--('Sportswear', 'Clothing for training and gym'),
--('Outerwear', 'Jackets and coats');


--INSERT INTO Customer (Email, FirstName, LastName) VALUES
--('anna.svensson@example.com', 'Anna', 'Svensson'),
--('erik.johansson@example.com', 'Erik', 'Johansson'),
--('lisa.nilsson@example.com', 'Lisa', 'Nilsson'),
--('markus.larsson@example.com', 'Markus', 'Larsson'),
--('emma.karlsson@example.com', 'Emma', 'Karlsson');


--INSERT INTO Product (CategoryID, Name, Description, IsActive) VALUES
--(1, 'Running Shoes', 'Lightweight running shoes', 1),
--(1, 'Sneakers', 'Everyday sneakers', 1),
--(2, 'White Shirt', 'Classic white shirt', 1),
--(2, 'Black T-Shirt', 'Basic black t-shirt', 1),
--(3, 'Leather Belt', 'Genuine leather belt', 1),
--(3, 'Baseball Cap', 'Adjustable cap', 1),
--(4, 'Training Shorts', 'Breathable sports shorts', 1),
--(4, 'Hoodie', 'Warm training hoodie', 1),
--(5, 'Winter Jacket', 'Waterproof winter jacket', 1),
--(5, 'Rain Coat', 'Lightweight rain coat', 1);


--INSERT INTO Inventory (ProductID) VALUES
--(1),(2),(3),(4),(5),(6),(7),(8),(9),(10);


--INSERT INTO [Order] (CustomerID, Status, TotalAmount) VALUES
--(1, 'Pending', 0),
--(2, 'Paid', 0),
--(3, 'Paid', 0),
--(4, 'Pending', 0),
--(5, 'Paid', 0);


--INSERT INTO OrderItem (OrderID, ProductID, Quantity, UnitPrice) VALUES
--(1, 1, 2, 799.00),
--(1, 5, 1, 299.00),

--(2, 3, 1, 499.00),
--(2, 6, 2, 199.00),

--(3, 2, 1, 699.00),
--(3, 7, 1, 349.00),
--(3, 8, 1, 599.00),

--(4, 4, 3, 149.00),

--(5, 9, 1, 1299.00),
--(5, 10, 1, 899.00);


--INSERT INTO Payment (OrderID) VALUES
--(2),
--(3),
--(5);

SELECT * FROM Category;

SELECT Name, COUNT(*) AS CountPerCategory
FROM Category
GROUP BY Name;

SELECT * FROM Customer;

SELECT Email, COUNT(*) AS CountPerEmail
FROM Customer
GROUP BY Email;

SELECT 
    p.ProductID,
    p.Name AS ProductName,
    c.Name AS CategoryName
FROM Product p
JOIN Category c ON p.CategoryID = c.CategoryID;

SELECT 
    c.Name AS CategoryName,
    COUNT(p.ProductID) AS ProductCount
FROM Category c
LEFT JOIN Product p ON c.CategoryID = p.CategoryID
GROUP BY c.Name;

SELECT 
    i.InventoryID,
    p.Name AS ProductName
FROM Inventory i
JOIN Product p ON i.ProductID = p.ProductID;

SELECT ProductID, COUNT(*) AS InventoryCount
FROM Inventory
GROUP BY ProductID;

SELECT 
    o.OrderID,
    c.FirstName,
    c.LastName,
    o.Status,
    o.OrderDate
FROM [Order] o
JOIN Customer c ON o.CustomerID = c.CustomerID;

SELECT 
    c.Email,
    COUNT(o.OrderID) AS OrderCount
FROM Customer c
LEFT JOIN [Order] o ON c.CustomerID = o.CustomerID
GROUP BY c.Email;

