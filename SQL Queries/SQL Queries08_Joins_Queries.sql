USE MiniECommerceDB;

-- 08_Joins_Queries.sql
-- Advanced JOIN, aggregation and business-related queries

-- Orders with customer details
SELECT
    o.OrderID,
    c.FirstName,
    c.LastName,
    o.Status,
    o.OrderDate
FROM [Order] o
JOIN Customer c ON o.CustomerID = c.CustomerID;

-- Products and their categories
SELECT
    p.ProductID,
    p.Name AS ProductName,
    cat.Name AS CategoryName
FROM Product p
JOIN Category cat ON p.CategoryID = cat.CategoryID;

-- Products included in orders
SELECT
    oi.OrderID,
    p.Name AS ProductName,
    oi.Quantity,
    oi.UnitPrice
FROM OrderItem oi
JOIN Product p ON oi.ProductID = p.ProductID;

-- Orders and payment status
SELECT
    o.OrderID,
    o.Status,
    pay.PaymentID
FROM [Order] o
LEFT JOIN Payment pay ON o.OrderID = pay.OrderID;

-- Orders with product details (3-table join)
SELECT
    o.OrderID,
    p.Name AS ProductName,
    oi.Quantity
FROM [Order] o
JOIN OrderItem oi ON o.OrderID = oi.OrderID
JOIN Product p ON oi.ProductID = p.ProductID;

 --Total order value per order
SELECT
    o.OrderID,
    SUM(oi.Quantity * oi.UnitPrice) AS OrderTotal
FROM [Order] o
JOIN OrderItem oi ON o.OrderID = oi.OrderID
GROUP BY o.OrderID;

 --Customers with more than one order
SELECT
    c.Email,
    COUNT(o.OrderID) AS OrderCount
FROM Customer c
JOIN [Order] o ON c.CustomerID = o.CustomerID
GROUP BY c.Email
HAVING COUNT(o.OrderID) > 1;

-- Products that have never been ordered
SELECT
    ProductID,
    Name
FROM Product
WHERE ProductID NOT IN (
    SELECT DISTINCT ProductID
    FROM OrderItem
);

 --Customers with unpaid orders
SELECT DISTINCT
    c.FirstName,
    c.LastName,
    c.Email
FROM Customer c
JOIN [Order] o ON c.CustomerID = o.CustomerID
LEFT JOIN Payment p ON o.OrderID = p.OrderID
WHERE p.PaymentID IS NULL;