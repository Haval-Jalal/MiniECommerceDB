-- 05_CRUD_Select.sql
-- Demonstrates SELECT queries for main tables and relationships

-- Select all customers
SELECT CustomerID, Email, FirstName, LastName
FROM Customer;

-- Select all active products
SELECT ProductID, Name, IsActive
FROM Product
WHERE IsActive = 1;

-- Select orders that are still pending
SELECT OrderID, CustomerID, Status, OrderDate
FROM [Order]
WHERE Status = 'Pending';

-- Select orders with customer details
SELECT
    o.OrderID,
    c.FirstName,
    c.LastName,
    o.Status,
    o.OrderDate
FROM [Order] o
JOIN Customer c ON o.CustomerID = c.CustomerID;

-- Select products included in each order
SELECT
    o.OrderID,
    p.Name AS ProductName,
    oi.Quantity,
    oi.UnitPrice
FROM OrderItem oi
JOIN [Order] o ON oi.OrderID = o.OrderID
JOIN Product p ON oi.ProductID = p.ProductID;

-- Count products per order
SELECT
    o.OrderID,
    SUM(oi.Quantity) AS TotalItems
FROM [Order] o
JOIN OrderItem oi ON o.OrderID = oi.OrderID
GROUP BY o.OrderID;