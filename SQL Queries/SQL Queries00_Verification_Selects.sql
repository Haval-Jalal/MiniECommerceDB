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

